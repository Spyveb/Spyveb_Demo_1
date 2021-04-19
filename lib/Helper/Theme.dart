import 'package:flutter/material.dart';

import 'Helper.dart';

abstract class ThemeMixin {
  static ThemeData getTheme(BuildContext context) {
    final backgroundColor = Helper.hexToColor("#e5e5e5");
    final primaryColor = Helper.hexToColor("#315FD6");
    final accentColor = Helper.hexToColor("#F5A623");

    return ThemeData(
      backgroundColor: backgroundColor,
      primaryColor: primaryColor,
      accentColor: accentColor,
    );
  }
}
