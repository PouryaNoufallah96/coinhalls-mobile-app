import 'package:coin_hall/components/app_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        const SliverPadding(padding: EdgeInsetsGeometry.only(top: 48)),
        const SliverToBoxAdapter(
          child: _Header(),
        ),
        SliverList.builder(
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.all(24),
              child: AppCard(),
            );
          },
        ),
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
