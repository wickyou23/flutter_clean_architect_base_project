import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared/shared.dart';

import '../app.dart';
import 'bloc/base_cubit.dart';

abstract class BaseWidgetState<T extends StatefulWidget, B extends BaseCubit>
    extends BaseWidgetStateDelegate<T, B> with LogMixin {}

abstract class BaseWidgetStateDelegate<T extends StatefulWidget,
    B extends BaseCubit> extends State<T> {
  late final AppBloc appBloc = GetIt.instance.get<AppBloc>();

  late final B bloc = GetIt.instance.get<B>()
    ..disposeBag = disposeBag
    ..appBloc = appBloc;

  late final DisposeBag disposeBag = DisposeBag();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => bloc,
      child: buildWidget(context),
    );
  }

  Widget buildPageListeners({required Widget child}) => child;

  Widget buildPageLoading() => const Center(
        child: CircularProgressIndicator(),
      );

  Widget buildWidget(BuildContext context);

  @override
  void dispose() {
    super.dispose();
    disposeBag.dispose();
  }
}
