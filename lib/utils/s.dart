import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// A short access to [AppLocalization]
///
/// This allows for less typing. In addition to that, auto-importing the
/// [AppLocalization] seems to be broken. This fixes that issue too.
class S {
  static AppLocalizations of(BuildContext context) => AppLocalizations.of(context);
}