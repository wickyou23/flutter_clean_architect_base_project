import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_gallery_item.freezed.dart';

@freezed
class ImageGalleryItem with _$ImageGalleryItem {
  const ImageGalleryItem._();

  const factory ImageGalleryItem({
    required String? url,
    required ImageProvider? image,
    required String id,
  }) = _ImageGalleryItem;

  bool get isNetworkImage => url?.isNotEmpty == true && image == null;
}
