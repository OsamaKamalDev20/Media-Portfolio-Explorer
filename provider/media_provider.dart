import 'dart:async';
import 'package:flutter/material.dart';
import '../models/media_item.dart';
import '../services/mock_api_service.dart';
import '../services/cache_service.dart';
import '../utils/debouncer.dart';

enum FilterType { all, images, videos }

enum ViewState { idle, loading, error, empty }

class MediaProvider extends ChangeNotifier {
  final MockApiService _apiService = MockApiService();
  final CacheService _cacheService = CacheService();
  final Debouncer _debouncer = Debouncer(
    duration: const Duration(milliseconds: 500),
  );

  List<MediaItem> _allItems = [];
  List<MediaItem> _filteredItems = [];
  FilterType _currentFilter = FilterType.all;
  String _searchQuery = '';
  ViewState _viewState = ViewState.idle;
  String? _errorMessage;

  // Getters
  List<MediaItem> get filteredItems => _filteredItems;
  FilterType get currentFilter => _currentFilter;
  ViewState get viewState => _viewState;
  String? get errorMessage => _errorMessage;
  String get searchQuery => _searchQuery;

  MediaProvider() {
    _initialize();
  }

  Future<void> _initialize() async {
    await loadCachedData();
  }

  Future<void> loadCachedData() async {
    try {
      _viewState = ViewState.loading;
      notifyListeners();

      // Try to load from cache first
      final cachedItems = await _cacheService.getCachedItems();
      if (cachedItems != null && cachedItems.isNotEmpty) {
        _allItems = cachedItems;
        _applyFilterAndSearch();
        _viewState = _filteredItems.isEmpty ? ViewState.empty : ViewState.idle;
        notifyListeners();
      }

      // Then fetch fresh data
      await fetchMediaItems(showLoading: false);
    } catch (e) {
      _errorMessage = 'Failed to load cache';
      _viewState = ViewState.error;
      notifyListeners();
    }
  }

  Future<void> fetchMediaItems({bool showLoading = true}) async {
    try {
      if (showLoading) {
        _viewState = ViewState.loading;
        notifyListeners();
      }

      final items = await _apiService.fetchMediaItems(query: _searchQuery);

      if (items.isEmpty) {
        _viewState = ViewState.empty;
      } else {
        _allItems = items;
        await _cacheService.cacheItems(items);
        _applyFilterAndSearch();
        _viewState = _filteredItems.isEmpty ? ViewState.empty : ViewState.idle;
      }

      _errorMessage = null;
      notifyListeners();
    } catch (e) {
      _errorMessage = 'Network error. Please check your connection.';
      _viewState = ViewState.error;
      notifyListeners();
    }
  }

  void search(String query) {
    _searchQuery = query;
    _cacheService.saveSearchQuery(query);

    _debouncer.run(() {
      _applyFilterAndSearch();
      // Fetch from API with debounced search
      fetchMediaItems(showLoading: false);
    });
  }

  void setFilter(FilterType filter) {
    if (_currentFilter != filter) {
      _currentFilter = filter;
      _cacheService.saveFilter(filter.name);
      _applyFilterAndSearch();
      notifyListeners();
    }
  }

  void _applyFilterAndSearch() {
    var filtered = List<MediaItem>.from(_allItems);

    // Apply filter
    switch (_currentFilter) {
      case FilterType.images:
        filtered = filtered
            .where((item) => item.type == MediaType.image)
            .toList();
        break;
      case FilterType.videos:
        filtered = filtered
            .where((item) => item.type == MediaType.video)
            .toList();
        break;
      case FilterType.all:
        break;
    }

    // Apply search
    if (_searchQuery.isNotEmpty) {
      filtered = filtered
          .where(
            (item) =>
                item.title.toLowerCase().contains(_searchQuery.toLowerCase()),
          )
          .toList();
    }

    _filteredItems = filtered;

    // Update view state
    if (_filteredItems.isEmpty && _allItems.isNotEmpty) {
      _viewState = ViewState.empty;
    } else if (_filteredItems.isNotEmpty) {
      _viewState = ViewState.idle;
    }
  }

  void retry() {
    fetchMediaItems();
  }

  @override
  void dispose() {
    _debouncer.dispose();
    super.dispose();
  }
}
