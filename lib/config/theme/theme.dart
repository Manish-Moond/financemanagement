import 'package:financemanagement/config/theme/text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightTheme = ThemeData(
    // fontFamily: "Inter",
    // appBarTheme: const AppBarTheme(color: primaryColor),
    textTheme: AppTextTheme.lightTextTheme,
    useMaterial3: true,
  );
  static ThemeData darkTheme = ThemeData();
}
