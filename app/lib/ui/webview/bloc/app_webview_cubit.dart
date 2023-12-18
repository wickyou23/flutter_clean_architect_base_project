import 'package:injectable/injectable.dart';

import '../../../base/bloc/base_cubit.dart';
import 'app_webview_state.dart';

@Injectable()
class AppWebviewPageCubit extends BaseCubit<AppWebviewPageState> {
  AppWebviewPageCubit() : super(const AppWebviewPageState());
}
