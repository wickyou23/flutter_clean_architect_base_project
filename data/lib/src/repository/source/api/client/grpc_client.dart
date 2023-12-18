import 'dart:async';

import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

enum GRPCConnectionState {
  undefine,
  initialize,
  connecting,
  ready,
  transientFailure,
  shutdown
}

@LazySingleton()
class GRPCClient {
  late ClientChannel _clientChannel;

  GRPCConnectionState _state = GRPCConnectionState.undefine;
  bool get _needToConfigurateChannel =>
      _state == GRPCConnectionState.shutdown ||
      _state == GRPCConnectionState.transientFailure;

  List<Completer<ClientChannel>> _completers = [];
  bool _isConfigChannel = false;
  final _metadata = {'x-user-id': 'flutter-mobile'};

  Future<ClientChannel> configChannel() async {
    if (_isConfigChannel) {
      final completer = Completer<ClientChannel>();
      _completers.add(completer);
      return completer.future;
    }

    _isConfigChannel = true;

    //init channel
    _clientChannel = ClientChannel(
      UrlConstants.appGRPCUrl,
      options: const ChannelOptions(
        credentials: ChannelCredentials.secure(),
        keepAlive: ClientKeepAliveOptions(
          pingInterval: Duration(seconds: 60),
          timeout: Duration(seconds: 30),
          permitWithoutCalls: true,
        ),
      ),
    );

    _clientChannel.onConnectionStateChanged.listen(_onConnectionStateChanged);

    if (_completers.isNotEmpty) {
      _completers.forEach((element) {
        element.complete(_clientChannel);
      });

      _completers = [];
    }

    _state = GRPCConnectionState.initialize;
    _isConfigChannel = false;

    return _clientChannel;
  }

  void _onConnectionStateChanged(ConnectionState state) {
    Log.d('Channel State: $state');
    switch (state) {
      case ConnectionState.ready:
        Log.d('Channel is ready.');
        _state = GRPCConnectionState.ready;
      case ConnectionState.connecting:
        Log.d('Channel is connecting.');
        _state = GRPCConnectionState.connecting;
      case ConnectionState.transientFailure:
        Log.d('Channel is transientFailure.');
        _state = GRPCConnectionState.transientFailure;
      case ConnectionState.shutdown:
        Log.d('Channel is shutdown.');
        _state = GRPCConnectionState.shutdown;
      default:
        Log.d('Channel is not define.');
        _state = GRPCConnectionState.transientFailure;
    }
  }
}

//Get functions
extension GRPCClientExtension on GRPCClient {
  // Future<gendry.GendryClient> get gendryClient async {
  //   if (_needToConfigurateChannel) {
  //     await configChannel();
  //   }

  //   return gendry.GendryClient(
  //     _clientChannel,
  //     options: CallOptions(metadata: _metadata),
  //   );
  // }
}
