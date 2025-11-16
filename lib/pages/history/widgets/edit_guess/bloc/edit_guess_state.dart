part of 'edit_guess_bloc.dart';

enum PayEditGuessStatus { idle, inProgress, success, failure }

final class EditGuessState with EquatableMixin {
  EditGuessState({
    this.payStatus = PayEditGuessStatus.idle,
  });

  final PayEditGuessStatus payStatus;

  EditGuessState copyWith({
    PayEditGuessStatus? payStatus,
  }) {
    return EditGuessState(
      payStatus: payStatus ?? this.payStatus,
    );
  }

  @override
  List<Object?> get props => [payStatus];
}
