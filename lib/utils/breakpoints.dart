
import 'package:flutter/material.dart';

/// A set of breakpoints on the basis of tailwindcss
///
/// Always design a UI component for the smallest screen first, then bigger screens.
/// This is called mobile first design.
///
/// This is always based on the screen size and not some widget size.
class Breakpoints {

  static const double sm = 640;

  static const double md = 768;

  static const double lg = 1024;

  static const double xl = 1280;

  static const double xl2 = 1536;

  static double _width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// [Returns] if the screen size is _at least_ md
  static bool isMd(BuildContext context) {
    return _width(context) >= md;
  }

  /// [Returns] if the screen size is _at least_ lg
  static bool isLg(BuildContext context) {
    return _width(context) >= lg;
  }

  /// [Returns] if the screen size is _at least_ xl
  static bool isXl(BuildContext context) {
    return _width(context) >= xl;
  }

  /// [Returns] if the screen size is _at least_ 2xl
  static bool is2Xl(BuildContext context) {
    return _width(context) >= xl2;
  }


}