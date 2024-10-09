import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class VeiwImageScreen extends StatelessWidget {
  const VeiwImageScreen({
    required this.imageUrl,
    super.key,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ColoredBox(
      color: Colors.black,
      child: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: InteractiveViewer(
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  progressIndicatorBuilder: (context, url, progress) => Center(
                    child: Text(
                      (progress.progress ?? 0).toStringAsFixed(2),
                      style:
                          Theme.of(context).textTheme.headlineLarge?.copyWith(
                                color: Colors.white,
                              ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.01,
              right: size.height * 0.01,
              child: IconButton.filled(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
