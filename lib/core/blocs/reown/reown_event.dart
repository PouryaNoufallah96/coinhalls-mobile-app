part of 'reown_bloc.dart';

abstract class ReownEvent with EquatableMixin {}

class ReownStarted extends ReownEvent {
  @override
  List<Object?> get props => [];
}

class ReownConnected extends ReownEvent {
  ReownConnected({required this.event});

  final ModalConnect event;

  @override
  List<Object?> get props => [event];
}

class ReownDisconnected extends ReownEvent {
  ReownDisconnected();

  @override
  List<Object?> get props => [];
}

class ReownLogginButtonPressed extends ReownEvent {
  @override
  List<Object?> get props => [];
}

class ReownAddressLogginButtonPressed extends ReownEvent {
  ReownAddressLogginButtonPressed({
    required this.address,
  });

  final String address;

  @override
  List<Object?> get props => [address];
}
