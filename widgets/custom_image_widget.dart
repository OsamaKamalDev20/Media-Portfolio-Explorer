import 'package:flutter/material.dart';

class CustomImageWidget extends StatefulWidget {
  final String imageUrl;
  final double aspectRatio;
  final BoxFit fit;
  const CustomImageWidget({
    super.key,
    required this.imageUrl,
    required this.aspectRatio,
    this.fit = .cover,
  });

  @override
  State<CustomImageWidget> createState() => _CustomImageWidgetState();
}

class _CustomImageWidgetState extends State<CustomImageWidget> {
  bool _isLoading = true;
  bool _hasError = false;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widget.aspectRatio,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: .circular(8),
        ),
        clipBehavior: .antiAlias,
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    if (_hasError) {
      return _buildErrorWidget();
    }

    return Image.network(
      widget.imageUrl,
      fit: .cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return _buildLoadingWidget();
      },
      errorBuilder: (context, error, stackTree) {
        _hasError = true;
        return _buildErrorWidget();
      },
    );
  }

  Widget _buildLoadingWidget() {
    return const Center(
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: .center,
        children: [
          const Icon(Icons.error_outline, size: 42, color: Colors.red),
          const SizedBox(height: 8),
          const Text("Failed to load media", style: TextStyle(fontSize: 14)),
          const SizedBox(height: 4),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const .symmetric(horizontal: 8, vertical: 4),
              minimumSize: .zero,
              tapTargetSize: .shrinkWrap,
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              setState(() {
                _hasError = false;
                _isLoading = true;
              });
            },
            child: Text(
              "RETRY",
              style: TextStyle(fontSize: 15, fontWeight: .w700),
            ),
          ),
        ],
      ),
    );
  }
}
