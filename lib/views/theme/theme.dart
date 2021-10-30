import 'package:flutter/material.dart';
import '../../utils/ui_helper.dart';
import '../../constants/app_colors.dart';

class AppThemes {
  static ThemeData lightGronikTheme = ThemeData(
    primarySwatch: AppUiHelper.generateMaterialColor(AppColors.PRIMARY_COLOR),
    primaryColor: AppColors.PRIMARY_COLOR,
    fontFamily: 'Inter',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: AppColors.BACKGROUND_COLOR,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.PRIMARY_COLOR,
      secondary: AppColors.PRIMARY_COLOR,
      brightness: Brightness.light,
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          color: AppColors.NEUTRAL_50,
        ),
      ),
      alignLabelWithHint: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: AppColors.BACKGROUND_COLOR,
      filled: true,
      labelStyle: TextStyle(
        color: AppColors.NEUTRAL_50,
      ),
    ),
  );
}
