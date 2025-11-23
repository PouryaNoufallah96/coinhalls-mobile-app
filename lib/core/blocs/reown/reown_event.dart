part of 'reown_bloc.dart';

abstract class ReownEvent with EquatableMixin {}

class ReownStarted extends ReownEvent {
  @override
  List<Object?> get props => [];
}

class ReownConnected extends ReownEvent {
  ReownConnected({
    required this.event,
    this.onSuccess,
  });

  final ModalConnect event;
  final void Function()? onSuccess;

  @override
  List<Object?> get props => [event, onSuccess];
}

class ReownDisconnected extends ReownEvent {
  ReownDisconnected();

  @override
  List<Object?> get props => [];
}

class ReownLogginButtonPressed extends ReownEvent {
  ReownLogginButtonPressed({this.onSuccess});

  final void Function()? onSuccess;

  @override
  List<Object?> get props => [onSuccess];
}

class ReownAddressLogginButtonPressed extends ReownEvent {
  ReownAddressLogginButtonPressed({
    required this.address,
  });

  final String address;

  @override
  List<Object?> get props => [address];
}
