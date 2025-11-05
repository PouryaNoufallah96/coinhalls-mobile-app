import 'package:coin_hall/core/blocs/categories/categories_cubit.dart';
import 'package:coin_hall/core/blocs/fetch_list_base_cubit/fetch_list_base_cubit.dart';
import 'package:coin_hall/core/services/game_service/models.dart';
import 'package:coin_hall/pages/home_page/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameCategories extends StatelessWidget {
  const GameCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, FetchListBaseState<GameCategory>>(
      builder: (context, state) {
        if (state is FetchListBaseSuccess<GameCategory>) {
          return SliverList.builder(
            itemCount: state.data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(12),
                child: CategoryCard(category: state.data[index]),
              );
            },
          );
        }

        return const SliverFillRemaining(
          child: Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        );
      },
    );
  }
}
