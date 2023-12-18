import 'package:data/src/repository/source/api/client/grpc_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() {
  setUpAll(() async {
    final di = GetIt.instance;
    di.registerLazySingleton<GRPCClient>(() => GRPCClient());
  });

  group('test `Repositoy` functions', () {
    // group('test `LorasRepository` functions', () {
    //   test('test `GetListFixture` functions', () async {
    //     final startTime = DateTime.now();
    //     final repo = GetIt.I.get<LorasRepositoryImpl>();
    //     final result =
    //         await repo.getListFixture(const GetListFixtureUseCaseInput(
    //       isCaching: false,
    //       sticky: false,
    //     ));

    //     final endTime = DateTime.now();
    //     final executionTime = endTime.difference(startTime).inMilliseconds;

    //     Log.d('ExcutionTime: ${executionTime}');
    //     expect(result, isNotNull);
    //   });

    //   test('test `GetTopLeagues` functions', () async {
    //     final repo = GetIt.I.get<LorasRepositoryImpl>();
    //     final result =
    //         await repo.getListTopLeagues(const GetListLeaguesUseCaseInput());
    //     expect(result, isNotNull);
    //   });

    //   test('test `GetListFamousPlayer` functions', () async {
    //     final repo = GetIt.I.get<LorasRepositoryImpl>();
    //     final result = await repo
    //         .getListFamousPlayer(const GetListFamousPlayerUseCaseInput());
    //     Log.d(result.toString());
    //     expect(result, isNotNull);
    //   });
    // });
  });
}
