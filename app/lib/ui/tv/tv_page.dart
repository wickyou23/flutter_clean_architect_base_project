import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../base/base_page_cubit_state.dart';
import 'bloc/tv_cubit.dart';

@RoutePage()
class TVPage extends StatefulWidget {
  const TVPage({super.key});

  @override
  State<TVPage> createState() => _TVPageState();
}

class _TVPageState extends BasePageCubitState<TVPage, TVCubit> {
  @override
  Widget buildPage(BuildContext context) {
    return const Center(
      child: Text('TV Page'),
    );
  }
}
