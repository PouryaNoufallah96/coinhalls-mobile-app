import 'package:coin_hall/components/app_button.dart';
import 'package:coin_hall/core/services/game_service/models.dart';
import 'package:coin_hall/core/utils/input_formatter.dart';
import 'package:coin_hall/core/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

Future<double?> showGussBottomSheet(
  BuildContext context,
  GameData data,
) async {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    constraints: BoxConstraints(
      maxHeight: context.mSize.height * .8,
    ),
    builder: (context) {
      return _GuessSheet(
        data: data,
      );
    },
  );
}

class _GuessSheet extends HookWidget {
  const _GuessSheet({
    required this.data,
  });

  final GameData data;

  @override
  Widget build(BuildContext context) {
    final value = useState<double>(0);

    final GameData(:endTime, :title, :tokenName) = data;
    final remainingsInDays =
        DateTime.parse(endTime).difference(DateTime.now()).inDays;

    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
        child: SizedBox(
          width: double.infinity,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff030202),
                  Color(0xff3E362C),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 64),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 3,
                    width: 40,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: const Color(0xff71717A),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Your guess',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'How many $tokenName tokens will $title cost in the next $remainingsInDays Days?',
                    maxLines: 10,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xffFEF6C0),
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Column(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Your Guess',
                        style: TextStyle(
                          color: Color(0xffFFEEB9),
                        ),
                      ),
                      TextFormField(
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        inputFormatters: [
                          SwapAmountFormatter(),
                        ],
                        onChanged: (v) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            final amount = NumberFormat().tryParse(v) ?? 0;
                            value.value = amount.toDouble();
                          });
                        },
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Guess',
                          hintStyle: TextStyle(
                            color: Color(0xffA5A4A2),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  AppButton(
                    onPressed: value.value == 0
                        ? null
                        : () {
                            context.pop(value.value);
                          },
                  ),
                  const SizedBox(height: 48),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
