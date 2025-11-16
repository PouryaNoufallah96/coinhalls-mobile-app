import 'package:coin_hall/core/blocs/prices/price_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistorySymbolFilter extends StatelessWidget {
  const HistorySymbolFilter({
    required this.notifier,
    super.key,
  });

  final ValueNotifier<String> notifier;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: BlocSelector<PriceBloc, PriceState, List<String>>(
        selector: (state) {
          return state.prices.map((e) => e.tokenName).toList();
        },
        builder: (context, prices) {
          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemCount: prices.length + 1,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final text = index == 0 ? 'All' : prices[index - 1];
              final isSelected = notifier.value == text;

              return InkWell(
                onTap: () {
                  notifier.value = text;
                },
                child: SizedBox(
                  width: 96,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color(0xffFFDA95)
                            .withValues(alpha: isSelected ? 1 : .08),
                        border: Border.all(color: const Color(0xffFFDA95))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Center(
                        child: Text(
                          text,
                          style: TextStyle(
                            fontSize: 12,
                            color: isSelected
                                ? const Color(0xff0C0C0B)
                                : const Color(0xffFFDA95),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
