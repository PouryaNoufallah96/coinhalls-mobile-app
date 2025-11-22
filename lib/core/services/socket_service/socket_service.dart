import 'dart:async';

import 'package:coin_hall/core/env.dart';
import 'package:coin_hall/core/services/auth_interceptor/auth_interceptor.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';
import 'package:signalr_netcore/errors.dart';
import 'package:signalr_netcore/http_connection_options.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';
import 'package:signalr_netcore/ihub_protocol.dart';
import 'package:signalr_netcore/json_hub_protocol.dart';

class HubEvent {
  const HubEvent({
    required this.name,
    this.data,
  });
  final String name;
  final dynamic data;

  @override
  String toString() => 'HubEvent(name: $name, data: $data)';
}

class SocketService {
  SocketService({
    required AuthInterceptor authInterceptor,
  }) : _authInterceptor = authInterceptor;
  static const String _baseUrl = 'https://api.coinhalls.com';
  static const String _pricesHubPath = '/hubs/prices';
  static const String _predictionHubPath = '/hubs/predictions';
  static const String _inventoriesHubPath = '/hubs/NotifyInventories';

  static const String _methodNotifyPrices = 'NotifyPrice';
  static const String _methodPredictionMessage = 'predictionMessage';
  static const String _methodInventoryMessage = 'NotifyInventory';

  final AuthInterceptor _authInterceptor;

  HubConnection? _pricesConn;
  HubConnection? _predictionConn;
  HubConnection? _inventoryConn;

  bool _pricesStarted = false;
  bool _shieldStarted = false;
  bool _inventoryStarted = false;
  String? _address;

  final Set<String> _pricesHandlers = {_methodNotifyPrices};
  final Set<String> _shieldHandlers = {_methodPredictionMessage};
  final Set<String> _inventoryHandlers = {_methodInventoryMessage};

  final _controller = StreamController<HubEvent>.broadcast();
  Stream<HubEvent> get stream => _controller.stream.doOnData((event) {});

  Future<void> connect() async {
    await disconnect();

    await _startPrices();
    // await _startInventory();
  }

  Future<void> disconnect({bool closeStreams = false}) async {
    try {
      if (_pricesConn != null) {
        for (final m in _pricesHandlers) {
          _pricesConn!.off(m);
        }
      }
    } catch (_) {}

    try {
      if (_pricesStarted) {
        await _pricesConn?.stop();
      }
    } catch (_) {}

    _pricesStarted = false;
    _pricesConn = null;

    try {
      if (_inventoryConn != null) {
        for (final m in _inventoryHandlers) {
          _inventoryConn!.off(m);
        }
      }
    } catch (_) {}

    try {
      if (_inventoryStarted) {
        await _inventoryConn?.stop();
      }
    } catch (_) {}

    _inventoryStarted = false;
    _inventoryConn = null;

    if (closeStreams) {
      await _controller.close();
    }
  }

  Future<void> _startPrices() async {
    _pricesConn = await _buildConnection(_pricesHubPath);

    _pricesConn!.on(_methodNotifyPrices, (args) {
      _controller.add(HubEvent(
        name: _methodNotifyPrices,
        data: _normalizeArgs(args),
      ));
    });

    _wireLifecycle(_pricesConn!);

    try {
      await _pricesConn!.start();
      _pricesStarted = true;
    } on HttpError catch (_) {}
  }

  Future<void> _startInventory() async {
    _inventoryConn = await _buildConnection(_inventoriesHubPath);

    _inventoryConn!.on(_methodInventoryMessage, (args) {
      _controller.add(HubEvent(
        name: _methodInventoryMessage,
        data: _normalizeArgs(args),
      ));
    });

    _wireLifecycle(_inventoryConn!);

    try {
      await _inventoryConn!.start();
      _inventoryStarted = true;
    } on HttpError catch (_) {}
  }

  Future<void> startPrediction(String address) async {
    await disconnectPrediction();

    _address = address;
    _predictionConn = await _buildConnection(_predictionHubPath);

    _predictionConn!.on(_methodPredictionMessage, (args) {
      _controller.add(HubEvent(
        name: _methodPredictionMessage,
        data: _normalizeArgs(args),
      ));
    });

    _wireLifecycle(
      _predictionConn!,
      onReconnected: _invokeRegisterWalletIfReady,
    );

    try {
      await _predictionConn!.start();
      _shieldStarted = true;
    } on HttpError catch (_) {}

    await _invokeRegisterWalletIfReady();
  }

  Future<void> disconnectPrediction() async {
    try {
      if (_predictionConn != null) {
        for (final m in _shieldHandlers) {
          _predictionConn!.off(m);
        }
      }
    } catch (_) {}

    try {
      if (_shieldStarted) {
        await _predictionConn?.stop();
      }
    } catch (_) {}

    _shieldStarted = false;
    _predictionConn = null;
  }

  Future<HubConnection> _buildConnection(String hubPath) async {
    final token = _getAccessToken();

    final url = token.isEmpty
        ? '$_baseUrl$hubPath'
        : '$_baseUrl$hubPath?access_token=$token';
    final sig = Env.authHeaders()['Signature'] as String;

    final options = HttpConnectionOptions(
        logMessageContent: true,
        headers: MessageHeaders()
          ..setHeaderValue('applicationId', Env.applicationId)
          ..setHeaderValue('signature', sig),
        logger: Logger('SocketService'));

    final builder = HubConnectionBuilder()
        .withUrl(url, options: options)
        .configureLogging(Logger('SocketService'))
        .withHubProtocol(JsonHubProtocol())
        .withAutomaticReconnect(
            retryDelays: const [0, 2000, 5000, 10000, 20000, 30000]);

    final conn = builder.build()
      ..serverTimeoutInMilliseconds = 1000 * 1000
      ..keepAliveIntervalInMilliseconds = 15 * 1000;
    return conn;
  }

  void _wireLifecycle(
    HubConnection conn, {
    Future<void> Function()? onReconnected,
  }) {
    conn
      ..onclose(({error}) async {})
      ..onreconnecting(({error}) async {})
      ..onreconnected(({connectionId}) async {
        if (onReconnected != null) {
          await onReconnected();
        }
      });
  }

  Future<void> _invokeRegisterWalletIfReady() async {
    if (_predictionConn == null || _address == null) return;
    try {
      await _predictionConn!.invoke('RegisterWallet', args: ['$_address']);
    } catch (_) {}
  }

  dynamic _normalizeArgs(List<Object?>? args) {
    if (args == null || args.isEmpty) return null;
    return args.length == 1 ? args.first : args;
  }

  String _getAccessToken() {
    return _authInterceptor.stream.value.token?.token ?? '';
  }

  Future<void> dispose() async {
    await disconnect(closeStreams: true);
  }
}
