import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';

class Env {
  static final _env = _Env.get();

  static String reownProjectId = _env.reownProjectId;
  static String apiEndPoint = _env.apiEndPoint;
  static String clientId = _env.clientId;
  static String clientSecret = _env.clientSecret;
  static String publicSignature = _env.publicSignature;
  static String inventroyOrderHub = _env.inventroyOrderHub;
  static String paidOrderHub = _env.paidOrderHub;
  static String appContractAddress = _env.appContractAddress;
  static String appContractName = _env.appContractName;
  static String insuranceAddress = _env.insuranceAddress;
  static String insuranceName = _env.insuranceName;
  static String applicationId = _env.applicationId;

  static Map<String, dynamic> authHeaders() {
    final now = DateTime.now().millisecondsSinceEpoch.toString();
    final randomPart = (Random().nextDouble() * 1000000000).toInt().toString();
    final nonce = now + randomPart;

    final key = utf8.encode(publicSignature);
    final message = utf8.encode(nonce);

    final hmacSha256 = Hmac(sha256, key);
    final digest = hmacSha256.convert(message);

    final signature = base64Encode(digest.bytes);

    return {
      'Origin': 'https://app.rzprime.com',
      'Applicationid': applicationId,
      'Nonce': nonce,
      'Signature': signature,
    };
  }
}

sealed class _Env {
  _Env({
    required this.reownProjectId,
    required this.apiEndPoint,
    required this.clientId,
    required this.clientSecret,
    required this.publicSignature,
    required this.paidOrderHub,
    required this.inventroyOrderHub,
    required this.appContractAddress,
    required this.appContractName,
    required this.insuranceAddress,
    required this.insuranceName,
    required this.applicationId,
  });

  factory _Env.get() {
    return _StageEnv();
  }

  final String reownProjectId;
  final String apiEndPoint;
  final String clientId;
  final String clientSecret;
  final String publicSignature;
  final String paidOrderHub;
  final String inventroyOrderHub;
  final String appContractAddress;
  final String appContractName;
  final String insuranceAddress;
  final String insuranceName;
  final String applicationId;
}

class _StageEnv extends _Env {
  _StageEnv()
      : super(
          reownProjectId: '90e40102e61f0ebc907a7f14bcc82465',
          apiEndPoint: 'https://api.coinhalls.com/api/v1/',
          clientId: 'app_mainappful',
          clientSecret: 'vxzldacqgvazzxqgwibo',
          publicSignature: 'gsouqbsqaiginijimufycgvduqj',
          inventroyOrderHub: 'wss://api.rzprime.com/hubs/inventory',
          paidOrderHub: 'wss://api.rzprime.com/hubs/paidOrder',
          appContractAddress: '0x9E84758Fa09AA4A138CB726C7d4cEDBb5cce2340',
          appContractName: 'CoinHalls',
          insuranceAddress: '0x64E4fea6e4F3637025c7Bcd878E2B238B01f7D4e',
          insuranceName: 'insurance',
          applicationId: 'coinhalls.mainapp',
        );
}
