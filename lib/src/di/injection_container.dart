import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pixabay_gallery/src/controllers/images_controller.dart';
import 'package:pixabay_gallery/src/network/network_manager.dart';
import 'package:pixabay_gallery/src/network/repository.dart';

void inject({
  required String apiKey,
  required String baseUrl,
}) {
  Get
    ..put(Dio())
    ..put(
      NetworkManager(dio: Get.find<Dio>(), apiKey: apiKey, baseUrl: baseUrl),
    )
    ..put<Repository>(
      NetworkRepository(networkManager: Get.find<NetworkManager>()),
    )
    ..lazyPut(() => ImagesController(repository: Get.find<Repository>()));
}
