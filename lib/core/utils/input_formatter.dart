// ignore_for_file: lines_longer_than_80_chars

import 'dart:math' as math;

import 'package:flutter/services.dart';

class SwapAmountFormatter extends TextInputFormatter {
  SwapAmountFormatter({
    this.maxDecimals = 12, // برای اعداد کریپتویی مناسب‌تر
    this.decimalSeparator = '.',
    this.groupingSeparator = ',',
    this.useGrouping = true,
    this.allowNegative = false,
    this.min,
    this.max,
    this.normalizeLeadingZeroes = true,
    this.zeroWhenEmpty = true,
  });

  final int maxDecimals;
  final String decimalSeparator;
  final String groupingSeparator;
  final bool useGrouping;
  final bool allowNegative;
  final String? max;
  final String? min;
  final bool normalizeLeadingZeroes;
  final bool zeroWhenEmpty;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var t = newValue.text;

    // فقط '-' تایپ شده؟
    final typedOnlyMinus = allowNegative && newValue.text == '-';

    // فیلتر کاراکترها
    final allowed = RegExp(
      '[0-9${RegExp.escape(decimalSeparator)}${RegExp.escape(groupingSeparator)}${allowNegative ? '-' : ''}]',
    );
    t = t.split('').where(allowed.hasMatch).join();

    // علامت منفی
    var hasSign = false;
    if (allowNegative && t.contains('-')) {
      hasSign = t.startsWith('-');
      t = t.replaceAll('-', '');
    }

    // حذف جداکننده هزارگان برای پردازش
    t = t.replaceAll(groupingSeparator, '');

    // فقط یک جداکننده اعشار نگه داریم
    final firstSep = t.indexOf(decimalSeparator);
    if (firstSep != -1) {
      final before = t.substring(0, firstSep + 1);
      final after = t.substring(firstSep + 1).replaceAll(decimalSeparator, '');
      t = before + after;
    }

    // اگر با جداکننده اعشار شروع شد -> "0."
    if (t.startsWith(decimalSeparator)) {
      t = '0$decimalSeparator${t.substring(1)}';
    }

    if (normalizeLeadingZeroes) {
      t = _stripLeadingZeros(t);
    }

    // برش اعشار «هوشمند» با حفظ صفرهای پیشرو و حداقل یک رقم معنادار
    final sepIndex = t.indexOf(decimalSeparator);
    if (sepIndex != -1) {
      final frac = t.substring(sepIndex + 1);
      if (frac.length > maxDecimals) {
        final leadingZeros =
            RegExp('^0+').firstMatch(frac)?.group(0)?.length ?? 0;
        final allowedLen = math.max(maxDecimals, leadingZeros + 1);
        final keep = math.min(frac.length, allowedLen);
        t = t.substring(0, sepIndex + 1 + keep);
      }
    }

    if (hasSign) t = '-$t';

    // اگر خالی شد
    if (t.isEmpty) {
      if (typedOnlyMinus) {
        return newValue.copyWith(
          text: '-',
          selection: const TextSelection.collapsed(offset: 1),
        );
      }
      if (zeroWhenEmpty) {
        var result = _formatForDisplay('0');
        result = _clampIfNeeded(result);
        return TextEditingValue(
          text: result,
          selection: TextSelection.collapsed(offset: result.length),
        );
      } else {
        return newValue.copyWith(
          text: t,
          selection: const TextSelection.collapsed(offset: 0),
        );
      }
    }

    final endsWithSep = t.endsWith(decimalSeparator);
    String intPart;
    var fracPart = '';
    final idx = t.indexOf(decimalSeparator);
    final signed = hasSign ? '-' : '';

    if (idx == -1) {
      intPart = hasSign ? t.substring(1) : t;
    } else {
      intPart = hasSign ? t.substring(1, idx) : t.substring(0, idx);
      if (!endsWithSep) {
        fracPart = t.substring(idx + 1); // ❗️اعشار را دست‌نخورده نگه می‌داریم
      }
    }

    final groupedInt = useGrouping ? _addGrouping(intPart) : intPart;

    String result;
    if (endsWithSep) {
      result = '$signed$groupedInt$decimalSeparator';
    } else if (idx == -1) {
      result = '$signed$groupedInt';
    } else {
      result = '$signed$groupedInt$decimalSeparator$fracPart';
    }

    result = _clampIfNeeded(result);

    return TextEditingValue(
      text: result,
      selection: TextSelection.collapsed(offset: result.length),
    );
  }

  String _stripLeadingZeros(String s) {
    final sep = decimalSeparator;
    final sign = s.startsWith('-') ? '-' : '';
    var body = sign.isNotEmpty ? s.substring(1) : s;

    if (!body.startsWith('0')) return s;

    final i = body.indexOf(sep);
    if (i == -1) {
      body = body.replaceFirst(RegExp('^0+'), '');
      if (body.isEmpty) body = '0';
      return sign + body;
    } else {
      var intPart = body.substring(0, i).replaceFirst(RegExp('^0+'), '');
      if (intPart.isEmpty) intPart = '0';
      // بخش اعشار را همان‌طور که هست نگه می‌داریم
      return sign + intPart + body.substring(i);
    }
  }

  String _addGrouping(String digits) {
    if (digits.length <= 3) return digits;
    final buf = StringBuffer();
    var count = 0;
    for (var i = digits.length - 1; i >= 0; i--) {
      buf.write(digits[i]);
      count++;
      if (count == 3 && i != 0) {
        buf.write(groupingSeparator);
        count = 0;
      }
    }
    return buf.toString().split('').reversed.join();
  }

  String _removeGrouping(String x) => x.replaceAll(groupingSeparator, '');

  String _clampIfNeeded(String value) {
    // مقدار فعلی را بدون هزارگان برای مقایسه بسازیم
    final raw = _removeGrouping(value);

    // precision فقط روی طول اعشار اعمال می‌شود، بدون حذف trailing zeros
    String applyPrecision(String x) {
      final i = x.indexOf(decimalSeparator);
      if (i == -1) return x;
      final frac = x.substring(i + 1);
      if (frac.length <= maxDecimals) return x;

      // برش هوشمند: صفرهای پیشرو + حداقل یک رقم معنادار
      final leadingZeros =
          RegExp('^0+').firstMatch(frac)?.group(0)?.length ?? 0;
      final allowedLen = math.max(maxDecimals, leadingZeros + 1);
      final keep = math.min(frac.length, allowedLen);
      return x.substring(0, i + 1 + keep);
    }

    // مقدار نهایی که برمی‌گردانیم
    var ret = value;

    // اگر min/max تعریف شده، مقایسه و کلَمپ
    if (max != null && _compare(raw, _removeGrouping(max!)) > 0) {
      ret = _formatForDisplay(applyPrecision(_removeGrouping(max!)));
    } else if (min != null && _compare(raw, _removeGrouping(min!)) < 0) {
      ret = _formatForDisplay(applyPrecision(_removeGrouping(min!)));
    } else {
      // در غیر این صورت، فقط precision روی مقدار فعلی اعمال شود (بدون حذف صفرها)
      ret = _formatForDisplay(applyPrecision(_removeGrouping(ret)));
    }

    return ret; // ❗️هیچ حذف صفرِ انتهایی انجام نمی‌دهیم
  }

  // فرمت نهایی برای نمایش: فقط هزارگانِ بخش صحیح را اضافه می‌کند،
  // بخش اعشار را همان‌طور که هست نگه می‌دارد.
  String _formatForDisplay(String raw) {
    final sign = raw.startsWith('-') ? '-' : '';
    final noSign = sign.isNotEmpty ? raw.substring(1) : raw;

    final i = noSign.indexOf(decimalSeparator);
    String intPart;
    var fracPart = '';

    if (i == -1) {
      intPart = noSign;
    } else {
      intPart = noSign.substring(0, i);
      fracPart = noSign.substring(i + 1); // ❗️بدون تغییر
    }

    final groupedInt = useGrouping ? _addGrouping(intPart) : intPart;
    return (i == -1)
        ? '$sign$groupedInt'
        : '$sign$groupedInt$decimalSeparator$fracPart';
  }

  // مقایسه‌ی رشته‌ایِ اعداد (بدون وابستگی به طول اعشار)
  int _compare(String a, String b) {
    bool neg(String x) => x.startsWith('-');
    final sa = neg(a);
    final sb = neg(b);
    if (sa != sb) return sa ? -1 : 1;
    final sign = sa ? -1 : 1;

    String stripLeadZerosFull(String x) {
      final s = x.startsWith('-') ? x.substring(1) : x;
      final i = s.indexOf(decimalSeparator);
      if (i == -1) {
        final n = s.replaceFirst(RegExp('^0+'), '');
        return (x.startsWith('-') ? '-' : '') + (n.isEmpty ? '0' : n);
      } else {
        var intPart = s.substring(0, i).replaceFirst(RegExp('^0+'), '');
        if (intPart.isEmpty) intPart = '0';
        final frac = s.substring(i + 1).replaceFirst(RegExp(r'0+$'), '');
        return (x.startsWith('-') ? '-' : '') +
            intPart +
            (frac.isEmpty ? '' : '$decimalSeparator$frac');
      }
    }

    List<String> parts(String x) {
      final s = stripLeadZerosFull(x);
      final isNeg = s.startsWith('-');
      final body = isNeg ? s.substring(1) : s;
      final i = body.indexOf(decimalSeparator);
      if (i == -1) return [body, ''];
      return [body.substring(0, i), body.substring(i + 1)];
    }

    final pa = parts(a);
    final pb = parts(b);

    if (pa[0].length != pb[0].length) {
      return sign * (pa[0].length > pb[0].length ? 1 : -1);
    }

    final ic = pa[0].compareTo(pb[0]);
    if (ic != 0) return sign * (ic > 0 ? 1 : -1);

    final L = pa[1].length > pb[1].length ? pa[1].length : pb[1].length;
    final fa = pa[1].padRight(L, '0');
    final fb = pb[1].padRight(L, '0');
    final fc = fa.compareTo(fb);
    if (fc == 0) return 0;
    return sign * (fc > 0 ? 1 : -1);
  }
}
