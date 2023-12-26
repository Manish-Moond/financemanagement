import 'package:financemanagement/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class AppTextTheme {
  static TextTheme lightTextTheme = const TextTheme(
      titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      headlineSmall: TextStyle(fontWeight: FontWeight.w500),
      labelMedium: TextStyle(color: ktextColorsSecondry));
  static TextTheme darkTextTheme = const TextTheme();
}
