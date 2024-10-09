import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixabay_gallery/src/model/pixbay_image.dart';
import 'package:pixabay_gallery/src/routes/routes.dart' as routes;
import 'package:pixabay_gallery/src/utils/context_exts.dart';
import 'package:pixabay_gallery/src/widgets/vignette_painter.dart';

class ImageItem extends StatelessWidget {
  const ImageItem({
    required this.image,
    super.key,
  });

  final PixbayImage image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => context.pushNamed<void>(
        routes.viewImage,
        arguments: image.largeImageUrl ?? '',
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: CachedNetworkImage(
              imageUrl: image.largeImageUrl ?? '',
              imageBuilder: (context, imageProvider) => CustomPaint(
                foregroundPainter: VignettePainter(),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            left: 8,
            child: Row(
              children: [
                count(count: image.likes ?? 0, icon: Icons.thumb_up),
                count(count: image.views ?? 0, icon: Icons.remove_red_eye),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget count({
    required int count,
    required IconData icon,
  }) =>
      Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Row(
          children: [
            Icon(
              icon,
              color: Get.theme.colorScheme.onSecondary,
              size: 16,
            ),
            const SizedBox(width: 4),
            Text(
              convertToThousandsString(count),
              style: Get.theme.textTheme.labelLarge?.copyWith(
                color: Get.theme.colorScheme.onSecondary,
              ),
            ),
          ],
        ),
      );

  String convertToThousandsString(int number) {
    if (number >= 1000) {
      final result = number / 1000;
      return '${result.toStringAsFixed(1)}K';
    } else {
      return number.toString();
    }
  }
}
