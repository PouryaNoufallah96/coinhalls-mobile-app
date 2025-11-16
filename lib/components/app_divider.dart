import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(double.infinity, 3),
      painter: _AppDividerPainter(),
    );
  }
}

class _AppDividerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xffFFEEB9)
      ..style = PaintingStyle.fill;

    canvas
      ..drawCircle(Offset.zero, 3, paint)
      ..drawLine(Offset.zero, Offset(size.width, 0), paint)
      ..drawCircle(Offset(size.width, 0), 3, paint);
  }

  @override
  bool shouldRepaint(_AppDividerPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_AppDividerPainter oldDelegate) => false;
}
