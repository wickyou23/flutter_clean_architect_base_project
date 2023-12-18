import 'package:injectable/injectable.dart';

import '../../../base/bloc/base_cubit.dart';
import 'leagues_page_state.dart';

@Injectable()
class LeaguesCubit extends BaseCubit<LeaguesState> {
  LeaguesCubit(): super(const LeaguesState());
}
