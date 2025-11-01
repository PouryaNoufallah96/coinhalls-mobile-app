import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff534739),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                CustomPaint(
                  size: const Size(double.infinity, 143),
                  painter: _LinePainter(),
                ),
                const Padding(
                  padding: EdgeInsets.all(12),
                  child: SizedBox.square(
                    dimension: 64,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                const SizedBox.shrink()
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final painter = Paint()
      ..color = const Color(0xffFFDA95)
      ..strokeWidth = 1;

    final painter2 = Paint()
      ..color = const Color(0xffFFDA95)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final bgPainter = Paint()
      ..color = const Color(0xffFFDA95).withValues(alpha: .08);

    final path = Path()
      ..moveTo(0, 24)
      ..lineTo(size.width * .33, 24)
      ..arcToPoint(
        Offset(size.width * .67, 24),
        radius: const Radius.circular(58),
      )
      ..lineTo(size.width, 24);

    final bgPath = Path()
      ..moveTo(12, 36)
      ..lineTo(size.width * .35, 36)
      ..arcToPoint(
        Offset(size.width * .65, 36),
        radius: const Radius.circular(50),
      )
      ..lineTo(size.width - 12, 36)
      ..arcToPoint(Offset(size.width, 48), radius: const Radius.circular(12))
      ..lineTo(size.width, size.height - 12)
      ..arcToPoint(Offset(size.width - 12, size.height),
          radius: const Radius.circular(12))
      ..lineTo(12, size.height)
      ..arcToPoint(Offset(0, size.height - 12),
          radius: const Radius.circular(12))
      ..lineTo(0, 48)
      ..arcToPoint(const Offset(12, 36), radius: const Radius.circular(12));

    canvas
      ..drawCircle(const Offset(0, 24), 4, painter)
      ..drawPath(path, painter2)
      ..drawPath(bgPath, bgPainter)
      ..drawCircle(Offset(size.width, 24), 4, painter);
  }

  @override
  bool shouldRepaint(_LinePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_LinePainter oldDelegate) => false;
}
