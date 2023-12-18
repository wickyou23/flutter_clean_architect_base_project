import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:html/dom.dart' as dom;

import '../../../app.dart';
import '../../../utils/widget_extension.dart';
import '../../widgets/common_cached_network_image.dart';
import '../../widgets/common_hero_image_widget.dart';

part 'common_html_content_widget.html_constant.dart';

class CommonHTMLContentWidget extends StatelessWidget {
  const CommonHTMLContentWidget({
    required this.htmlContent,
    required this.navigator,
    super.key,
    this.onImage,
    this.onTapImage,
  });

  final String htmlContent;
  final AppNavigator navigator;
  final Function(ImageGalleryItem)? onImage;
  final Function(ImageGalleryItem)? onTapImage;

  @override
  Widget build(BuildContext context) {
    return HtmlWidget(
      htmlContent,
      textStyle: AppTextStyles.title14(),
      enableCaching: true,
      // customStylesBuilder: _CustomStyle.customStypeBuilder,
      factoryBuilder: () {
        return _CustomWidgetFactory(
          context: context,
          onImage: onImage,
          onTapImage: onTapImage,
        );
      },
      onTapUrl: (urlString) async {
        try {
          final url = Uri.parse(urlString);
          await navigator.push(AppRouteInfo.appWebview(url));
        } catch (e) {
          navigator.showErrorSnackBar('Error: ${e.toString()}');
        }

        return true;
      },
    );
  }
}

class _CustomStyle {
  static Map<String, String>? customStypeBuilder(dom.Element e) {
    if (e.localName == 'figure') {
      return {
        'display': 'flex',
        'flex-direction': 'column',
        'align-items': 'center',
        'margin': '1em 0px',
      };
    }

    return null;
  }
}

class _CustomWidgetFactory extends WidgetFactory {
  _CustomWidgetFactory({
    required this.context,
    this.onImage,
    this.onTapImage,
  });

  final BuildContext context;
  final Function(ImageGalleryItem)? onImage;
  final Function(ImageGalleryItem)? onTapImage;

  @override
  Widget? buildImageWidget(BuildTree tree, ImageSource src) {
    if (src.url.isEmpty) {
      return super.buildImageWidget(tree, src);
    }

    final image = ImageGalleryItem(
      url: src.url,
      image: null,
      id: src.url.hashCode.toString(),
    );

    return CommonHeroImageWidget(
      image: image,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Dimens.d4.responsive()),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: AppDimen.of(context).screenWidth * (9 / 16),
          ),
          child: CommonCachedNetworkImage(
            imageUrl: src.url,
            imageBuilder: (context, imageProvider) {
              onImage?.call(
                image.copyWith(image: imageProvider, url: null),
              );

              return Image(
                image: imageProvider,
                fit: BoxFit.cover,
                width: double.infinity,
              );
            },
          ),
        ),
      ),
    ).onTap(() {
      onTapImage?.call(image);
    });
  }

  @override
  Widget? buildDecoration(BuildTree tree, Widget child,
      {BoxBorder? border,
      BorderRadius? borderRadius,
      Color? color,
      DecorationImage? image}) {
    if (tree.element.className == CSSClassNameConstant.articleSummaryName) {
      return super.buildDecoration(
        tree,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimens.d16.responsive()),
          child: child,
        ),
        border: Border.all(
          color:
              AppColors.current.articleDetailsSummaryBox.borderColor.withAlpha(
            (255 * 0.5).toInt(),
          ),
        ),
        borderRadius: BorderRadius.circular(Dimens.d8.responsive()),
        color: AppColors.current.articleDetailsSummaryBox.backgroundColor
            .withAlpha(
          (255 * 0.15).toInt(),
        ),
        image: null,
      );
    }

    return super.buildDecoration(
      tree,
      child,
      border: border,
      borderRadius: borderRadius,
      color: color,
      image: image,
    );
  }

  @override
  void parse(BuildTree tree) {
    final e = tree.element;
    if (e.className == CSSClassNameConstant.articleSummaryName) {
      tree.register(
        BuildOp(
          defaultStyles: (_) => CSSStylesConstant.articleSummaryStyle,
        ),
      );
      return;
    }

    if (e.localName == HTMLTagConstant.kFigureTag) {
      tree.register(
        BuildOp(defaultStyles: (_) => CSSStylesConstant.figureStyle),
      );
    }
    if (e.localName == HTMLTagConstant.kFigcaption) {
      tree.register(
        BuildOp(defaultStyles: (_) => CSSStylesConstant.figcaptionStyle),
      );
    }

    return super.parse(tree);
  }
}
