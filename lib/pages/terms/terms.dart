import 'package:coin_hall/components/app_button.dart';
import 'package:coin_hall/components/app_scaffold.dart';
import 'package:coin_hall/core/blocs/preferences_bloc/preferences_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              'assets/images/terms_frame_1.png',
            ),
          ),
          Positioned.fill(
            right: 32,
            left: 32,
            child: Image.asset(
              'assets/images/terms_frame_2.png',
            ),
          ),
          const Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 50),
                // child: _Body(),
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            top: 48,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const IconButton(
                  onPressed: null,
                  icon: Icon(
                    FontAwesomeIcons.xmark,
                    color: Colors.transparent,
                  ),
                ),
                const Text(
                  'Terms of Use',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    FontAwesomeIcons.arrowRight,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const Positioned.fill(
            child: _Body(),
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
    final isAccepted = useState(false);

    return Column(
      children: [
        const Spacer(flex: 3),
        const Text(
          'Terms of Use',
          style: TextStyle(
            color: Color(0xffFFC65E),
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Spacer(),
        const _Terms(),
        const Spacer(),
        GestureDetector(
          onTap: () {
            isAccepted.value = !isAccepted.value;
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Row(
              children: [
                Checkbox.adaptive(
                  side: const BorderSide(color: Colors.white),
                  activeColor: const Color(0xff34BEBA),
                  value: isAccepted.value,
                  onChanged: (value) {
                    isAccepted.value = value!;
                  },
                ),
                const Text(
                  'I agree to the Terms of Use',
                  style: TextStyle(
                    fontFamily: 'CentraNo1-Book',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64),
          child: AppButton(
            text: 'Start',
            onPressed: !isAccepted.value
                ? null
                : () {
                    context
                        .read<PreferencesBloc>()
                        .add(PreferencesTermsOfUsePassed());

                    Navigator.pop(context, true);
                  },
          ),
        ),
        const Spacer(),
      ],
    );
  }
}

class _Terms extends StatefulWidget {
  const _Terms();

  @override
  State<_Terms> createState() => _TermsState();
}

class _TermsState extends State<_Terms> {
  final Uri _terms = Uri.https('coinhalls.com', '/terms-of-use');

  Future<void> _onTap() async {
    try {
      await launchUrl(
        _terms,
        mode: LaunchMode.inAppWebView,
      );
    } catch (e, s) {
      debugPrint('launch error: $e\n$s');
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 56),
      child: Text.rich(
        TextSpan(
          text:
              // ignore: lines_longer_than_80_chars
              'By connecting my wallet, I acknowledge that I have read, understood, and agree to the ',
          children: [
            TextSpan(
              text: 'Coin halls Terms of Use',
              style: const TextStyle(
                fontFamily: 'CentraNo1-Book',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xff01FFF8),
              ),
              recognizer: TapGestureRecognizer()..onTap = _onTap,
            ),
            const TextSpan(
              text:
                  // ignore: lines_longer_than_80_chars
                  ' which apply to my use of Meta Coin Guard and all its features.',
            ),
          ],
        ),
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontFamily: 'CentraNo1-Book',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
    );
  }
}
