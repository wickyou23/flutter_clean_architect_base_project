import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../../app.dart';
import '../../utils/enum_extension.dart';
import 'bloc/main.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends BasePageState<MainPage, MainBloc> {
  final _bottomBarKey = GlobalKey();

  @override
  Widget buildPage(BuildContext context) {
    return AutoTabsScaffold(
      routes: (navigator as AppNavigatorImpl).tabRoutes,
      bottomNavigationBuilder: (_, tabsRouter) {
        (navigator as AppNavigatorImpl).tabsRouter = tabsRouter;

        return BottomNavigationBar(
          key: _bottomBarKey,
          currentIndex: tabsRouter.activeIndex,
          onTap: (index) {
            if (index == tabsRouter.activeIndex) {
              (navigator as AppNavigatorImpl).popUntilRootOfCurrentBottomTab();
            }
            tabsRouter.setActiveIndex(index);
          },
          // showSelectedLabels: true,
          // showUnselectedLabels: true,
          // unselectedItemColor: AppColors.current.primaryColor,
          selectedLabelStyle: AppTextStyles.bottomTabText().copyWith(
            color: AppColors.current.tabbar.activedColor,
          ),
          unselectedLabelStyle: AppTextStyles.bottomTabText(),
          selectedItemColor: AppColors.current.tabbar.activedColor,
          type: BottomNavigationBarType.fixed,
          // backgroundColor: AppColors.current.primaryColor,
          items: BottomTab.values
              .map(
                (tab) => BottomNavigationBarItem(
                  label: tab.title,
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: Dimens.d5.responsive()),
                    child: tab.icon,
                  ),
                  activeIcon: Padding(
                    padding: EdgeInsets.only(bottom: Dimens.d5.responsive()),
                    child: tab.activedIcon,
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
