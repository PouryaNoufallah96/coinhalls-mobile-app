import 'package:coin_hall/core/blocs/categories/categories_cubit.dart';
import 'package:coin_hall/pages/home_page/widgets/game_categories.dart';
import 'package:coin_hall/pages/nested/cubit/user_stats_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    useOnAppLifecycleStateChange((previous, current) async {
      if (previous == AppLifecycleState.inactive &&
          current == AppLifecycleState.resumed) {
        await Future.wait([
          context.read<UserStatsCubit>().fetch(),
        ]);
      }
    });

    return RefreshIndicator(
      onRefresh: () async {
        await context.read<CategoriesCubit>().fetch();
      },
      child: const CustomScrollView(
        slivers: <Widget>[
          SliverPadding(padding: EdgeInsetsGeometry.only(top: 48)),
          SliverToBoxAdapter(
            child: _Header(),
          ),
          SliverPadding(
            padding: EdgeInsetsGeometry.only(bottom: 164),
            sliver: GameCategories(),
          )
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 84,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 14,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/images/door_frame.png',
              height: 64,
              width: 34,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              'assets/images/chance_header_text.png',
              height: 42,
              width: 230,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/images/door_frame.png',
              height: 64,
              width: 34,
            ),
          ),
        ],
      ),
    );
  }
}
