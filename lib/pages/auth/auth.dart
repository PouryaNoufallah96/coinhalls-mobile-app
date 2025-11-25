import 'package:coin_hall/components/app_button.dart';
import 'package:coin_hall/components/app_scaffold.dart';
import 'package:coin_hall/core/blocs/preferences_bloc/preferences_bloc.dart';
import 'package:coin_hall/core/blocs/reown/reown_bloc.dart';
import 'package:coin_hall/pages/splash/splash.dart';
import 'package:coin_hall/pages/terms/terms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AuthScreen extends HookWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    useSplashSreen();

    return AppScaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Image.asset(
                  'assets/images/main_shadow.png',
                ),
              ),
            ),
          ),
          Positioned.fill(
            right: 32,
            left: 32,
            child: Image.asset(
              'assets/images/circle_1.png',
            ),
          ),
          Positioned.fill(
            right: 38,
            left: 38,
            child: Image.asset(
              'assets/images/circle_2.png',
            ),
          ),
          const Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 50),
                child: _Body(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Body extends HookWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final message = useState('');

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 64),
      child: Column(
        children: [
          const Spacer(flex: 3),
          Image.asset(
            'assets/images/coin_hall_font.png',
            height: 40,
            width: 184,
          ),
          const SizedBox(height: 32),
          const Text(
            'Where fortune favors the bold',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Color(0xffFFC65E),
            ),
          ),
          const Spacer(flex: 3),
          Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Wallet Address',
                style: TextStyle(
                  color: Color(0xffFFEEB9),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.viewInsetsOf(context).bottom * .5),
                child: TextFormField(
                  onChanged: (value) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      message.value = value;
                    });
                  },
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Wallet Address',
                    hintStyle: TextStyle(
                      color: Color(0xffA5A4A2),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Spacer(flex: 3),
          BlocSelector<ReownBloc, ReownState, bool>(
            selector: (state) =>
                state.manualLoginStatus == ManualLoginStatus.inLoading,
            builder: (context, inLoading) {
              return AppButton(
                isLoading: inLoading,
                text: 'Start',
                onPressed: inLoading || message.value.isEmpty
                    ? null
                    : () async {
                        final isTermsAccepted = context
                            .read<PreferencesBloc>()
                            .state
                            .isTermsAccepted;

                        if (!isTermsAccepted) {
                          final res = await Navigator.push(
                              context,
                              MaterialPageRoute<bool>(
                                fullscreenDialog: true,
                                builder: (context) {
                                  return const TermsScreen();
                                },
                              ));

                          if (res == null || !res) {
                            return;
                          }
                        }

                        if (!context.mounted) {
                          return;
                        }

                        context
                            .read<ReownBloc>()
                            .add(ReownAddressLogginButtonPressed(
                              address: message.value,
                            ));
                      },
              );
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
