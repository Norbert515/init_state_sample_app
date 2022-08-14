import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// A function taking a [AppLocalizations] and returning a String
///
/// This is used in places where there is no access to the [AppLocalizations] but
/// texts need to be generated (error messages presentable to users for example).
///
/// This decouples providing the String from reading the String.
///
/// Example:
///
/// ```dart
/// state = MyErrorState(
///   error: (localizations) => localizations.myError,
/// );
/// ```
///
/// to read:
///
/// ```dart
/// Text(myState.error(S.of(context)),
/// ```
typedef LocalizedString = String Function(AppLocalizations localizations);