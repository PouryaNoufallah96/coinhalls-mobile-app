part of 'edit_guess_bloc.dart';

sealed class EditGuessEvent with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class EditGuessPayed extends EditGuessEvent {
  EditGuessPayed({required this.amount});

  final double amount;

  @override
  List<Object?> get props => [amount];
}
