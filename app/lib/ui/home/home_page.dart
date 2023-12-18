import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app.dart';
import '../../base/base_page_cubit_state.dart';
import 'bloc/home_cubit.dart';

part 'home_widgets/home_page.appbar_widget.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends BasePageCubitState<HomePage, HomeCubit> {
  AppBloc get _appBloc => BlocProvider.of<AppBloc>(context);

  final _scrollViewKey = GlobalKey();

  late final ScrollController _scrollController;
  late final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey;

  Size? _scrollViewSize;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollControllerHandler);

    _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      bloc.initData(countryCode: _appBloc.state.languageCode.countryCode);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollControllerHandler() {
    _scrollViewSize ??=
        (_scrollViewKey.currentContext?.findRenderObject() as RenderBox).size;
    if (_scrollController.offset >=
        (_scrollController.position.maxScrollExtent -
            _scrollViewSize!.height)) {}
  }

  @override
  Widget buildPageListeners({required Widget child}) {
    // return MultiBlocListener(
    //   listeners: [
    //     BlocListener<HomeBloc, HomeState>(
    //       listenWhen: (previous, current) => previous.users != current.users,
    //       listener: (context, state) {
    //         _pagingController.appendLoadMoreOutput(state.users);
    //       },
    //     ),
    //     BlocListener<HomeBloc, HomeState>(
    //       listenWhen: (previous, current) =>
    //           previous.loadUsersException != current.loadUsersException,
    //       listener: (context, state) {
    //         _pagingController.error = state.loadUsersException;
    //       },
    //     ),
    //   ],
    //   child: child,
    // );

    return child;
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      backgroundColor: Colors.grey[100],
      appBar: const _HomeAppBarWidget(),
      body: const Center(child: Text('Home Page')),
    );
  }
}
