import 'package:get_it/get_it.dart';
import 'package:shared/shared.dart';

import '../di/di.dart' as di;
import '../repository/source/api/client/grpc_client.dart';

class DataConfig extends Config {
  DataConfig._();

  factory DataConfig.getInstance() {
    return _instance;
  }

  static final DataConfig _instance = DataConfig._();

  @override
  Future<void> config() async {
    di.configureInjection();
    await GetIt.instance<GRPCClient>().configChannel();
  }
}
