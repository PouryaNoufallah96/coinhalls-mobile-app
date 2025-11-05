import 'package:coin_hall/pages/home_page/widgets/game_categories.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: <Widget>[
        SliverPadding(padding: EdgeInsetsGeometry.only(top: 48)),
        SliverToBoxAdapter(
          child: _Header(),
        ),
        GameCategories(),
      ],
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
