import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app.dart';

part 'home_state.freezed.dart';

enum HomeLoadMoreState {
  initStepLoading(0x00000001),
  initStepDone(0x00000010),
  step2Loading(0x00000100),
  step2Done(0x00001000),
  step3Loading(0x00010000),
  step3Done(0x00100000),
  undefine(0x00000000);

  const HomeLoadMoreState(this.value);

  final int value;
}

enum HomeState { init, refreshing }

@freezed
class HomePageState extends BaseBlocState with _$HomePageState {
  factory HomePageState() = _HomePageState;
}

extension HomeStateExtension on HomePageState {}
