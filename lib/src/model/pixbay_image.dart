import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

@immutable
class PixbayImage {
  const PixbayImage({
    this.id,
    this.pageUrl,
    this.type,
    this.tags,
    this.previewUrl,
    this.previewWidth,
    this.previewHeight,
    this.webformatUrl,
    this.webformatWidth,
    this.webformatHeight,
    this.largeImageUrl,
    this.fullHdurl,
    this.imageUrl,
    this.imageWidth,
    this.imageHeight,
    this.imageSize,
    this.views,
    this.downloads,
    this.likes,
    this.comments,
    this.userId,
    this.user,
    this.userImageUrl,
  });

  factory PixbayImage.fromJson(Map<String, dynamic> json) => PixbayImage(
        id: json['id'] as int?,
        pageUrl: json['pageURL'] as String?,
        type: json['type'] as String?,
        tags: json['tags'] as String?,
        previewUrl: json['previewURL'] as String?,
        previewWidth: json['previewWidth'] as int?,
        previewHeight: json['previewHeight'] as int?,
        webformatUrl: json['webformatURL'] as String?,
        webformatWidth: json['webformatWidth'] as int?,
        webformatHeight: json['webformatHeight'] as int?,
        largeImageUrl: json['largeImageURL'] as String?,
        fullHdurl: json['fullHDURL'] as String?,
        imageUrl: json['imageURL'] as String?,
        imageWidth: json['imageWidth'] as int?,
        imageHeight: json['imageHeight'] as int?,
        imageSize: json['imageSize'] as int?,
        views: json['views'] as int?,
        downloads: json['downloads'] as int?,
        likes: json['likes'] as int?,
        comments: json['comments'] as int?,
        userId: json['user_id'] as int?,
        user: json['user'] as String?,
        userImageUrl: json['userImageURL'] as String?,
      );

  final int? id;
  final String? pageUrl;
  final String? type;
  final String? tags;
  final String? previewUrl;
  final int? previewWidth;
  final int? previewHeight;
  final String? webformatUrl;
  final int? webformatWidth;
  final int? webformatHeight;
  final String? largeImageUrl;
  final String? fullHdurl;
  final String? imageUrl;
  final int? imageWidth;
  final int? imageHeight;
  final int? imageSize;
  final int? views;
  final int? downloads;
  final int? likes;
  final int? comments;
  final int? userId;
  final String? user;
  final String? userImageUrl;

  Map<String, dynamic> toJson() => {
        'id': id,
        'pageURL': pageUrl,
        'type': type,
        'tags': tags,
        'previewURL': previewUrl,
        'previewWidth': previewWidth,
        'previewHeight': previewHeight,
        'webformatURL': webformatUrl,
        'webformatWidth': webformatWidth,
        'webformatHeight': webformatHeight,
        'largeImageURL': largeImageUrl,
        'fullHDURL': fullHdurl,
        'imageURL': imageUrl,
        'imageWidth': imageWidth,
        'imageHeight': imageHeight,
        'imageSize': imageSize,
        'views': views,
        'downloads': downloads,
        'likes': likes,
        'comments': comments,
        'user_id': userId,
        'user': user,
        'userImageURL': userImageUrl,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! PixbayImage) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      pageUrl.hashCode ^
      type.hashCode ^
      tags.hashCode ^
      previewUrl.hashCode ^
      previewWidth.hashCode ^
      previewHeight.hashCode ^
      webformatUrl.hashCode ^
      webformatWidth.hashCode ^
      webformatHeight.hashCode ^
      largeImageUrl.hashCode ^
      fullHdurl.hashCode ^
      imageUrl.hashCode ^
      imageWidth.hashCode ^
      imageHeight.hashCode ^
      imageSize.hashCode ^
      views.hashCode ^
      downloads.hashCode ^
      likes.hashCode ^
      comments.hashCode ^
      userId.hashCode ^
      user.hashCode ^
      userImageUrl.hashCode;
}
