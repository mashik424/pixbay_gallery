import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pixabay_gallery/src/model/pixbay_image.dart';
import 'package:pixabay_gallery/src/network/repository.dart';

class ImagesController extends GetxController {
  ImagesController({required Repository repository}) : _repository = repository;

  final Repository _repository;
  final editorsChoice = false.obs;

  int perPage = 20;
  final _pagingController = PagingController<int, PixbayImage>(firstPageKey: 1);

  PagingController<int, PixbayImage> get pagingController => _pagingController;

  @override
  void onInit() {
    _pagingController.addPageRequestListener(getImages);
    editorsChoice.listen(
      (value) => _pagingController.refresh(),
    );
    super.onInit();
  }

  Future<void> getImages(int pageKey) async {
    try {
      final newItems = await _repository.getImages(
        page: pageKey,
        perPage: perPage,
        editorsChoice: editorsChoice.value,
      );
      final isLastPage = newItems.length < perPage;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (e) {
      Get.snackbar('Something went wrong', 'Could not load images');
      _pagingController.error = e;
    }
  }
}
