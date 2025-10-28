import 'package:coin_hall/core/utils/number_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppToken extends StatelessWidget {
  const AppToken({
    required this.src,
    required this.name,
    this.desc,
    this.textStyle,
    this.descTextStyle,
    this.price,
    this.size = 24,
    super.key,
  });

  final String src;
  final String name;
  final String? desc;
  final double size;
  final TextStyle? textStyle;
  final TextStyle? descTextStyle;
  final double? price;

  bool get _isSvg => src.endsWith('.svg');

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (_isSvg)
          SvgPicture.asset(
            src,
            height: size,
            width: size,
          )
        else
          Image.asset(
            src,
            height: size,
            width: size,
            errorBuilder: (context, error, stackTrace) {
              return const SizedBox();
            },
          ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 2,
          children: [
            Text(
              name,
              style: textStyle ??
                  const TextStyle(
                    fontFamily: 'CentraNo1-Book',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            if (desc != null)
              Text(
                '$desc',
                style: descTextStyle ??
                    const TextStyle(
                      fontFamily: 'CentraNo1-Medium',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            if (price != null)
              Text(
                '\$ ${AppNumberFormatter.format(price!, decimal: 2)}',
                style: const TextStyle(
                  fontFamily: 'CentraNo1-Medium',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
          ],
        ),
      ],
    );
  }
}
