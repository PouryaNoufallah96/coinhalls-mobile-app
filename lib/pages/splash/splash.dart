import 'dart:async';

import 'package:coin_hall/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void useSplashSreen() {
  final context = useContext();

  final entry = OverlayEntry(
    builder: (context) {
      return const SplashScreen();
    },
  );
  final notifier = SplashStateProvider.of(context)!.notifier! as SplashState;
  useEffect(() {
    final value = notifier.value;

    if (value) {
      return null;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Overlay.of(context).insert(entry);
    });

    final timer = Timer(const Duration(seconds: 5), () {
      entry.remove();
      notifier.change();
    });

    return timer.cancel;
  }, []);
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset('assets/images/splash_frame.jpg'),
    );
  }
}
