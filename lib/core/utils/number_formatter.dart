import 'dart:math' as math;

import 'package:intl/intl.dart';

class AppNumberFormatter {
  static double _truncateToDecimals(double x, int fractionDigits) {
    if (!x.isFinite) return x;
    final p = math.pow(10, fractionDigits);
    return (x * p).truncateToDouble() / p;
  }

  static String format(
    double value, {
    int? decimal,
    int? maxDecimal,
  }) {
    int effectiveDecimal;

    if (decimal != null) {
      effectiveDecimal = decimal;
    } else {
      final str = value.toString();
      if (!str.contains('.')) {
        effectiveDecimal = 0;
      } else {
        final cleaned = str.replaceFirst(RegExp(r'0+$'), '');
        effectiveDecimal = cleaned.split('.').last.length;
      }

      if (maxDecimal != null && effectiveDecimal > maxDecimal) {
        effectiveDecimal = maxDecimal;
      }
    }

    final t = _truncateToDecimals(value, effectiveDecimal);

    final tStr = t.toString();
    final decimalsWithoutTrailingZeros = tStr.contains('.')
        ? tStr.split('.').last.replaceFirst(RegExp(r'0+$'), '').length
        : 0;

    return NumberFormat.currency(
      symbol: '',
      locale: 'en',
      decimalDigits: (t % 1 == 0) ? 0 : decimalsWithoutTrailingZeros,
    ).format(t);
  }
}
