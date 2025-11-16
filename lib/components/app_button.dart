import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.onPressed,
    this.color = const Color(0xffFFDA95),
    this.borderColor = const Color(0xffFFEEB9),
    this.textColor = const Color(0xffFFCD4E),
    super.key,
    this.text = 'Submit',
    this.height = 56,
    this.isLoading = false,
  });

  final VoidCallback? onPressed;
  final String text;
  final double height;
  final Color color;
  final Color borderColor;
  final Color textColor;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: onPressed == null ? .7 : 1,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onPressed,
          child: Container(
            height: height,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: GradientBoxBorder(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  colors: [
                    borderColor.withValues(alpha: .08),
                    borderColor,
                    borderColor.withValues(alpha: .08),
                  ],
                ),
              ),
              gradient: LinearGradient(
                colors: [
                  color.withValues(alpha: .25),
                  color.withValues(alpha: 0),
                  color.withValues(alpha: .25),
                ],
              ),
            ),
            alignment: Alignment.center,
            child: isLoading
                ? Center(
                    child: CircularProgressIndicator.adaptive(
                      valueColor: AlwaysStoppedAnimation(textColor),
                    ),
                  )
                : Text(
                    text,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: textColor,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

class GradientBoxBorder extends BoxBorder {
  const GradientBoxBorder({
    required this.gradient,
    this.width = 1.0,
    this.borderRadius,
  });

  final Gradient gradient;
  final double width;
  final BorderRadiusGeometry? borderRadius;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(width);

  @override
  bool get isUniform => true;

  @override
  GradientBoxBorder scale(double t) {
    return GradientBoxBorder(
      gradient: gradient,
      width: width * t,
      borderRadius: borderRadius,
    );
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    final rrect = _resolveRRect(rect, textDirection)
        .deflate(width); // داخل را کوچیک‌تر کن
    return Path()..addRRect(rrect);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()..addRRect(_resolveRRect(rect, textDirection));
  }

  RRect _resolveRRect(Rect rect, TextDirection? textDirection) {
    if (borderRadius != null) {
      return borderRadius!.resolve(textDirection).toRRect(rect);
    }
    return RRect.fromRectAndRadius(rect, Radius.zero);
  }

  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    TextDirection? textDirection,
    BoxShape shape = BoxShape.rectangle,
    BorderRadius? borderRadius,
  }) {
    // اگه توی paint هم borderRadius اومد، اونو ترجیح بده
    final resolvedRRect = (borderRadius ?? this.borderRadius)
            ?.resolve(textDirection)
            .toRRect(rect) ??
        RRect.fromRectAndRadius(rect, Radius.zero);

    // خیلی مهم: برای Stroke باید وسط لبه بکشیم
    final paintRect = resolvedRRect.deflate(width / 2);

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    canvas.drawRRect(paintRect, paint);
  }

  @override
  BorderSide get bottom => BorderSide(width: width, color: Colors.transparent);

  @override
  BorderSide get top => BorderSide(width: width, color: Colors.transparent);
}
