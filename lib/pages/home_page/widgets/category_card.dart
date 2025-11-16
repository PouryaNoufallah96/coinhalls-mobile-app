import 'dart:math';

import 'package:coin_hall/components/app_card.dart';
import 'package:coin_hall/core/blocs/prices/price_bloc.dart';
import 'package:coin_hall/core/services/game_service/models.dart';
import 'package:coin_hall/core/utils/number_formatter.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    required this.category,
    super.key,
  });

  final GameCategory category;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PriceBloc, PriceState, double>(
      selector: (state) {
        return state.prices
                .firstWhereOrNull((e) => e.tokenName == category.tokenSymbol)
                ?.price ??
            0;
      },
      builder: (context, state) {
        final price = 10 / state;

        return Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              context.pushNamed(
                'select_game',
                queryParameters: {'address': category.tokenAddress},
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: AppCard(
                imageSrc:
                    'assets/images/${category.tokenSymbol?.toLowerCase()}.png',
                child: Stack(
                  alignment: Alignment.center,
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
                                Text.rich(
                                  TextSpan(
                                    text:
                                        '${AppNumberFormatter.format(price, maxDecimal: 6)} ',
                                    children: [
                                      TextSpan(
                                        text: '${category.tokenName}',
                                        style: const TextStyle(
                                          color: Color(0xffFFEEB9),
                                          fontSize: 16,
                                        ),
                                      )
                                    ],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                const Text.rich(
                                  TextSpan(
                                    text: '1 ',
                                    children: [
                                      TextSpan(
                                        text: 'Chance',
                                        style: TextStyle(
                                          color: Color(0xffFFEEB9),
                                          fontSize: 16,
                                        ),
                                      )
                                    ],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            spacing: 22,
                            children: [
                              const Text(''),
                              Text(
                                category.tokenName ?? '',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              spacing: 22,
                              children: [
                                Transform.rotate(
                                  angle: -(pi / 4),
                                  child: const Icon(
                                    FontAwesomeIcons.arrowRightLong,
                                    size: 24,
                                    color: Color(0xff34BEBA),
                                  ),
                                ),
                                const Text(
                                  'View games',
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
