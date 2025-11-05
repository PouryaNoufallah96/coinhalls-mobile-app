import 'package:coin_hall/components/app_card.dart';
import 'package:coin_hall/core/services/game_service/models.dart';
import 'package:flutter/material.dart';

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
          ),
        ),
      ),
    );
  }
}
