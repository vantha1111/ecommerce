
import 'package:computer_store/utils/theme/custom_theme/appbar.dart';
import 'package:computer_store/utils/theme/custom_theme/button_sheet_theme.dart';
import 'package:computer_store/utils/theme/custom_theme/checkbox_theme.dart';
import 'package:computer_store/utils/theme/custom_theme/chip_theme.dart';
import 'package:computer_store/utils/theme/custom_theme/elevated_button_theme.dart';
import 'package:computer_store/utils/theme/custom_theme/text_field_theme.dart';
import 'package:computer_store/utils/theme/custom_theme/text_theme.dart';
import 'package:flutter/material.dart';

class UAppTheme {
  UAppTheme._();

  static ThemeData lightApp = ThemeData(
    useMaterial3: true,
    fontFamily: 'poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: UTextTheme.lightTextTheme,
    chipTheme: UChipTheme.lightChipTheme,
    appBarTheme: UAppBarTheme.lightAppBarTheme,
    checkboxTheme: UCheckBoxtheme.lightcheckBoxTheme,
    bottomSheetTheme: UBottonSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: UElevatedButtonTheme.lightElevatedButtonTheme,
    // outlinedButtonTheme:  OutlineInputBorder.lightOutLineButtonTheme,
    inputDecorationTheme: UTextFieldTheme.lightInputDecorationTheme,

  );
  static ThemeData darkApp = ThemeData(
    useMaterial3: true,
    fontFamily: 'poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: UTextTheme.darkTextTheme,
    chipTheme: UChipTheme.darkChipTheme,
    appBarTheme: UAppBarTheme.darkAppBarTheme,
    checkboxTheme: UCheckBoxtheme.darkcheckBoxTheme,
    bottomSheetTheme: UBottonSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: UElevatedButtonTheme.darkElevatedButtonTheme,
    // outlinedButtonTheme:  OutlineInputBorder.darkOutLineButtonTheme,
    inputDecorationTheme: UTextFieldTheme.darkInputDecorationTheme,
  );

}