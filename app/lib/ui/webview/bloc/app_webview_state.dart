import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';

part 'app_webview_state.freezed.dart';

enum AppWebviewState { init, done }

@freezed
class AppWebviewPageState extends BaseBlocState with _$AppWebviewPageState {
  const factory AppWebviewPageState({
    @Default(AppWebviewState.init) pageState,
    @Default('') String onPageError,
  }) = _AppWebviewPageState;
}
