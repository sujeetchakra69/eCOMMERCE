
import 'package:flutter/material.dart';
import 'package:t_store/utility/theme/customtheme/Texttheme.dart';
import 'package:t_store/utility/theme/customtheme/appBar_theme.dart';
import 'package:t_store/utility/theme/customtheme/bottomsheet_theme.dart';
import 'package:t_store/utility/theme/customtheme/checkbox_theme.dart';
import 'package:t_store/utility/theme/customtheme/chip_theme.dart';
import 'package:t_store/utility/theme/customtheme/elevatedButton_theme.dart';
import 'package:t_store/utility/theme/customtheme/text_field_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TtextTheme.lighttextTheme,
    elevatedButtonTheme: TelevatedbuttonTheme.lightelevatedbuttonTheme,
    chipTheme: TchipTheme.lightchipTheme,
    checkboxTheme: TcheckboxTheme.lightcheckboxTheme,
    inputDecorationTheme: TTextFieldTheme.lightinputDecorationTheme,
    bottomSheetTheme: TbottomsheetTheme.lightbottomsheetTheme,
    appBarTheme: TappBarTheme.lightAppBarTheme,
  );
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
      textTheme: TtextTheme.darktextTheme,
      elevatedButtonTheme: TelevatedbuttonTheme.darkelevatedbuttonTheme,
    chipTheme: TchipTheme.darkchipTheme,
    checkboxTheme: TcheckboxTheme.darkcheckboxTheme,
    inputDecorationTheme: TTextFieldTheme.darkinputDecorationTheme,
    bottomSheetTheme: TbottomsheetTheme.darkbottomsheetTheme,
    appBarTheme: TappBarTheme.darkAppBarTheme,);
}
