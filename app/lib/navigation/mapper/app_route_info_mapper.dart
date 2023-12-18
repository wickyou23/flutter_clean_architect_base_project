import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../app.dart';

@LazySingleton(as: BaseRouteInfoMapper)
class AppRouteInfoMapper extends BaseRouteInfoMapper {
  @override
  PageRouteInfo map(AppRouteInfo appRouteInfo) {
    return appRouteInfo.when(
      login: () => const LoginRoute(),
      main: () => const MainRoute(),
      search: () => const SearchRoute(),
      appWebview: (url) => AppWebviewRoute(url: url),
      photoView: (images, selectedImage) => CommonPhotoViewRoute(
        images: images,
        selectedImage: selectedImage,
      ),
    );
  }
}
