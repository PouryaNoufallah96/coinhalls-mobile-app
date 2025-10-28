import 'package:flutter/material.dart';

class DashedDivider extends StatelessWidget {
  const DashedDivider({
    super.key,
    this.axis = Axis.horizontal,
    this.color,
    this.thickness = 2,
    this.dashLength = 2,
    this.gapLength = 4,
    this.indent = 0,
    this.endIndent = 0,
    this.strokeCap = StrokeCap.round,
  });

  final Axis axis;
  final Color? color;
  final double thickness;
  final double dashLength;
  final double gapLength;
  final double indent;
  final double endIndent;
  final StrokeCap strokeCap;

  @override
  Widget build(BuildContext context) {
    final c = color ?? Theme.of(context).primaryColor.withValues(alpha: .16);

    final size = axis == Axis.horizontal
        ? Size(double.infinity, thickness)
        : Size(thickness, double.infinity);

    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: axis == Axis.horizontal ? indent : 0,
        end: axis == Axis.horizontal ? endIndent : 0,
        top: axis == Axis.vertical ? indent : 0,
        bottom: axis == Axis.vertical ? endIndent : 0,
      ),
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: CustomPaint(
          painter: _DashedLinePainter(
            axis: axis,
            color: c,
            thickness: thickness,
            dashLength: dashLength,
            gapLength: gapLength,
            strokeCap: strokeCap,
          ),
        ),
      ),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  _DashedLinePainter({
    required this.axis,
    required this.color,
    required this.thickness,
    required this.dashLength,
    required this.gapLength,
    required this.strokeCap,
  });

  final Axis axis;
  final Color color;
  final double thickness;
  final double dashLength;
  final double gapLength;
  final StrokeCap strokeCap;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = thickness
      ..style = PaintingStyle.stroke
      ..strokeCap = strokeCap;

    if (axis == Axis.horizontal) {
      final y = size.height / 2;
      double x = 0;
      final maxX = size.width;
      while (x < maxX) {
        final x2 = (x + dashLength).clamp(0, maxX).toDouble();
        canvas.drawLine(Offset(x, y), Offset(x2, y), paint);
        x += dashLength + gapLength;
      }
    } else {
      final x = size.width / 2;
      double y = 0;
      final maxY = size.height;
      while (y < maxY) {
        final y2 = (y + dashLength).clamp(0, maxY).toDouble();
        canvas.drawLine(Offset(x, y), Offset(x, y2), paint);
        y += dashLength + gapLength;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DashedLinePainter old) {
    return old.axis != axis ||
        old.color != color ||
        old.thickness != thickness ||
        old.dashLength != dashLength ||
        old.gapLength != gapLength ||
        old.strokeCap != strokeCap;
  }
}
