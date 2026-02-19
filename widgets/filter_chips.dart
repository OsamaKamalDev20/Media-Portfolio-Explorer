// ignore_for_file: deprecated_member_use

import 'package:firebase_projects/Media%20Portfolio%20Explorer/provider/media_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterChips extends StatelessWidget {
  const FilterChips({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MediaProvider>(
      builder: (context, provider, child) {
        return Container(
          height: 50,
          padding: const .symmetric(horizontal: 16),
          child: ListView(
            scrollDirection: .horizontal,
            children: [
              _buildChip(
                context,
                label: "All",
                filter: FilterType.all,
                isSelected: provider.currentFilter == FilterType.all,
              ),
              const SizedBox(width: 20),
              _buildChip(
                context,
                label: "Images",
                filter: FilterType.images,
                isSelected: provider.currentFilter == FilterType.images,
              ),
              const SizedBox(width: 20),
              _buildChip(
                context,
                label: "Videos",
                filter: FilterType.videos,
                isSelected: provider.currentFilter == FilterType.videos,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildChip(
    BuildContext context, {
    required String label,
    required FilterType filter,
    required bool isSelected,
  }) {
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        if (selected) {
          context.read<MediaProvider>().setFilter(filter);
        }
      },
      backgroundColor: Colors.grey[100],
      selectedColor: Colors.blue,
      checkmarkColor: Colors.white,
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : Colors.black87,
        fontWeight: isSelected ? .bold : .normal,
      ),
      elevation: isSelected ? 2 : 0,
      pressElevation: 3,
      shadowColor: Colors.blue.withOpacity(0.3),
    );
  }
}
