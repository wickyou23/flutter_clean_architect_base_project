import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:resources/resources.dart';

import '../app.dart';

extension BottomTabExtension on BottomTab {
  Widget get icon {
    final size = Size.fromHeight(Dimens.d24.responsive());
    switch (this) {
      case BottomTab.home:
        return Assets.images.homeTabIcon.svg(
          width: size.width,
          height: size.height,
        );
      case BottomTab.match:
        return Assets.images.matchesTabIcon.svg(
          width: size.width,
          height: size.height,
        );
      case BottomTab.leagues:
        return Assets.images.leaguesTabIcon.svg(
          width: size.width,
          height: size.height,
        );
      case BottomTab.live:
        return Assets.images.liveTabIcon.svg(
          width: size.width,
          height: size.height,
        );
    }
  }

  Widget get activedIcon {
    final size = Size.fromHeight(Dimens.d24.responsive());
    switch (this) {
      case BottomTab.home:
        return Assets.images.homeTabActivedIcon.svg(
          width: size.width,
          height: size.height,
        );
      case BottomTab.match:
        return Assets.images.matchesTabActivedIcon.svg(
          width: size.width,
          height: size.height,
        );
      case BottomTab.leagues:
        return Assets.images.leaguesTabActivedIcon.svg(
          width: size.width,
          height: size.height,
        );
      case BottomTab.live:
        return Assets.images.liveTabActivedIcon.svg(
          width: size.width,
          height: size.height,
        );
    }
  }

  String get title {
    switch (this) {
      case BottomTab.home:
        return S.current.home;
      case BottomTab.match:
        return S.current.match;
      case BottomTab.leagues:
        return S.current.leagues;
      case BottomTab.live:
        return S.current.live;
    }
  }
}
