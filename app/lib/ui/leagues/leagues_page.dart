import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../app.dart';
import '../../base/base_page_cubit_state.dart';
import 'bloc/leagues_page_cubit.dart';

@RoutePage()
class LeaguesPage extends StatefulWidget {
  const LeaguesPage({super.key});

  @override
  State<LeaguesPage> createState() => _LeaguesPageState();
}

class _LeaguesPageState extends BasePageCubitState<LeaguesPage, LeaguesCubit> {
  @override
  Widget buildPage(BuildContext context) {
    return const CommonScaffold(
      body: Center(
        child: Text('Leagues Page'),
      ),
    );
  }
}
