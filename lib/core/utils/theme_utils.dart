import 'package:coin_hall/core/design_system/theme.dart';
import 'package:flutter/material.dart';

extension BuildContextX on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  ColorExtension get colorExtension => theme.extension()!;

  Size get mSize => MediaQuery.sizeOf(this);
}
