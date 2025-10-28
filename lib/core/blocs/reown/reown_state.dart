part of 'reown_bloc.dart';

enum AppReownLoadingStatus {
  none,
  getNonce,
  signing,
  getToken,
}

enum ManualLoginStatus { idle, inLoading, success, failure }

class ReownState with EquatableMixin {
  ReownState({
    this.nonce,
    this.address,
    this.status = AppReownLoadingStatus.none,
    this.manualLoginStatus = ManualLoginStatus.idle,
    this.manualAddress,
  });

  final NonceData? nonce;
  final String? address;
  final AppReownLoadingStatus status;
  final ManualLoginStatus manualLoginStatus;
  final String? manualAddress;

  @override
  List<Object?> get props =>
      [nonce, address, status, manualLoginStatus, manualAddress];

  ReownState copyWith({
    NonceData? Function()? nonce,
    String? Function()? manualAddress,
    String? Function()? address,
    AppReownLoadingStatus? status,
    ManualLoginStatus? manualLoginStatus,
  }) {
    return ReownState(
      manualLoginStatus: manualLoginStatus ?? this.manualLoginStatus,
      status: status ?? this.status,
      nonce: nonce == null ? this.nonce : nonce(),
      address: address == null ? this.address : address(),
      manualAddress:
          manualAddress == null ? this.manualAddress : manualAddress(),
    );
  }
}
