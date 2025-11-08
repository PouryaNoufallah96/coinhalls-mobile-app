import 'package:coin_hall/components/app_card.dart';
import 'package:coin_hall/core/services/game_service/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    required this.category,
    super.key,
  });

  final GameCategory category;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {},
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
                                text: '3 ',
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
                                text: '3 ',
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
                            SizedBox.square(
                              dimension: 24,
                              child: SvgPicture.asset(
                                'assets/icons/arrow-up-right2.svg',
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
  }
}
