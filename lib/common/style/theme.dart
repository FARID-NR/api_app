

import 'package:api_app/common/style/color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const horizontalMargin = 21.0;
  static const radius = 10.0;

  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColor.scaffoldBacground,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    primaryColor: AppColor.accentColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColor.accentColor
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: AppColor.primaryText,
      ),
      titleTextStyle: TextStyle(
        color: AppColor.primaryText,
        fontSize: 20,
        fontWeight: FontWeight.w500
      ),
      toolbarTextStyle: TextStyle(
        color: AppColor.primaryText,
        fontSize: 20,
        fontWeight: FontWeight.w500
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColor.scaffoldBacground,
      unselectedLabelStyle: TextStyle(fontSize: 12),
      selectedLabelStyle: TextStyle(fontSize: 12),
      unselectedItemColor: Color(0xFFB1A274),
      selectedItemColor: AppColor.accentColor,
    ),
    tabBarTheme: const TabBarTheme(
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: AppColor.accentColor,
      unselectedLabelColor: AppColor.secondaryColor
    )
  );
}
