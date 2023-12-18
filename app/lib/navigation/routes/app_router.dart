import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../app.dart';

// ignore_for_file:prefer-single-widget-per-file
@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
@LazySingleton()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: AppWebviewRoute.page),
        CustomRoute(
          page: CommonPhotoViewRoute.page,
          opaque: false,
          fullscreenDialog: true,
          barrierColor: Colors.transparent,
        ),
        AutoRoute(page: MainRoute.page, children: [
          AutoRoute(
            page: HomeTab.page,
            maintainState: true,
            children: [
              AutoRoute(page: HomeRoute.page, initial: true),
              AutoRoute(
                page: ItemDetailRoute.page,
                guards: [RouteGuard(GetIt.instance.get<IsLoggedInUseCase>())],
              ),
            ],
          ),
          AutoRoute(
            page: GameTab.page,
            maintainState: true,
            children: [
              AutoRoute(page: MatchRoute.page, initial: true),
            ],
          ),
          AutoRoute(
            page: LeaguesTab.page,
            maintainState: true,
            children: [
              AutoRoute(page: LeaguesRoute.page, initial: true),
            ],
          ),
          AutoRoute(
            page: TVTab.page,
            maintainState: true,
            children: [
              AutoRoute(page: TVRoute.page, initial: true),
            ],
          ),
        ]),
      ];
}

@RoutePage(name: 'HomeTab')
class HomeTabPage extends AutoRouter {
  const HomeTabPage({super.key});
}

@RoutePage(name: 'GameTab')
class GameTabPage extends AutoRouter {
  const GameTabPage({super.key});
}

@RoutePage(name: 'LeaguesTab')
class LeaguesTabPage extends AutoRouter {
  const LeaguesTabPage({super.key});
}

@RoutePage(name: 'TVTab')
class TVTabPage extends AutoRouter {
  const TVTabPage({super.key});
}
