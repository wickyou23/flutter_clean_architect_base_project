import 'package:injectable/injectable.dart';

import '../../../base/bloc/base_cubit.dart';
import 'match_page_state.dart';

// part 'match_page_cubit.isolate.dart';

@Injectable()
class MatchPageCubit extends BaseCubit<MatchPageState> {
  MatchPageCubit() : super(const MatchPageState());

  Future<void> getFixturesByDate(DateTime selectedDate) async {}
}
