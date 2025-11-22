import 'package:bloc/bloc.dart';
import 'package:coin_hall/core/services/transaction_service/transaction_service.dart';
import 'package:coin_hall/core/utils/future_timeout.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

part 'edit_guess_event.dart';
part 'edit_guess_state.dart';

class EditGuessBloc extends Bloc<EditGuessEvent, EditGuessState> {
  EditGuessBloc({
    required TransactionService transactionService,
    required String predictionReference,
  })  : _transactionService = transactionService,
        _predictionReference = predictionReference,
        super(EditGuessState()) {
    on<EditGuessPayed>(_onEditGuessPayed);
  }

  final TransactionService _transactionService;
  final String _predictionReference;

  Future<void> _onEditGuessPayed(
    EditGuessPayed event,
    Emitter<EditGuessState> emit,
  ) async {
    emit(state.copyWith(payStatus: PayEditGuessStatus.inProgress));

    final isPayed = await futureTimeout(
      _transactionService.editGuess(_predictionReference, event.amount),
      const Duration(seconds: 120),
      () {
        emit(state.copyWith(payStatus: PayEditGuessStatus.idle));

        toastification.show(
          style: ToastificationStyle.fillColored,
          type: ToastificationType.error,
          title: const Text('There was a problem connecting to your wallet.'),
          borderRadius: BorderRadius.circular(6),
          autoCloseDuration: const Duration(seconds: 4),
        );
      },
    );

    if (isPayed != null) {
      if (isPayed) {
        emit(state.copyWith(payStatus: PayEditGuessStatus.success));
        toastification.show(
          style: ToastificationStyle.fillColored,
          type: ToastificationType.success,
          title: const Text('Guess was updated.'),
          borderRadius: BorderRadius.circular(6),
          autoCloseDuration: const Duration(seconds: 4),
        );
      } else {
        emit(state.copyWith(payStatus: PayEditGuessStatus.failure));

        toastification.show(
          style: ToastificationStyle.fillColored,
          type: ToastificationType.error,
          title: const Text('Transaction failed or reverted.'),
          borderRadius: BorderRadius.circular(6),
          autoCloseDuration: const Duration(seconds: 4),
        );
      }
    } else {
      emit(state.copyWith(payStatus: PayEditGuessStatus.idle));
    }
  }
}
