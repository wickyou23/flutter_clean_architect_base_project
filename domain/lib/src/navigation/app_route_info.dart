import 'package:freezed_annotation/freezed_annotation.dart';

import '../entity/base/image_gallery_item.dart';

part 'app_route_info.freezed.dart';

/// page
@freezed
class AppRouteInfo with _$AppRouteInfo {
  const factory AppRouteInfo.login() = _Login;
  const factory AppRouteInfo.main() = _Main;
  const factory AppRouteInfo.search() = _Search;
  const factory AppRouteInfo.appWebview(Uri url) = _AppWebview;
  const factory AppRouteInfo.photoView(
          List<ImageGalleryItem> images, ImageGalleryItem selectedImage) =
      _AppPhotoView;
}
