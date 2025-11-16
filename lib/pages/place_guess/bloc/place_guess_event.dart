part of 'place_guess_bloc.dart';

sealed class PlaceGuessEvent with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class PlaceGuessAdded extends PlaceGuessEvent {
  PlaceGuessAdded({
    required this.amount,
  });

  final double amount;

  @override
  List<Object?> get props => [amount];
}

class PlaceGuessDeleted extends PlaceGuessEvent {
  PlaceGuessDeleted({
    required this.id,
  });

  final int id;

  @override
  List<Object?> get props => [id];
}

class PlaceGuessPayed extends PlaceGuessEvent {
  PlaceGuessPayed();
}
