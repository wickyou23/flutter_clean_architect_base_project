import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../app.dart';
import 'bloc/search.dart';

@RoutePage()
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SearchPageState();
  }
}

class _SearchPageState extends BasePageState<SearchPage, SearchBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return const Center(
      child: Text('I\'m Searching'),
    );
    
    
    // CommonScaffold(
    //   body: Center(
    //     child: ElevatedButton(
    //       style: ButtonStyle(
    //         backgroundColor: MaterialStateProperty.all(AppColors.current.primaryColor),
    //       ),
    //       onPressed: () {
    //         navigator.push(const AppRouteInfo.login());
    //       },
    //       child: Text(
    //         S.current.login,
    //         style: AppTextStyles.s14w400Primary(),
    //       ),
    //     ),
    //   ),
    // );
  }
}
