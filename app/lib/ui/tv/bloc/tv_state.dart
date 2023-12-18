import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';

part 'tv_state.freezed.dart';

@freezed
class TVState extends BaseBlocState with _$TVState {
  const factory TVState() = _TVState;
}
