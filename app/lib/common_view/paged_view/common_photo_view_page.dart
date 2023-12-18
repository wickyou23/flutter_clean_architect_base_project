import 'package:auto_route/auto_route.dart';
import 'package:dismissible_page/dismissible_page.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app.dart';
import '../../base/bloc/value_cubit.dart';
import '../../third_party/photo_view/photo_view_gallery.dart';
import '../../third_party/photo_view/src/photo_view_computed_scale.dart';
import '../../third_party/photo_view/src/utils/photo_view_hero_attributes.dart';

@RoutePage()
class CommonPhotoViewPage extends StatefulWidget {
  const CommonPhotoViewPage({
    required this.images,
    required this.selectedImage,
    super.key,
  });

  final List<ImageGalleryItem> images;
  final ImageGalleryItem selectedImage;

  @override
  State<CommonPhotoViewPage> createState() => _CommonPhotoViewPageState();
}

class _CommonPhotoViewPageState extends State<CommonPhotoViewPage> {
  late final PageController _pageController;
  late final ValueCubit<int> _currentPage;

  @override
  void initState() {
    final initPage = widget.images
        .indexWhere((element) => widget.selectedImage.id == element.id);

    _currentPage = ValueCubit.value(initPage);
    _pageController = PageController(
      viewportFraction: 1.1,
      initialPage: initPage,
    );

    super.initState();
  }

  @override
  void dispose() {
    _currentPage.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          DismissiblePage(
            onDismissed: () {
              context.read<AppNavigator>().pop();
            },
            isFullScreen: false,
            direction: DismissiblePageDismissDirection.vertical,
            child: PhotoViewGallery.builder(
              pageController: _pageController,
              builder: (BuildContext context, int index) {
                final item = widget.images[index];
                return PhotoViewGalleryPageOptions(
                  imageProvider: item.isNetworkImage
                      ? NetworkImage(item.url!)
                      : item.image,
                  heroAttributes: PhotoViewHeroAttributes(
                    heroKey: ValueKey(item.id),
                    tag: widget.selectedImage.id,
                  ),
                  minScale: PhotoViewComputedScale.contained * 1.0,
                  maxScale: PhotoViewComputedScale.contained * 2.0,
                );
              },
              itemCount: widget.images.length,
              loadingBuilder: (context, event) => Center(
                child: SizedBox(
                  width: 20.0,
                  height: 20.0,
                  child: CircularProgressIndicator(
                    strokeWidth: Dimens.d2.responsive(),
                    value: event == null
                        ? 0
                        : event.cumulativeBytesLoaded /
                            event.expectedTotalBytes!,
                  ),
                ),
              ),
              backgroundDecoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              onPageChanged: (index) {
                _currentPage.value = index;
              },
            ),
          ),
          Column(
            children: [
              AppDimen.of(context).safePadding.top.heightBox(),
              SizedBox(
                height: Dimens.d56.responsive(),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        context.read<AppNavigator>().pop();
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                      iconSize: Dimens.d24.responsive(),
                    ),
                    BlocBuilder(
                      bloc: _currentPage,
                      builder: (context, _) {
                        return Expanded(
                          child: Center(
                            child: Text(
                              '${_currentPage.value + 1} of ${widget.images.length}',
                              style: AppTextStyles.title14().copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    Dimens.d32.widthBox(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NetworkImageGalleryItem {
  final String url;
  final String id;

  NetworkImageGalleryItem({required this.id, required this.url});
}
