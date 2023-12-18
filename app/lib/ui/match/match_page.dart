import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:resources/resources.dart';

import '../../app.dart';
import '../../base/base_page_cubit_state.dart';
import 'bloc/match_page_cubit.dart';

part 'match_widgets/match_page.appbar_widget.dart';

@RoutePage()
class MatchPage extends StatefulWidget {
  const MatchPage({super.key});

  @override
  State<MatchPage> createState() => _MatchPageState();
}

class _MatchPageState extends BasePageCubitState<MatchPage, MatchPageCubit> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});

    super.initState();
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      appBar: const _MatchAppBarWidget(),
      backgroundColor: AppColors.current.defaultBackgroundColor,
      body: const Center(
        child: Text('Match Page'),
      ),
    );
  }
}
