import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pixabay_gallery/src/controllers/images_controller.dart';
import 'package:pixabay_gallery/src/model/pixbay_image.dart';
import 'package:pixabay_gallery/src/widgets/image_item.dart';

class HomeScreen extends GetView<ImagesController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pixabay Gallery'),
        actions: [
          Obx(
            () => Row(
              children: [
                Text(
                  'Editors Choice',
                  style: Get.theme.textTheme.bodyLarge?.copyWith(
                    color: Get.theme.appBarTheme.titleTextStyle?.color,
                  ),
                ),
                Checkbox(
                  value: controller.editorsChoice.value,
                  onChanged: (value) {
                    controller.editorsChoice.value = value ?? false;
                  },
                ),
                const SizedBox(width: 16),
              ],
            ),
          )
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return PagedGridView<int, PixbayImage>(
            pagingController: controller.pagingController,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
            ),
            builderDelegate: PagedChildBuilderDelegate(
              itemBuilder: (context, item, index) => ImageItem(
                image: item,
              ),
              firstPageProgressIndicatorBuilder: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
              newPageProgressIndicatorBuilder: (context) => const SizedBox(),
            ),
          );
        },
      ),
    );
  }

  int get crossAxisCount {
    final width = Get.width;
    if (width < 700) {
      return 3;
    } else if (width < 1000) {
      return 4;
    } else if (width < 1300) {
      return 5;
    } else if (width < 1600) {
      return 6;
    } else if (width < 1900) {
      return 7;
    } else if (width < 2200) {
      return 8;
    } else if (width < 2500) {
      return 8;
    }

    return 9;
  }
}
