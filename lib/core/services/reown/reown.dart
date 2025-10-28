import 'dart:async';

import 'package:coin_hall/core/env.dart';
import 'package:flutter/widgets.dart';
import 'package:reown_appkit/reown_appkit.dart';

class ReownService {
  ReownService() {
    _onModalConnectController = StreamController.broadcast();
    _onModalDisconnectController = StreamController.broadcast();
    _onModalErrorController = StreamController.broadcast();
    _onModalNetworkChangeController = StreamController.broadcast();
    _onModalUpdateController = StreamController.broadcast();
    _onSessionEventEventController = StreamController.broadcast();
    _onSessionExpireEventController = StreamController.broadcast();
    _onSessionUpdateEventController = StreamController.broadcast();
  }

  late final StreamController<ModalConnect> _onModalConnectController;
  late final StreamController<ModalDisconnect> _onModalDisconnectController;
  late final StreamController<ModalError> _onModalErrorController;
  late final StreamController<ModalNetworkChange>
      _onModalNetworkChangeController;
  late final StreamController<ModalConnect> _onModalUpdateController;
  late final StreamController<SessionEvent> _onSessionEventEventController;
  late final StreamController<SessionExpire> _onSessionExpireEventController;
  late final StreamController<SessionUpdate> _onSessionUpdateEventController;

  Stream<ModalConnect> get onModalConnectStream =>
      _onModalConnectController.stream;
  Stream<ModalDisconnect> get onModalDisconnectStream =>
      _onModalDisconnectController.stream;
  Stream<ModalError> get onModalErrorStream => _onModalErrorController.stream;
  Stream<ModalNetworkChange> get onModalNetworkChangeStream =>
      _onModalNetworkChangeController.stream;
  Stream<ModalConnect> get onModalUpdateStream =>
      _onModalUpdateController.stream;
  Stream<SessionEvent> get onSessionEventEventStream =>
      _onSessionEventEventController.stream;
  Stream<SessionExpire> get onSessionExpireEventStream =>
      _onSessionExpireEventController.stream;
  Stream<SessionUpdate> get onSessionUpdateEventStream =>
      _onSessionUpdateEventController.stream;

  late ReownAppKitModal _reownAppKitModal;
  late ReownAppKit _appKit;

  ReownAppKitModal get appKitModal => _reownAppKitModal;

  void call(BuildContext context) {
    ReownAppKitModalNetworks.removeSupportedNetworks('solana');
    ReownAppKitModalNetworks.removeSupportedNetworks('eip155');

    ReownAppKitModalNetworks.addSupportedNetworks('eip155', [
      // const ReownAppKitModalNetworkInfo(
      //   name: 'BSC Testnet',
      //   chainId: '97',
      //   currency: 'tBNB',
      //   rpcUrl: 'https://data-seed-prebsc-1-s1.binance.org:8545/',
      //   explorerUrl: 'https://testnet.bscscan.com',
      //   isTestNetwork: true,
      // ),
      const ReownAppKitModalNetworkInfo(
        name: 'Binance Smart Chain',
        chainId: '56',
        chainIcon: '93564157-2e8e-4ce7-81df-b264dbee9b00',
        currency: 'BNB',
        rpcUrl:
            'https://purple-proud-card.bsc.quiknode.pro/f9c9d9b7cc798a81f31d4db5f41a4f1beb3671d7/',
        explorerUrl: 'https://bscscan.com',
      ),
      // const ReownAppKitModalNetworkInfo(
      //   name: 'Sepolia',
      //   chainId: '11155111',
      //   currency: 'SEP',
      //   rpcUrl: 'https://ethereum-sepolia.publicnode.com',
      //   explorerUrl: 'https://sepolia.etherscan.io/',
      //   isTestNetwork: true,
      // ),
      // const ReownAppKitModalNetworkInfo(
      //   name: 'Sepolia testnet',
      //   chainId: '11155111',
      //   currency: 'SEP',
      //   rpcUrl: 'https://sepolia.drpc.org',
      //   explorerUrl: 'explorerUrl',
      // ),
    ]);

    const metadata = PairingMetadata(
      name: 'Meta Coin Guard',
      description: 'Meta Coin Guard',
      url: 'https://metacoinguard.com',
      icons: ['https://metacoinguard.com/icon.png'],
      redirect: Redirect(
        native: 'metacoinguard://',
        universal: 'https://metacoinguard.com/modal',
        linkMode: true,
      ),
    );

    _appKit = ReownAppKit(
      core: ReownCore(projectId: Env.reownProjectId),
      metadata: metadata,
    );

    _reownAppKitModal = ReownAppKitModal(
      context: context,
      appKit: _appKit,
      projectId: Env.reownProjectId,
      metadata: metadata,
      optionalNamespaces: {
        'eip155': RequiredNamespace.fromJson({
          'chains': ReownAppKitModalNetworks.getAllSupportedNetworks(
            namespace: 'eip155',
          ).map((chain) => chain.chainId).toList(),
          'methods': NetworkUtils.defaultNetworkMethods['eip155']!.toList(),
          'events': NetworkUtils.defaultNetworkEvents['eip155']!.toList(),
        }),
      },
      includedWalletIds: {
        '4622a2b2d6af1c9844944291e5e7351a6aa24cd7b23099efac1b2fd875da31a0',
        'c57ca95b47569778a828d19178114f4db188b89b763c899ba0be274e97267d96',
        '38f5d18bd8522c244bdd70cb4a68e0e718865155811c043f052fb9f1c51de662',
      },
    );

    _init();
  }

  Future<void> _init() async {
    await _appKit.init();
    await _reownAppKitModal.init();

    _reownAppKitModal.onModalConnect.subscribe((args) {
      _onModalConnectController.sink.add(args);
    });

    _reownAppKitModal.onModalDisconnect.subscribe((args) {
      _onModalDisconnectController.sink.add(args);
    });

    _reownAppKitModal.onModalError.subscribe((args) {
      _onModalErrorController.sink.add(args);
    });

    _reownAppKitModal.onModalNetworkChange.subscribe((args) {
      _onModalNetworkChangeController.sink.add(args);
    });

    _reownAppKitModal.onModalUpdate.subscribe((args) {
      _onModalUpdateController.sink.add(args);
    });

    _reownAppKitModal.onSessionEventEvent.subscribe((args) {
      _onSessionEventEventController.sink.add(args);
    });

    _reownAppKitModal.onSessionExpireEvent.subscribe((args) {
      _onSessionExpireEventController.sink.add(args);
    });

    _reownAppKitModal.onSessionUpdateEvent.subscribe((args) {
      _onSessionUpdateEventController.sink.add(args);
    });
  }

  Future<void> dispose() async {
    await _onModalConnectController.close();
    await _onModalDisconnectController.close();
    await _onModalErrorController.close();
    await _onModalNetworkChangeController.close();
    await _onModalUpdateController.close();
    await _onSessionEventEventController.close();
    await _onSessionExpireEventController.close();
    await _onSessionUpdateEventController.close();
  }
}
