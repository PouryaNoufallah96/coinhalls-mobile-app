import 'package:flutter/material.dart';

class AppScaffold extends Scaffold {
  AppScaffold({
    super.key,
    super.appBar,
    super.bottomNavigationBar,
    super.resizeToAvoidBottomInset,
    super.backgroundColor,
    Widget? body,
    Color? color,
  }) : super(
          body: _AppScaffold(
            key: key,
            color: color,
            child: body,
          ),
        );
}

class _AppScaffold extends StatelessWidget {
  const _AppScaffold({
    required this.child,
    required this.color,
    super.key,
  });

  final Widget? child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                radius: 1,
                colors: [
                  color ?? const Color(0xff534739),
                  const Color(0xff0C0C0B),
                ],
              ),
            ),
          ),
        ),
        if (child != null) Positioned.fill(child: child!),
      ],
    );
  }
}
