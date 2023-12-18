import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class CommonHeroImageWidget extends StatelessWidget {
  const CommonHeroImageWidget(
      {required this.child, required this.image, super.key});

  final Widget child;
  final ImageGalleryItem image;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: image.id,
      child: child,
      flightShuttleBuilder:
          (context, animation, direction, fromContext, toContext) {
        final Hero fromHero = fromContext.widget as Hero;
        if (direction == HeroFlightDirection.pop) {
          final ValueKey<String> heroKey = fromHero.key as ValueKey<String>;
          if (heroKey.value == image.id) {
            return toContext.widget;
          }

          return FadeTransition(
            opacity: animation.drive(Tween<double>(begin: 1.0, end: 0.0).chain(
              CurveTween(
                curve: const Interval(0.0, 1.0, curve: Curves.easeInOut),
              ),
            )),
            child: toContext.widget,
          );
        }

        return toContext.widget;
      },
    );
  }
}
