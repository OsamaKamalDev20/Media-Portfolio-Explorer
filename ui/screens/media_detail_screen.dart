import 'package:flutter/material.dart';
import '../../models/media_item.dart';
import '../../widgets/custom_image_widget.dart';

class MediaDetailScreen extends StatelessWidget {
  final MediaItem item;

  const MediaDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            // Close button
            Positioned(
              top: 16,
              left: 16,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white, size: 28),
                onPressed: () => Navigator.pop(context),
              ),
            ),

            // Media content
            Center(
              child: Hero(
                tag: 'media_${item.id}',
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    width: .infinity,
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.7,
                    ),
                    child: item.type == MediaType.image
                        ? CustomImageWidget(
                            imageUrl: item.url,
                            aspectRatio: item.aspectRatio,
                            fit: .contain,
                          )
                        : Stack(
                            alignment: .center,
                            children: [
                              CustomImageWidget(
                                imageUrl:
                                    'https://picsum.photos/seed/${item.id}/800/600',
                                aspectRatio: item.aspectRatio,
                                fit: .contain,
                              ),
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  // ignore: deprecated_member_use
                                  color: Colors.white12,
                                  shape: .circle,
                                ),
                                child: const Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                  size: 48,
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ),

            // Info panel
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withOpacity(0.9)],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      item.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            item.type == MediaType.image ? 'Image' : 'Video',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Aspect Ratio: ${item.aspectRatio.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
