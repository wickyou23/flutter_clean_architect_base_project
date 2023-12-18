import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';

part 'leagues_page_state.freezed.dart';

@freezed
class LeaguesState extends BaseBlocState with _$LeaguesState {
  const factory LeaguesState() = _LeaguesState;
}
