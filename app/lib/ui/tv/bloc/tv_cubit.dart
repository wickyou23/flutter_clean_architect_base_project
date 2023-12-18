import 'package:injectable/injectable.dart';

import '../../../base/bloc/base_cubit.dart';
import 'tv_state.dart';

@Injectable()
class TVCubit extends BaseCubit<TVState> {
  TVCubit(): super(const TVState());
}
