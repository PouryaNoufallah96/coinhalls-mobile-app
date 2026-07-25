import 'package:coin_hall/components/app_button.dart';
import 'package:coin_hall/components/app_scaffold.dart';
import 'package:coin_hall/components/dashed_divider.dart';
import 'package:coin_hall/core/blocs/cubit/health_status_cubit.dart';
import 'package:coin_hall/core/blocs/reown/reown_bloc.dart';
import 'package:coin_hall/core/services/game_service/models.dart';
import 'package:coin_hall/core/services/stats_serivce/models.dart';
import 'package:coin_hall/core/services/transaction_service/transaction_service.dart';
import 'package:coin_hall/core/utils/number_formatter.dart';
import 'package:coin_hall/pages/nested/cubit/user_stats_cubit.dart';
import 'package:coin_hall/pages/place_guess/bloc/place_guess_bloc.dart';
import 'package:coin_hall/pages/place_guess/widgets/guess_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

class PlaceGuessPage extends StatelessWidget {
  const PlaceGuessPage({
    required this.gameData,
    super.key,
  });

  final Map<String, dynamic> gameData;

  @override
  Widget build(BuildContext context) {
    final data = GameData.fromJson(gameData);
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => data,
        ),
        RepositoryProvider(
          create: (context) => TransactionService(
            reownService: context.read(),
            web3Client: context.read(),
          ),
        ),
      ],
      child: BlocProvider(
        create: (context) => PlaceGuessBloc(
          predictionService: context.read(),
          gameData: data,
          transactionService: context.read(),
        ),
        child: AppScaffold(
          body: const SafeArea(
            child: _Body(),
          ),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final game = context.read<GameData>();

    return BlocListener<PlaceGuessBloc, PlaceGuessState>(
      listenWhen: (previous, current) {
        return previous.payStatus == PayGameGuessStatus.inProgress &&
            current.payStatus == PayGameGuessStatus.success;
      },
      listener: (context, state) {
        context.goNamed('home_page');
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => context.goNamed('home_page'),
                  icon: const FaIcon(
                    FontAwesomeIcons.xmark,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  'Try the guess',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                IconButton(
                  onPressed: () => context.pop(),
                  icon: const FaIcon(
                    FontAwesomeIcons.arrowRight,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CustomScrollView(
              slivers: <Widget>[
                BlocSelector<PlaceGuessBloc, PlaceGuessState, List<GameGuess>>(
                  selector: (state) {
                    return state.guesses;
                  },
                  builder: (context, state) {
                    return SliverList.separated(
                      itemCount: state.length,
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 16);
                      },
                      itemBuilder: (context, index) {
                        final guess = state[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: SizedBox(
                            width: double.infinity,
                            height: 70,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: const Color(0xffFFEEB9)
                                    .withValues(alpha: .08),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(width: 14),
                                  CircleAvatar(
                                    radius: 24,
                                    foregroundColor: const Color(0xffFFEEB9),
                                    backgroundColor: const Color(0xffFFDA95)
                                        .withValues(alpha: .08),
                                    child: Center(
                                      child: Text(
                                        '${index + 1}',
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 24),
                                  Text(
                                    AppNumberFormatter.format(guess.amount,
                                        maxDecimal: 6),
                                    style: const TextStyle(
                                      color: Color(0xff20E6E1),
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    game.tokenName.replaceAll(' Token', ''),
                                    style: const TextStyle(
                                      color: Color(0xff20E6E1),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      context
                                          .read<PlaceGuessBloc>()
                                          .add(PlaceGuessDeleted(id: guess.id));
                                    },
                                    icon: const FaIcon(
                                      FontAwesomeIcons.trashAlt,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
                SliverPadding(
                  padding: const EdgeInsetsGeometry.symmetric(
                      horizontal: 24, vertical: 16),
                  sliver: SliverToBoxAdapter(
                    child: Material(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () async {
                          final remainingsInMinute =
                              DateTime.parse('${game.stopTime}Z')
                                  .difference(DateTime.now())
                                  .inMinutes;

                          if (remainingsInMinute <= 0) {
                            toastification.show(
                              style: ToastificationStyle.fillColored,
                              type: ToastificationType.error,
                              title: const Text(
                                  // ignore: lines_longer_than_80_chars
                                  'Predictions are closed for this game. The game has already ended.'),
                              borderRadius: BorderRadius.circular(6),
                              autoCloseDuration: const Duration(seconds: 4),
                            );
                            return;
                          }

                          final amount =
                              await showGussBottomSheet(context, game);

                          if (amount != null && context.mounted) {
                            context
                                .read<PlaceGuessBloc>()
                                .add(PlaceGuessAdded(amount: amount));
                          }
                        },
                        child: SizedBox(
                          width: double.infinity,
                          height: 70,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: const Color(0xffFFEEB9)
                                  .withValues(alpha: .08),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                const SizedBox(width: 14),
                                CircleAvatar(
                                  radius: 24,
                                  foregroundColor: const Color(0xffFFDA95),
                                  backgroundColor: const Color(0xffFFDA95)
                                      .withValues(alpha: .08),
                                  child: const Center(
                                    child: Icon(Icons.add),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Text(
                                  'Add guess',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              width: double.infinity,
              child: Stack(
                children: [
                  Column(
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: const Color(0xffFFDA95).withValues(alpha: .16),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 24),
                            BlocSelector<PlaceGuessBloc, PlaceGuessState, int>(
                              selector: (state) {
                                return state.guesses.length;
                              },
                              builder: (context, count) {
                                return Column(
                                  spacing: 24,
                                  children: [
                                    (
                                      'Number Guess',
                                      AppNumberFormatter.format(
                                        count.toDouble(),
                                        maxDecimal: 2,
                                      )
                                    ),
                                    (
                                      'Payable',
                                      '${AppNumberFormatter.format(
                                        count.toDouble() * 10,
                                        maxDecimal: 2,
                                      )} \$'
                                    )
                                  ].map((e) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        spacing: 16,
                                        children: [
                                          Text(
                                            e.$1,
                                            style: const TextStyle(
                                              color: Color(0xffFFEEB9),
                                              fontSize: 14,
                                            ),
                                          ),
                                          const Expanded(
                                            child: SizedBox(
                                              height: 4,
                                              child: DashedDivider(),
                                            ),
                                          ),
                                          Text(
                                            e.$2,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                );
                              },
                            ),
                            const SizedBox(height: 64),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                  const Positioned(
                    bottom: 0,
                    right: 64,
                    left: 64,
                    child: _PayBtn(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _PayBtn extends HookWidget {
  const _PayBtn();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HealthStatusCubit>().state.status;
    final isActive = context
        .watch<UserStatsCubit>()
        .state
        .maybeWhen(orElse: () => false, success: (stats) => stats.isActive);
    final canShowAction = state?.checked ?? false;
    final message = state?.message;

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xff111110),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocSelector<PlaceGuessBloc, PlaceGuessState,
            (bool isValid, bool isInProgress)>(
          selector: (state) {
            return (
              state.guesses.isNotEmpty,
              state.payStatus == PayGameGuessStatus.inProgress
            );
          },
          builder: (context, state) {
            final isValid = state.$1;
            final isInProgress = state.$2;

            return AppButton(
              color: const Color(0xff20E6E1),
              borderColor: const Color(0xff20E6E1),
              textColor: const Color(0xff20E6E1),
              text: 'Pay',
              isLoading: isInProgress,
              onPressed: !isValid
                  ? null
                  : () {
                      if (!isActive) {
                        if (!canShowAction) {
                          toastification.show(
                            style: ToastificationStyle.fillColored,
                            type: ToastificationType.error,
                            title: Text(message ?? ''),
                            borderRadius: BorderRadius.circular(6),
                            autoCloseDuration: const Duration(seconds: 4),
                          );
                        } else {
                          context
                              .read<ReownBloc>()
                              .add(ReownLogginButtonPressed(
                            onSuccess: () {
                              context
                                  .read<PlaceGuessBloc>()
                                  .add(PlaceGuessPayed());
                            },
                          ));
                        }

                        return;
                      }

                      context.read<PlaceGuessBloc>().add(PlaceGuessPayed());
                    },
            );
          },
        ),
      ),
    );
  }
}
