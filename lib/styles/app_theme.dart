import 'package:allevents/const/color_const.dart';
import 'package:allevents/const/font_const.dart';
import 'package:flutter/material.dart';
class AppTheme {
  AppTheme._();

  static ThemeData get appTheme => ThemeData(
    fontFamily: FontConst.metropolis,
        colorScheme: ColorScheme.fromSeed(
          seedColor: ColorConst.seed,
          primary: ColorConst.primary,
          onPrimary: ColorConst.onPrimary,
          surface: ColorConst.surface,
        ),
        scaffoldBackgroundColor: ColorConst.onSurface,
        appBarTheme: AppBarTheme(
            scrolledUnderElevation: 0, backgroundColor: ColorConst.white),
        // actionIconTheme: ActionIconThemeData(
        //   backButtonIconBuilder: (context) {
        //     return DefaultBackButton();
        //   },
        // ),
        textTheme: TextTheme(
            displayLarge: TextStyle(
                fontSize: 24,
                color: ColorConst.textColor,
                fontWeight: FontWeight.w600),
            displayMedium: TextStyle(
                fontSize: 14,
                color: ColorConst.textColor,
                fontWeight: FontWeight.w400),
            displaySmall: TextStyle(
                fontSize: 12,
                color: ColorConst.textColor,
                fontWeight: FontWeight.w400)),
      );
}
