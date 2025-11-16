import 'package:flutter/material.dart';

class AppScaffold extends Scaffold {
  AppScaffold({
    super.key,
    super.appBar,
    super.bottomNavigationBar,
    super.resizeToAvoidBottomInset,
    super.backgroundColor,
    List<Widget> children = const [],
    Widget? body,
    Color? color,
    Gradient? gradient,
  }) : super(
          body: _AppScaffold(
            key: key,
            color: color,
            gradient: gradient,
            children: children,
            child: body,
          ),
        );
}

class _AppScaffold extends StatelessWidget {
  const _AppScaffold({
    required this.child,
    required this.color,
    required this.gradient,
    required this.children,
    super.key,
  });

  final Widget? child;
  final Color? color;
  final Gradient? gradient;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: gradient ??
                  RadialGradient(
                    radius: 1,
                    colors: [
                      color ?? const Color(0xff534739),
                      const Color(0xff0C0C0B),
                    ],
                  ),
            ),
          ),
        ),
        ...children,
        if (child != null) Positioned.fill(child: child!),
      ],
    );
  }
}
