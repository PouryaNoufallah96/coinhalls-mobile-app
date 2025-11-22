import 'dart:convert';
import 'dart:typed_data';

import 'package:coin_hall/contract_abi/contract_abi.dart';
import 'package:coin_hall/core/services/reown/reown.dart';
import 'package:decimal/decimal.dart' show Decimal;
import 'package:reown_appkit/reown_appkit.dart';

class TransactionService {
  TransactionService(
      {required ReownService reownService, required Web3Client web3Client})
      : _reownService = reownService,
        _web3Client = web3Client;

  final ReownService _reownService;

  final Web3Client _web3Client;

  Future<void> loadAccountData() async {
    try {
      await _reownService.appKitModal.loadAccountData();
    } catch (_) {}
  }

  Decimal toHumanExact(BigInt raw, int decimals) {
    if (decimals <= 0) return Decimal.parse(raw.toString());

    final s = raw.toString().padLeft(decimals + 1, '0');
    final whole = s.substring(0, s.length - decimals);
    final frac = s.substring(s.length - decimals);

    return Decimal.parse('$whole.$frac');
  }

  double toHumanDouble(BigInt raw, int decimals, {int fractionDigits = 6}) {
    final d = toHumanExact(raw, decimals).toDouble();
    return fractionDigits >= 0
        ? double.parse(d.toStringAsFixed(fractionDigits))
        : d;
  }

  BigInt toUintScaled(Object value, BigInt scale) {
    final s = (value is num) ? value.toString() : (value as String);

    final cleaned = s.replaceAll(RegExp('[^0-9.]'), '');

    final parts = cleaned.split('.');
    final intPart = (parts.isNotEmpty && parts[0].isNotEmpty) ? parts[0] : '0';
    final decRaw = (parts.length > 1) ? parts[1] : '';

    final scaleDigits = scale.toString().length - 1;

    final decPart = decRaw.length > scaleDigits
        ? decRaw.substring(0, scaleDigits)
        : decRaw.padRight(scaleDigits, '0');

    final base = BigInt.parse(intPart) * scale;
    final frac = decPart.isEmpty ? BigInt.zero : BigInt.parse(decPart);

    return base + frac;
  }

  Future<bool> approve(BigInt? amount, String address, String name) async {
    final chainId = _reownService.appKitModal.selectedChain?.chainId;

    if (chainId == null) {
      return false;
    }

    final addressCheckSum = _address();
    final spenderAddress = AppContractAbi.appContract.address;

    final contract = DeployedContract(
        ContractAbi.fromJson(jsonEncode(AppContractAbi.approveAbi), name),
        EthereumAddress.fromHex(address));

    final res = await _reownService.appKitModal.requestWriteContract(
      topic: _reownService.appKitModal.session?.topic,
      chainId: chainId,
      deployedContract: contract,
      functionName: contract.function('approve').name,
      transaction: Transaction(from: addressCheckSum),
      parameters: [
        spenderAddress,
        amount,
      ],
    );

    await _reownService.appKitModal.loadAccountData();

    return res is String && res.startsWith('0x');
  }

  Future<bool> payOrder(List<dynamic> data, String reference) async {
    try {
      final chainId = _reownService.appKitModal.selectedChain?.chainId;

      final addressCheckSum = _address();

      if (chainId == null) {
        return false;
      }

      final res = await _reownService.appKitModal.requestWriteContract(
        topic: _reownService.appKitModal.session?.topic,
        chainId: chainId,
        deployedContract: AppContractAbi.appContract,
        functionName: AppContractAbi.batchSubmitGuesses.name,
        transaction: Transaction(from: addressCheckSum),
        parameters: [hexToByteArray32(reference), data],
      );

      await _reownService.appKitModal.loadAccountData();

      if (res is String && res.startsWith('0x')) {
        try {
          final succeed = await isSucceed(res);

          return succeed;
        } catch (_) {
          return false;
        }
      }

      return false;
    } catch (_) {
      return false;
    }
  }

  Future<bool> editGuess(String reference, double amount) async {
    try {
      final chainId = _reownService.appKitModal.selectedChain?.chainId;

      final addressCheckSum = _address();

      if (chainId == null) {
        return false;
      }

      final res = await _reownService.appKitModal.requestWriteContract(
        topic: _reownService.appKitModal.session?.topic,
        chainId: chainId,
        deployedContract: AppContractAbi.appContract,
        functionName: AppContractAbi.batchUpdateGuess.name,
        transaction: Transaction(from: addressCheckSum),
        parameters: [
          [hexToByteArray32(reference)],
          [toUintScaled(amount, BigInt.from(10).pow(8))],
        ],
      );

      await _reownService.appKitModal.loadAccountData();

      if (res is String && res.startsWith('0x')) {
        try {
          final succeed = await isSucceed(res);

          return succeed;
        } catch (_) {
          return false;
        }
      }

      return false;
    } catch (_) {
      return false;
    }
  }

  Future<bool> isSucceed(String tx) async {
    final r = await _web3Client.getTransactionReceipt(tx);
    return r?.status ?? false;
  }

  EthereumAddress? _address() {
    final chainId = _reownService.appKitModal.selectedChain!.chainId;

    final namespace = NamespaceUtils.getNamespaceFromChain(
      chainId,
    );

    final rawAddress = _reownService.appKitModal.session?.getAddress(namespace);

    if (rawAddress == null) {
      return null;
    }

    return EthereumAddress.fromHex(rawAddress);
  }

  Uint8List hexToByteArray32(String hex) {
    if (hex.isEmpty) {
      throw ArgumentError('Hex string is null or empty');
    }
    return _hexToBytes(hex);
  }

  Uint8List _hexToBytes(String hex) {
    var clean = hex.startsWith('0x') ? hex.substring(2) : hex;

    if (clean.length.isOdd) {
      clean = '0$clean';
    }

    final length = clean.length ~/ 2;
    final result = Uint8List(length);

    for (var i = 0; i < length; i++) {
      final byte = clean.substring(i * 2, i * 2 + 2);
      result[i] = int.parse(byte, radix: 16);
    }

    return result;
  }
}
