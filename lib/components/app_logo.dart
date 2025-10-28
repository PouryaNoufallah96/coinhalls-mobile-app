import 'package:coin_hall/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AppLogo extends HookWidget {
  const AppLogo({
    this.withAnimation = true,
    super.key,
  });

  final bool withAnimation;

  @override
  Widget build(BuildContext context) {
    final controller =
        useAnimationController(duration: const Duration(milliseconds: 1000));

    useEffect(() {
      if (withAnimation) {
        controller.repeat(reverse: true);
      } else {
        controller
          ..stop()
          ..reset();
      }
      return null;
    }, [withAnimation]);

    final curved = useMemoized(
      () => CurvedAnimation(parent: controller, curve: Curves.easeInOut),
      [controller],
    );

    final dy = useAnimation(
      Tween<double>(begin: -6, end: 6).animate(curved),
    );

    return Transform.translate(
      offset: Offset(0, withAnimation ? dy : 0),
      child: Assets.images.appIcon.image(
        height: 200,
        width: 200,
      ),
    );
  }
}
