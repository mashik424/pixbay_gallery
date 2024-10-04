import 'package:dio/dio.dart';

class NetworkManager {
  NetworkManager({
    required Dio dio,
    required String baseUrl,
    required String apiKey,
  })  : _dio = dio,
        _baseUrl = baseUrl,
        _apiKey = apiKey;

  final Dio _dio;
  final String _baseUrl;
  final String _apiKey;

  Future<Response<T>> get<T>({
    required String path,
    required Map<String, String>? params,
  }) async {
    final uri = Uri.parse(
      '$_baseUrl/$path',
    ).replace(queryParameters: {'key': _apiKey, ...params ?? {}});

    return _dio.get<T>(uri.toString());
  }
}
