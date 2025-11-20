import 'package:coin_hall/components/app_button.dart';
import 'package:coin_hall/components/app_divider.dart';
import 'package:coin_hall/components/app_scaffold.dart';
import 'package:coin_hall/core/blocs/fetch_list_base_cubit/fetch_list_base_cubit.dart';
import 'package:coin_hall/core/services/game_service/models.dart';
import 'package:coin_hall/core/utils/number_formatter.dart';
import 'package:coin_hall/pages/select_game/cubit/select_game_cubit.dart';
import 'package:coin_hall/pages/select_game/widgets/start_game_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class SelectGamePge extends StatelessWidget {
  const SelectGamePge({
    required this.token,
    super.key,
  });

  final String token;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SelectGameCubit(
        gameService: context.read(),
        token: token,
      )..fetch(),
      child: AppScaffold(
        color: const Color(0xff2E5554),
        body: SafeArea(
          child: Stack(
            children: [
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Image.asset(
                      'assets/images/main_shadow.png',
                      color: const Color(0xffFFFFFF).withValues(alpha: .16),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child:
                    BlocBuilder<SelectGameCubit, FetchListBaseState<GameData>>(
                  builder: (context, state) {
                    return switch (state) {
                      final FetchListBaseInitial<GameData> _ =>
                        const SizedBox.shrink(),
                      final FetchListBaseInProgress<GameData> _ => const Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                      final FetchListBaseSuccess<GameData> i => _Body(
                          token: token,
                          data: i.data,
                        ),
                      final FetchListBaseFailure<GameData> _ =>
                        const SizedBox.shrink(),
                    };
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _Body extends HookWidget {
  const _Body({
    required this.data,
    required this.token,
  });

  final List<GameData> data;
  final String token;

  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    final selectedIndex = useState(0);
    final selectedItem = data[selectedIndex.value];

    return Column(
      children: [
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => context.goNamed('home_page'),
              icon: const Icon(
                FontAwesomeIcons.xmark,
                color: Colors.white,
              ),
            ),
            Text(
              data.firstOrNull?.tokenName ?? '',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(
                FontAwesomeIcons.arrowRight,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 42),
        Stack(
          children: [
            Image.asset(
              'assets/images/select_game_frame.png',
              height: height * .6,
            ),
            Positioned.fill(
              child: Column(
                children: [
                  SizedBox(height: height * .1),
                  Hero(
                    transitionOnUserGestures: true,
                    tag: selectedItem.imageUrl,
                    child: Transform.flip(
                      flipX: true,
                      child: Image.network(
                        selectedItem.imageUrl,
                        height: 100,
                        width: width * .55,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: height * .03),
                  SizedBox(
                    width: width * .55,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: const Color(0xff34BEBA).withValues(alpha: .08),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 34),
                        child: Column(
                          children: [
                            Text(
                              selectedItem.gameName,
                              style: const TextStyle(
                                color: Color(0xffFFEEB9),
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 24),
                            const AppDivider(),
                            const SizedBox(height: 24),
                            Text(
                              selectedItem.title ?? '',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '${AppNumberFormatter.format(selectedItem.targetValue, maxDecimal: 2)}\$',
                              style: const TextStyle(
                                color: Color(0xff20E6E1),
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              IconButton.filled(
                onPressed: data.length < 2
                    ? null
                    : () {
                        final newIndex = selectedIndex.value - 1;
                        selectedIndex.value =
                            newIndex < 0 ? data.length - 1 : newIndex;
                      },
                style: IconButton.styleFrom(
                  backgroundColor:
                      const Color(0xff20E6E1).withValues(alpha: .08),
                ),
                icon: const Icon(
                  Icons.chevron_left_rounded,
                  color: Color(0xff20E6E1),
                ),
              ),
              Expanded(
                child: Row(
                  spacing: 8,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(data.length, (index) {
                    return SizedBox.square(
                      dimension: 6,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: index == selectedIndex.value
                              ? const Color(0xff20E6E1)
                              : Colors.black,
                          shape: BoxShape.circle,
                        ),
                      ),
                    );
                  }),
                ),
              ),
              IconButton.filled(
                onPressed: data.length < 2
                    ? null
                    : () {
                        final newIndex = selectedIndex.value + 1;
                        selectedIndex.value =
                            newIndex > data.length - 1 ? 0 : newIndex;
                      },
                style: IconButton.styleFrom(
                  backgroundColor:
                      const Color(0xff20E6E1).withValues(alpha: .08),
                ),
                icon: const Icon(
                  Icons.chevron_right_rounded,
                  color: Color(0xff20E6E1),
                ),
              )
            ],
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: AppButton(
            color: const Color(0xff20E6E1),
            borderColor: const Color(0xff20E6E1),
            textColor: const Color(0xff20E6E1),
            text: 'Start',
            onPressed: () async {
              final res = await showStartGameDialog(context, selectedItem);
              if (res != null && context.mounted) {
                await context.pushNamed('place_guess', extra: res.toJson());
              }
            },
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
