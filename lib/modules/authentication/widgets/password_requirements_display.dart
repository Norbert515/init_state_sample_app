import 'package:sample_app/modules/authentication/utils/password_validator.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/utils/s.dart';

/// Displays the required attributes of a password
///
/// Also show which of the requirements are already met and which are not
class PasswordRequirementsDisplay extends StatelessWidget {
  const PasswordRequirementsDisplay({
    Key? key,
    required this.password,
  }) : super(key: key);

  /// The password to check the requirements against
  final String password;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _PasswordRequirement(
          text: S
              .of(context)
              .passwordIsXCharactersLong(PasswordValidator.passwordMinLength),
          isMet: PasswordValidator.validLength(password),
        ),
        _PasswordRequirement(
          text: S.of(context).passwordHasDigit,
          isMet: PasswordValidator.hasDigits(password),
        ),
        _PasswordRequirement(
          text: S.of(context).passwordHasLowercaseLetter,
          isMet: PasswordValidator.hasLowercase(password),
        ),
        _PasswordRequirement(
          text: S.of(context).passwordHasUppercaseLetter,
          isMet: PasswordValidator.hasUppercase(password),
        ),
        _PasswordRequirement(
          text: S.of(context).passwordHasSpecialCharacter,
          isMet: PasswordValidator.hasSpecialCharacters(password),
        ),
      ],
    );
  }
}

class _PasswordRequirement extends StatelessWidget {
  const _PasswordRequirement({
    Key? key,
    required this.text,
    required this.isMet,
  }) : super(key: key);

  final String text;
  final bool isMet;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Row(
        children: [
          isMet
              ? Icon(
                  Icons.check,
                  color: Colors.green,
                )
              : Icon(
                  Icons.clear,
                  color: Colors.red,
                ),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
