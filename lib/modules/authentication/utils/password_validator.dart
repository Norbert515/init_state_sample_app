import 'package:sample_app/utils/localized_string.dart';

class PasswordCheckResult {
  PasswordCheckResult(
      {required this.conformsToRequirements, this.errorMessage});

  final bool conformsToRequirements;
  final LocalizedString? errorMessage;
}

/// Utility class to check whether a password fulfils the minimum requirements.
///
/// This is used when creating a new password (in sign up or password reset)
class PasswordValidator {
  /// The minimum length of a valid password
  static const passwordMinLength = 8;

  static bool validLength(String password) {
    return password.length >= 8;
  }

  static bool hasUppercase(String password) {
    return password.contains(RegExp(r'[A-Z]'));
  }

  static bool hasDigits(String password) {
    return password.contains(RegExp(r'[0-9]'));
  }

  static bool hasLowercase(String password) {
    return password.contains(RegExp(r'[a-z]'));
  }

  static bool hasSpecialCharacters(String password) {
    return password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }

  static PasswordCheckResult checkPassword(String password) {
    if (!validLength(password)) {
      return PasswordCheckResult(
        conformsToRequirements: false,
        errorMessage: (localizations) => localizations.atLeastXCharacter(8),
      );
    }

    if (!hasUppercase(password)) {
      return PasswordCheckResult(
        conformsToRequirements: false,
        errorMessage: (localizations) => localizations.needsAnUppercaseLetter,
      );
    }

    if (!hasDigits(password)) {
      return PasswordCheckResult(
        conformsToRequirements: false,
        errorMessage: (localizations) => localizations.needsADigit,
      );
    }

    if (!hasLowercase(password)) {
      return PasswordCheckResult(
        conformsToRequirements: false,
        errorMessage: (localizations) => localizations.needsALowercaseCharacter,
      );
    }

    if (!hasSpecialCharacters(password)) {
      return PasswordCheckResult(
        conformsToRequirements: false,
        errorMessage: (localizations) => localizations.needsASpecialCharacter,
      );
    }

    return PasswordCheckResult(conformsToRequirements: true);
  }
}
