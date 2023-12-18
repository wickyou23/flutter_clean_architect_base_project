import 'package:injectable/injectable.dart';

import '../../../../base/bloc/base_cubit.dart';
import 'home_state.dart';

@Injectable()
class HomeCubit extends BaseCubit<HomePageState> {
  HomeCubit() : super(HomePageState());

  Future<void> initData({required String countryCode}) async {}
}
