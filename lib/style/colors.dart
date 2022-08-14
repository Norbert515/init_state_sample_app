import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:riverpod/riverpod.dart';

final myColorProvider = Provider<MyColors>((ref) {
  return MyColorLight();
});

/// A collection of colors used by the app.
///
/// These colors are:
/// https://coolors.co/006466-065a60-0b525b-144552-1b3a4b-212f45-272640-312244-3e1f47-4d194d
abstract class MyColors {

  Color get disabled;

  Color get buttonBackgroundColor;

  Color get buttonHoverColor =>
      Color.alphaBlend(overlayColor.withOpacity(0.08), buttonBackgroundColor);

  /// The color used as an overlay to highlight the main color
  Color get overlayColor;

  Color get primaryColor;

  Color get textColor;

  Color get textSelectionColor;
}

class MyColorLight extends MyColors {

  static const Color skobeloffLight = Color(0xff99c1c2);

  static const Color skobeloff = Color(0xff006466);
  static const Color skobeloff2 = Color(0xff065a60);
  static const Color skobeloff3 = Color(0xff0b525b);
  static const Color skobeloff4 = Color(0xff144552);
  static const Color skobeloff5 = Color(0xff1b3a4b);
  static const Color skobeloff6 = Color(0xff212f45);
  static const Color skobeloff7 = Color(0xff272640);
  static const Color skobeloff8 = Color(0xff312244);
  static const Color skobeloff9 = Color(0xff3e1f47);
  static const Color skobeloff10 = Color(0xff4d194d);

  Color get disabled => Color(0xffbbbbbb);

  @override
  Color get buttonBackgroundColor => skobeloff;

  @override
  Color get overlayColor => Colors.white;

  @override
  Color get primaryColor => skobeloff;

  @override
  Color get textSelectionColor => skobeloffLight;

  @override
  Color get textColor => Colors.black;

}