// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/media_item.dart';
import '../../provider/media_provider.dart';
import '../../widgets/custom_image_widget.dart';
import 'media_detail_screen.dart';

class MediaGrid extends StatelessWidget {
  const MediaGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MediaProvider>(
      builder: (context, provider, child) {
        final items = provider.filteredItems;

        if (provider.viewState == .loading && items.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (provider.viewState == ViewState.error) {
          return Center(
            child: Column(
              mainAxisAlignment: .center,
              children: [
                const Icon(Icons.wifi_off, size: 64, color: Colors.redAccent),
                const SizedBox(height: 16),
                Text(
                  provider.errorMessage ??
                      'Something went wrong, please try again',
                  textAlign: .center,
                  style: const TextStyle(fontSize: 16, color: Colors.redAccent),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () => provider.retry(),
                  child: const Text('RETRY'),
                ),
              ],
            ),
          );
        }

        if (provider.viewState == .empty) {
          return Center(
            child: Column(
              mainAxisAlignment: .center,
              children: [
                const Icon(Icons.inbox, size: 64, color: Colors.grey),
                const SizedBox(height: 16),
                Text(
                  items.isEmpty && provider.searchQuery.isNotEmpty
                      ? 'No results found for "${provider.searchQuery}"'
                      : 'No media items available',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          );
        }

        return CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(8),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1,
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  final item = items[index];
                  return _buildGridItem(context, item);
                }, childCount: items.length),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildGridItem(BuildContext context, MediaItem item) {
    return Hero(
      tag: 'media_${item.id}',
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, _, _) => MediaDetailScreen(item: item),
                transitionDuration: const Duration(milliseconds: 300),
                reverseTransitionDuration: const Duration(milliseconds: 300),
              ),
            );
          },
          borderRadius: .circular(8),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: .circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: .circular(8),
              child: Stack(
                fit: .expand,
                children: [
                  if (item.type == .image)
                    CustomImageWidget(
                      imageUrl: item.url,
                      aspectRatio: item.aspectRatio,
                    )
                  else
                    Stack(
                      alignment: .center,
                      children: [
                        CustomImageWidget(
                          imageUrl:
                              'https://picsum.photos/seed/${item.id}/300/200',
                          aspectRatio: item.aspectRatio,
                        ),
                        const Icon(
                          Icons.play_circle_fill,
                          color: Colors.white54,
                          size: 48,
                        ),
                      ],
                    ),
                  const SizedBox(height: 5),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Text(
                      item.title,
                      style: const TextStyle(
                        fontWeight: .bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  if (item.type == .video)
                    const Positioned(
                      top: 8,
                      right: 8,
                      child: Icon(
                        Icons.videocam,
                        color: Colors.blueAccent,
                        size: 20,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
