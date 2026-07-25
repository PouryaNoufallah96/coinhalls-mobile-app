import 'package:coin_hall/components/app_button.dart';
import 'package:coin_hall/components/app_card.dart';
import 'package:coin_hall/components/app_scaffold.dart';
import 'package:coin_hall/core/blocs/prices/price_bloc.dart';
import 'package:coin_hall/core/services/game_service/models.dart';
import 'package:coin_hall/core/utils/number_formatter.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

Future<GameData?> showStartGameDialog(
  BuildContext context,
  GameData game,
) async {
  return Navigator.push(
    context,
    MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) {
        return AppScaffold(
          gradient: const LinearGradient(
            colors: [
              Color(0xff234442),
              Color(0xff534739),
              Color(0xff111110),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          body: _StartGameDialog(game),
          children: [
            Positioned.fill(
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset('assets/images/game_header_art.png')),
            ),
          ],
        );
      },
    ),
  );
}

class _StartGameDialog extends StatelessWidget {
  const _StartGameDialog(
    this.game,
  );

  final GameData game;

  @override
  Widget build(BuildContext context) {
    final isGameActive = game.state == GameDataState.active;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => context.goNamed('home_page'),
                      icon: const FaIcon(
                        FontAwesomeIcons.xmark,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      game.gameName,
                      style: const TextStyle(
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
                const SizedBox(height: 36),
                Hero(
                  transitionOnUserGestures: true,
                  tag: game.imageUrl,
                  child: Transform.scale(
                    scale: switch (game.tokenSymbol.toLowerCase()) {
                      'jewelry' => 1.3,
                      'trip' => 1.3,
                      'realestate' => 1.2,
                      'industrial' => 1.5,
                      _ => 1,
                    },
                    child: Image.asset(
                      game.imageUrl,
                      fit: BoxFit.contain,
                      height: MediaQuery.sizeOf(context).width * .4,
                    ),
                  ),
                ),
                const SizedBox(height: 34),
                Center(
                  child: Text(
                    game.title ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    '${AppNumberFormatter.format(game.targetValue, maxDecimal: 2)}\$',
                    style: const TextStyle(
                      color: Color(0xff20E6E1),
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 34),
                AppCard(
                  imageSrc:
                      'assets/images/${game.tokenSymbol.toLowerCase()}.png',
                  child: Stack(
                    children: [
                      Positioned(
                        top: 56,
                        left: 20,
                        right: 20,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 22,
                                children: [
                                  const Text(
                                    'Price:',
                                    style: TextStyle(
                                      color: Color(0xffFFEEB9),
                                      fontSize: 16,
                                    ),
                                  ),
                                  BlocSelector<PriceBloc, PriceState, double>(
                                    selector: (state) {
                                      return state.prices
                                              .firstWhereOrNull((element) =>
                                                  element.tokenName ==
                                                  game.tokenSymbol)
                                              ?.price ??
                                          0;
                                    },
                                    builder: (context, price) {
                                      return Text(
                                        '${AppNumberFormatter.format(price, maxDecimal: 2)}\$',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20,
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              spacing: 22,
                              children: [
                                const Text(''),
                                Text(
                                  game.tokenName,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                spacing: 22,
                                children: [
                                  Icon(
                                    Icons.signal_cellular_alt_rounded,
                                    color: Color(0xffFFD700),
                                    size: 24,
                                  ),
                                  Text(
                                    'Price Chart',
                                    style: TextStyle(
                                      color: Color(0xffFFEEB9),
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xffFFDA95).withValues(alpha: .08),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      spacing: 24,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total money collected',
                              style: TextStyle(
                                color: Color(0xffFEF6C0),
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              '${AppNumberFormatter.format(game.prizeValue, maxDecimal: 2)} \$',
                              style: const TextStyle(
                                color: Color(0xffFFCD4E),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        ...[
                          ('Start date', DateTime.parse(game.startTime)),
                          ('Stop date', DateTime.parse(game.stopTime)),
                          ('End date', DateTime.parse(game.endTime)),
                        ].map((e) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                e.$1,
                                style: const TextStyle(
                                  color: Color(0xffFEF6C0),
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                DateFormat('yyyy/MM/dd').format(e.$2),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          );
                        }),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: AppButton(
              onPressed: !isGameActive ? null : () => context.pop(game),
              text: !isGameActive ? 'Expired' : 'Try the guess',
            ),
          )
        ],
      ),
    );
  }
}
