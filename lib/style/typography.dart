
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

/// Typography used in this app
///
/// One easy way of sanding out as an app design wise is to use a font that is
/// different to the default.
///
/// The Material Design type system was created with Roboto (the font family used
/// by material design) in mind. That type system works really great with Roboto,
/// but it might not work so well with a custom font.
///
/// That's the reason for a custom typography class, it essentially allows to do
/// exactly the same thing as the default one in Flutter but makes it customizable
/// (which the Flutter system does not provide).
///
/// For example, your app might not need two different styles.
///
///
/// ## About this type system
///
/// This system is based on a mathematical model, where the scaling
/// of the font is determined by multiplying the previous size with a constant number.
///
/// For more information about type scaling see: https://type-scale.com/
///
/// The base size used for body text is 16 and the constant
/// in this case is 1.2 (Minor Third).
///
/// Each [TextStyle] references the font family on it's own, as it's common
/// to pair fonts (usually 2 fonts, one for body the other for headlines).
///
/// In this case, only one font is used though.
///
///
/// In comparison the the Material Design System, this system only uses 3 headlines.
/// Less is sometimes more. If there is need for a wider variety, it's always
/// possible to expand the system.
class MyTypography {

  static TextStyle h1 = GoogleFonts.nunito(
    fontSize: 39.81,
  );

  static TextStyle h2 = GoogleFonts.nunito(
    fontSize: 33.18,
  );

  static TextStyle h3 = GoogleFonts.nunito(
    fontSize: 27.65,
    fontWeight: FontWeight.bold,
  );

  static TextStyle subhead = GoogleFonts.nunito(
    fontSize: 23.04,
  );

  static TextStyle body = GoogleFonts.nunito(
    fontSize: 16,
    // Paragraph need a line height in comparison to headlines
    // as it helps with readability a lot
    height: 1.5
  );

  static TextStyle button = GoogleFonts.nunito(
    fontSize: 14,
    fontWeight: FontWeight.bold
  );

}