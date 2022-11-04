import 'package:flutter/material.dart';
import 'package:promina_task/core/presentation/resources/color_manager.dart';
import 'package:promina_task/core/presentation/resources/font_manager.dart';
import 'package:promina_task/core/presentation/resources/styles_manager.dart';
import 'package:promina_task/core/presentation/resources/values_manager.dart';

//Light theme
ThemeData getLightTheme() => ThemeData(
      colorSchemeSeed: ColorManager.primary,
      //AppBar
      appBarTheme: AppBarTheme(
        color: ColorManager.primary,
        elevation: Sizes.s4,
        titleTextStyle: getRegularTextStyle(
          fontSize: FontSizeManager.s16,
          color: ColorManager.white,
        ),
      ),
      //ElevatedButton
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: getRegularTextStyle(
            color: ColorManager.white,
            fontSize: FontSizeManager.s18,
          ),
          primary: ColorManager.blue,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(Sizes.s12)),
          ),
        ),
      ),
      //Text
      textTheme: TextTheme(
        displayLarge: getBoldTextStyle(
          color: ColorManager.black,
          fontSize: FontSizeManager.s50,
        ),
        headlineLarge: getBoldTextStyle(
          color: ColorManager.black,
          fontSize: FontSizeManager.s30,
        ),
        titleLarge: getLightTextStyle(
          color: ColorManager.white,
          fontSize: FontSizeManager.s22,
        ),
        titleMedium: getBoldTextStyle(
          color: ColorManager.white,
          fontSize: FontSizeManager.s18,
        ),
        bodyLarge: getRegularTextStyle(
          color: ColorManager.black,
          fontSize: FontSizeManager.s32,
        ),
        bodyMedium: getMediumTextStyle(
          color: ColorManager.black,
          fontSize: FontSizeManager.s16,
        ),
      ),
    );

//Dark theme
ThemeData getDarkTheme() => ThemeData(
      colorSchemeSeed: ColorManager.primary,
      //AppBar
      appBarTheme: AppBarTheme(
        color: ColorManager.primary,
        elevation: Sizes.s4,
        titleTextStyle: getRegularTextStyle(
          fontSize: FontSizeManager.s16,
          color: ColorManager.white,
        ),
      ),
      //ElevatedButton
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: getRegularTextStyle(
            color: ColorManager.white,
            fontSize: FontSizeManager.s18,
          ),
          primary: ColorManager.primary,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(Sizes.s12)),
          ),
        ),
      ),
      //Text
      textTheme: TextTheme(
        titleLarge: getLightTextStyle(
          color: ColorManager.white,
          fontSize: FontSizeManager.s22,
        ),
        bodyLarge: getSemiBoldTextStyle(
          color: ColorManager.darkGrey,
          fontSize: FontSizeManager.s16,
        ),
        bodyMedium: getMediumTextStyle(
          color: ColorManager.lightGrey,
          fontSize: FontSizeManager.s14,
        ),
      ),
    );
