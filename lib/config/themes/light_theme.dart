import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/utils/app_fonts.dart';
import '../../core/utils/colors.dart';

ThemeData lightTheme = ThemeData(
  textTheme: TextTheme(
    titleLarge: TextStyle(
      fontSize: AppFontSize.s28,
      color: Colors.black,
      fontWeight: FontWeightManager.bold,
    ),
    headlineSmall: TextStyle(
      fontSize: AppFontSize.s34,
      color: Colors.black,
      fontWeight: FontWeightManager.bold,
    ),
    displaySmall: TextStyle(
      fontSize: AppFontSize.s38,
      color: Colors.black,
      fontWeight: FontWeightManager.bold,
    ),
    bodyLarge: TextStyle(
      fontSize: AppFontSize.s22,
      color: Colors.black,
      fontWeight: FontWeightManager.semiBold,
    ),
    bodyMedium: TextStyle(
      fontSize: AppFontSize.s20,
      color: Colors.black,
      fontWeight: FontWeightManager.semiBold,
    ),
    titleMedium: TextStyle(
      fontSize: AppFontSize.s18,
      color: Colors.black,
      fontWeight: FontWeightManager.regular,
    ),
    titleSmall: TextStyle(
      fontSize: AppFontSize.s14,
      color: Colors.black,
      fontWeight: FontWeightManager.regular,
    ),
  ),
  appBarTheme: AppBarTheme(
    elevation: 0.0,
    backgroundColor: Colors.transparent,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
      size: AppFontSize.s34,
    ),
    actionsIconTheme: const IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: AppFontSize.s28,
      fontWeight: FontWeightManager.bold,
    ),
    titleSpacing: 20.0,
    centerTitle: true,
  ),
  scaffoldBackgroundColor: AppColors.backgroundColor,
);
