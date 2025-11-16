import 'package:coin_hall/pages/history/active_history/active_history.dart';
import 'package:coin_hall/pages/history/expired_history/expired_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HistoryPage extends HookWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTabController(initialLength: 2);
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 24),
          TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: const Color(0xff34BEBA),
            labelColor: const Color(0xff01FFF8),
            unselectedLabelColor: const Color(0xffA0A0A0),
            dividerColor: const Color(0xffA0A0A0),
            labelStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            controller: controller,
            tabs: const [
              Tab(
                text: 'Active',
              ),
              Tab(
                text: 'Expired',
              )
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: controller,
              children: const [
                ActiveHistory(),
                ExpiredHistory(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
