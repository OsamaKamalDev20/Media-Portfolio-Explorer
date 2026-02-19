import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/media_item.dart';

class CacheService {
  static const String _cacheKey = 'cached_media_items';
  static const String _searchQueryKey = 'last_search_query';
  static const String _filterKey = 'last_filter';

  final Map<String, List<MediaItem>> _memoryCache = {};

  // Memory cache (faster)
  void setInMemory(String key, List<MediaItem> items) {
    _memoryCache[key] = items;
  }

  List<MediaItem>? getFromMemory(String key) {
    return _memoryCache[key];
  }

  // Persistent cache using SharedPreferences
  Future<void> cacheItems(List<MediaItem> items) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final itemsJson = items.map((item) => jsonEncode(item.toJson())).toList();
      await prefs.setStringList(_cacheKey, itemsJson);

      // Also store in memory
      setInMemory('all', items);
    } catch (e) {
      print('Cache error: $e');
    }
  }

  Future<List<MediaItem>?> getCachedItems() async {
    try {
      // Try memory first
      final memoryItems = getFromMemory('all');
      if (memoryItems != null) return memoryItems;

      // Then try persistent storage
      final prefs = await SharedPreferences.getInstance();
      final itemsJson = prefs.getStringList(_cacheKey);

      if (itemsJson != null) {
        final items = itemsJson
            .map((jsonString) => MediaItem.fromJson(jsonDecode(jsonString)))
            .toList();

        // Store in memory for next time
        setInMemory('all', items);
        return items;
      }
    } catch (e) {
      print('Cache retrieval error: $e');
    }
    return null;
  }

  Future<void> saveSearchQuery(String query) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_searchQueryKey, query);
  }

  Future<String> getLastSearchQuery() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_searchQueryKey) ?? '';
  }

  Future<void> saveFilter(String filter) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_filterKey, filter);
  }

  Future<String> getLastFilter() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_filterKey) ?? 'all';
  }
}
