import 'package:flutter/material.dart';
import 'package:sample_app/style/colors.dart';
import 'package:sample_app/style/typography.dart';

/// Builds [ThemeData] using [MyColors]
class TextThemeBuilder {
  static ThemeData build(MyColors myColors) {
    return ThemeData(
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: myColors.primaryColor,
        selectionColor: myColors.textSelectionColor,
        selectionHandleColor: myColors.textSelectionColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: myColors.disabled,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: myColors.primaryColor,
          ),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: myColors.primaryColor,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.hovered)) {
                return myColors.buttonHoverColor;
              }
              if (states.contains(MaterialState.disabled)) {
                return myColors.disabled;
              }

              return myColors.buttonBackgroundColor;
            }),
            minimumSize: MaterialStateProperty.all(Size(0, 42))),
      ),
      textTheme: TextTheme(
        bodyText1: MyTypography.body,
        bodyText2: MyTypography.body,
      ),
    );
  }
}
