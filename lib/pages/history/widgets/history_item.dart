import 'dart:async';

import 'package:coin_hall/core/services/prediction_service/models.dart';
import 'package:coin_hall/core/utils/number_formatter.dart';
import 'package:coin_hall/pages/history/widgets/edit_guess/edit_guess.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

class HistoryItem extends HookWidget {
  const HistoryItem({
    required this.item,
    required this.onRefresh,
    super.key,
  });

  final PredictionHistory item;
  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    final k = useState(0);
    final key = useMemoized(UniqueKey.new, [k.value]);

    useEffect(() {
      final timer = Timer.periodic(
        const Duration(minutes: 1),
        (timer) {
          k.value = DateTime.now().millisecondsSinceEpoch;
        },
      );

      return timer.cancel;
    });

    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xffFFDA95).withValues(alpha: .08),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                SizedBox.square(
                  dimension: 64,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffFFC65E),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(
                        'assets/images/${item.tokenSymbol.toLowerCase()}.png',
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: [
                      SizedBox(
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                item.gameName,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            _Status(state: item.state),
                            _Edit(
                              item: item,
                              onRefresh: onRefresh,
                            ),
                          ],
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          text: 'Quantity: ',
                          children: [
                            TextSpan(
                              text: AppNumberFormatter.format(
                                item.predictionTokenAmount,
                                maxDecimal: 6,
                              ),
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            )
                          ],
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xffFEEEB9),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              color: const Color(0xffFFDA95).withValues(alpha: .08),
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(8),
              ),
            ),
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: item.state == PredictionState.active ? 34 : 20,
                  vertical: 16,
                ),
                child: item.state == PredictionState.active
                    ? _Timer(
                        key: key,
                        remaining: DateTime.parse(item.gameEndMoment)
                            .difference(DateTime.now()))
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'End date',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xffFEF6C0),
                            ),
                          ),
                          Text(
                            DateFormat('yyyy/MM/dd')
                                .format(DateTime.parse(item.gameStopMoment)),
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Status extends StatelessWidget {
  const _Status({
    required this.state,
  });

  final PredictionState state;

  @override
  Widget build(BuildContext context) {
    final color = switch (state) {
      PredictionState.pending => const Color(0xffFFFFFF),
      PredictionState.active => const Color(0xffFFCD4E),
      PredictionState.lose => const Color(0xffFF1300),
      PredictionState.win => const Color(0xff63E0B0),
    };

    return SizedBox(
      height: 32,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color.withValues(alpha: .08),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Text(
              state.name,
              style: TextStyle(
                color: color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Timer extends StatelessWidget {
  const _Timer({
    required this.remaining,
    super.key,
  });

  final Duration remaining;

  @override
  Widget build(BuildContext context) {
    final days = remaining.inDays;
    final hours = remaining.inHours - (days * 24);
    final minutes = remaining.inMinutes - ((days * 24 * 60) + (hours * 60));

    final data = ['$days', null, '$hours', null, '$minutes']
        .map((e) => e?.padLeft(2, '0'));

    return Row(
      children: [
        ...data.map(
          (e) {
            if (e == null) {
              return Expanded(
                child: Column(
                  spacing: 4,
                  children: List.generate(2, (_) {
                    return const SizedBox.square(
                      dimension: 6,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Color(0xffFFDA95),
                          shape: BoxShape.circle,
                        ),
                      ),
                    );
                  }),
                ),
              );
            }

            final char = e.split('');
            return Row(
              spacing: 8,
              children: [
                ...char.map(
                  (e) {
                    return SizedBox.square(
                      dimension: 32,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: const Color(0xffFFDA95).withValues(alpha: .08),
                          border: Border.all(color: const Color(0xffFFDA95)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(
                            child: Text(
                          e,
                          style: const TextStyle(
                            color: Color(0xffFFDA95),
                          ),
                        )),
                      ),
                    );
                  },
                )
              ],
            );
          },
        ),
      ],
    );
  }
}

class _Edit extends StatelessWidget {
  const _Edit({
    required this.item,
    required this.onRefresh,
  });

  final PredictionHistory item;
  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    if (!item.canEdit) {
      return const SizedBox.shrink();
    }

    return InkWell(
      onTap: () async {
        final isSucceed = await showEditGussBottomSheet(context, item);

        if (isSucceed ?? false) {
          onRefresh();
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: SizedBox.square(
          dimension: 32,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xff34BEBA)),
              color: const Color(0xff34BEBA).withValues(alpha: .08),
            ),
            child: const Center(
              child: Icon(
                Icons.edit,
                color: Color(0xff34BEBA),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
