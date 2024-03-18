import 'package:ecommerce_flutter/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Styles {
  static ThemeData themeData(
      {required bool isDarkTheme, required BuildContext context}) {
    return ThemeData(
      scaffoldBackgroundColor: isDarkTheme
          ? AppColors.darkScaffoldColor
          : AppColors.lightScaffoldColor,
      cardColor: isDarkTheme
          ? AppColors.darkScaffoldColor
          : AppColors.lightScaffoldColor,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      appBarTheme: AppBarTheme(
        iconTheme:
            IconThemeData(color: isDarkTheme ? Colors.white : Colors.black),
        backgroundColor: isDarkTheme
            ? AppColors.darkScaffoldColor
            : AppColors.lightScaffoldColor,
        elevation: 0,
        titleTextStyle:
            TextStyle(
            color: isDarkTheme ? Colors.white : Colors.black
            ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        contentPadding: const EdgeInsets.all(10),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: isDarkTheme ?Colors.white : Colors.black,
            ),
            borderRadius: BorderRadius.circular(12)),
            errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color:  isDarkTheme ?Colors.white : Colors.black,
            ),
            borderRadius: BorderRadius.circular(12)
            ),
      ),
    );
  }
}
