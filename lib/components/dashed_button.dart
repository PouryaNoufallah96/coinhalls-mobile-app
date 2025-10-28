import 'package:flutter/material.dart';

class DashedOutlinedButton extends StatelessWidget {
  const DashedOutlinedButton({
    required this.onPressed,
    required this.child,
    super.key,
    this.radius = 12,
    this.strokeWidth = 1.5,
    this.dash = const [6, 3],
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  });

  final VoidCallback? onPressed;
  final Widget child;
  final double radius;
  final double strokeWidth;
  final List<double> dash;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final color = onPressed == null
        ? Theme.of(context).disabledColor
        : Theme.of(context).colorScheme.primary;

    return LayoutBuilder(builder: (context, c) {
      return SizedBox(
        width: c.maxWidth,
        child: Stack(
          children: [
            OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                side: BorderSide.none,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius),
                ),
                padding: padding,
              ),
              child: child,
            ),
            Positioned.fill(
              child: IgnorePointer(
                child: CustomPaint(
                  painter: DashedBorderPainter(
                    color: color,
                    strokeWidth: strokeWidth,
                    radius: radius,
                    dashArray: dash,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class DashedBorderPainter extends CustomPainter {
  DashedBorderPainter({
    required this.color,
    required this.strokeWidth,
    required this.radius,
    required this.dashArray,
  });

  final Color color;
  final double strokeWidth;
  final double radius;
  final List<double> dashArray;

  @override
  void paint(Canvas canvas, Size size) {
    if (size.width <= 0 || size.height <= 0) return;
    if (dashArray.isEmpty || dashArray.any((d) => d <= 0)) return;

    final rect = Rect.fromLTWH(
      strokeWidth / 2,
      strokeWidth / 2,
      size.width - strokeWidth,
      size.height - strokeWidth,
    );

    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(radius));
    final path = Path()..addRRect(rrect);

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    final dashed = _dashPath(path, dashArray);
    canvas.drawPath(dashed, paint);
  }

  Path _dashPath(Path source, List<double> dashArray) {
    final dashed = Path();

    for (final metric in source.computeMetrics()) {
      var distance = 0.0;
      var index = 0;
      final total = metric.length;

      while (distance < total) {
        final len = dashArray[index % dashArray.length].abs();
        if (len == 0) break;

        final next = (distance + len).clamp(0.0, total);
        final isDraw = index.isEven;

        if (isDraw) {
          dashed.addPath(
            metric.extractPath(distance, next),
            Offset.zero,
          );
        }

        if (next == distance) break;

        distance = next;
        index++;
      }
    }

    return dashed;
  }

  @override
  bool shouldRepaint(covariant DashedBorderPainter old) {
    return true;
  }
}
