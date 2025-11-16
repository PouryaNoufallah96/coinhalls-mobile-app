import 'package:coin_hall/components/app_button.dart';
import 'package:coin_hall/core/blocs/cubit/health_status_cubit.dart';
import 'package:coin_hall/core/blocs/reown/reown_bloc.dart';
import 'package:coin_hall/core/services/prediction_service/models.dart';
import 'package:coin_hall/core/services/stats_serivce/models.dart';
import 'package:coin_hall/core/services/transaction_service/transaction_service.dart';
import 'package:coin_hall/core/utils/input_formatter.dart';
import 'package:coin_hall/core/utils/number_formatter.dart';
import 'package:coin_hall/core/utils/theme_utils.dart';
import 'package:coin_hall/pages/history/widgets/edit_guess/bloc/edit_guess_bloc.dart';
import 'package:coin_hall/pages/nested/cubit/user_stats_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:toastification/toastification.dart';

Future<bool?> showEditGussBottomSheet(
  BuildContext context,
  PredictionHistory data,
) async {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    useRootNavigator: true,
    constraints: BoxConstraints(
      maxHeight: context.mSize.height * .8,
    ),
    builder: (context) {
      return BlocProvider(
        create: (context) => EditGuessBloc(
          predictionReference: data.predictionReference,
          transactionService: TransactionService(
            reownService: context.read(),
            web3Client: context.read(),
          ),
        ),
        child: _EditGuess(
          data: data,
        ),
      );
    },
  );
}

class _EditGuess extends HookWidget {
  const _EditGuess({
    required this.data,
  });

  final PredictionHistory data;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HealthStatusCubit>().state.status;
    final isActive = context
        .watch<UserStatsCubit>()
        .state
        .maybeWhen(orElse: () => false, success: (stats) => stats.isActive);
    final canShowAction = state?.checked ?? false;
    final message = state?.message;

    final value = useState<double>(0);

    final PredictionHistory(:gameEndMoment, :tokenName) = data;
    const title = '';
    final remainingsInDays =
        DateTime.parse(gameEndMoment).difference(DateTime.now()).inDays;

    return BlocListener<EditGuessBloc, EditGuessState>(
      listenWhen: (previous, current) {
        return previous.payStatus == PayEditGuessStatus.inProgress &&
                current.payStatus == PayEditGuessStatus.success ||
            previous.payStatus == PayEditGuessStatus.inProgress &&
                current.payStatus == PayEditGuessStatus.failure;
      },
      listener: (context, state) {
        context.pop(state.payStatus == PayEditGuessStatus.success);
      },
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
          child: SizedBox(
            width: double.infinity,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff030202),
                    Color(0xff3E362C),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 64),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 3,
                      width: 40,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: const Color(0xff71717A),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Your guess',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      'How many $tokenName tokens will $title cost in the next $remainingsInDays Days?',
                      maxLines: 10,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xffFEF6C0),
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Column(
                      spacing: 8,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Your Guess',
                          style: TextStyle(
                            color: Color(0xffFFEEB9),
                          ),
                        ),
                        TextFormField(
                          initialValue: AppNumberFormatter.format(
                              data.predictionTokenAmount),
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          inputFormatters: [
                            SwapAmountFormatter(),
                          ],
                          onChanged: (v) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              final amount = NumberFormat().tryParse(v) ?? 0;
                              value.value = amount.toDouble();
                            });
                          },
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          decoration: const InputDecoration(
                            hintText: 'Guess',
                            hintStyle: TextStyle(
                              color: Color(0xffA5A4A2),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    BlocSelector<EditGuessBloc, EditGuessState, bool>(
                      selector: (state) {
                        return state.payStatus == PayEditGuessStatus.inProgress;
                      },
                      builder: (context, inProgress) {
                        return AppButton(
                          isLoading: inProgress,
                          onPressed: value.value == 0 ||
                                  value.value == data.predictionTokenAmount
                              ? null
                              : () {
                                  if (!isActive) {
                                    if (!canShowAction) {
                                      toastification.show(
                                        style: ToastificationStyle.fillColored,
                                        type: ToastificationType.error,
                                        title: Text(message ?? ''),
                                        borderRadius: BorderRadius.circular(6),
                                        autoCloseDuration:
                                            const Duration(seconds: 4),
                                      );
                                    } else {
                                      context
                                          .read<ReownBloc>()
                                          .add(ReownLogginButtonPressed());
                                    }

                                    return;
                                  }

                                  context
                                      .read<EditGuessBloc>()
                                      .add(EditGuessPayed(amount: value.value));
                                },
                        );
                      },
                    ),
                    const SizedBox(height: 48),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
