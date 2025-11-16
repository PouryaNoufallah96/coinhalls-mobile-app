part of 'place_guess_bloc.dart';

enum PayGameGuessStatus { idle, inProgress, success, failure }

final class PlaceGuessState with EquatableMixin {
  PlaceGuessState({
    this.guesses = const [],
    this.payStatus = PayGameGuessStatus.idle,
  });

  final List<GameGuess> guesses;
  final PayGameGuessStatus payStatus;

  PlaceGuessState copyWith({
    List<GameGuess>? guesses,
    PayGameGuessStatus? payStatus,
  }) {
    return PlaceGuessState(
      guesses: guesses ?? this.guesses,
      payStatus: payStatus ?? this.payStatus,
    );
  }

  @override
  List<Object?> get props => [guesses, payStatus];
}

final class GameGuess with EquatableMixin {
  GameGuess({
    required this.id,
    required this.amount,
  });

  final int id;
  final double amount;

  @override
  List<Object?> get props => [id, amount];
}
