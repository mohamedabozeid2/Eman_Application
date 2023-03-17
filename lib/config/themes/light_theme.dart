import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/utils/app_fonts.dart';
import '../../core/utils/colors.dart';

ThemeData lightTheme = ThemeData(
  textTheme: TextTheme(
    headline6: TextStyle(
      fontSize: AppFontSize.s28,
      color: Colors.black,
      fontWeight: FontWeightManager.bold,
    ),
    headline5: TextStyle(
      fontSize: AppFontSize.s34,
      color: Colors.black,
      fontWeight: FontWeightManager.bold,
    ),
    headline3: TextStyle(
      fontSize: AppFontSize.s38,
      color: Colors.black,
      fontWeight: FontWeightManager.bold,
    ),
    bodyText1: TextStyle(
      fontSize: AppFontSize.s22,
      color: Colors.black,
      fontWeight: FontWeightManager.semiBold,
    ),
    bodyText2: TextStyle(
      fontSize: AppFontSize.s20,
      color: Colors.black,
      fontWeight: FontWeightManager.semiBold,
    ),
    subtitle1: TextStyle(
      fontSize: AppFontSize.s18,
      color: Colors.black,
      fontWeight: FontWeightManager.regular,
    ),
    subtitle2: TextStyle(
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
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    actionsIconTheme: const IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: AppFontSize.s20,
      fontWeight: FontWeightManager.bold,
    ),
    titleSpacing: 20.0,
    centerTitle: true,
  ),
  scaffoldBackgroundColor: AppColors.tealColor.withOpacity(0.8),
);
