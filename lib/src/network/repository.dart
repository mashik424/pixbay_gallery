import 'package:pixabay_gallery/src/model/pixbay_image.dart';
import 'package:pixabay_gallery/src/network/network_manager.dart';

abstract class Repository {
  Future<List<PixbayImage>> getImages({
    required int page,
    int perPage = 20,
    bool editorsChoice = false,
  });
  Future<PixbayImage> getImage(String id);
  Future<dynamic> getVideos();
}

class NetworkRepository implements Repository {
  NetworkRepository({required NetworkManager networkManager})
      : _networkManager = networkManager;

  final NetworkManager _networkManager;

  @override
  Future<List<PixbayImage>> getImages({
    required int page,
    int perPage = 20,
    bool editorsChoice = false,
  }) async {
    final response = await _networkManager.get<Map<String, dynamic>>(
      path: '',
      params: {
        'page': page.toString(),
        'per_page': perPage.toString(),
        'editors_choice': editorsChoice.toString(),
        'orientation': 'horizontal',
        'image_type': 'photo',
        'min_width': '1280',
        'min_height': '720',
      },
    );

    return (response.data?['hits'] as List<dynamic>?)
            ?.map((e) => PixbayImage.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [];
  }

  @override
  Future<PixbayImage> getImage(String id) {
    throw UnimplementedError();
  }

  @override
  Future<dynamic> getVideos() {
    throw UnimplementedError();
  }
}
