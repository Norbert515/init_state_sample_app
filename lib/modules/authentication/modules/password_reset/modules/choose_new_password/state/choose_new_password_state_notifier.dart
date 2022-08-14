import 'package:firebase_auth/firebase_auth.dart';
import 'package:sample_app/modules/authentication/state/firebase_auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:sample_app/utils/localized_string.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'choose_new_password_state_notifier.freezed.dart';

/// This is intended to be used by [ChooseNewPasswordPage] only
final chooseNewPasswordStateNotifierProvider = StateNotifierProvider<
    ChooseNewPasswordStateNotifier, ChooseNewPasswordState>((ref) {
  return ChooseNewPasswordStateNotifier(auth: ref.read(firebaseAuthProvider));
});

@freezed
class ChooseNewPasswordState with _$ChooseNewPasswordState {
  const ChooseNewPasswordState._();

  factory ChooseNewPasswordState.initial() = ChooseNewPasswordInitial;
  factory ChooseNewPasswordState.error({
    LocalizedString? error,
    LocalizedString? passwordError,

    /// Whether the user can do something about this error on this page.
    ///
    /// For example, if the new password is too weak the user can choose another one.
    ///
    /// On the other hand, if the reset link is broken, or the user is disabled.
    /// There is nothing the user can do but request a new password reset link
    @Default(false) bool canRecover,
  }) = ChooseNewPasswordError;

  factory ChooseNewPasswordState.done() = ChooseNewPasswordDone;
  factory ChooseNewPasswordState.loading() = ChooseNewPasswordLoading;

  /// A simple getter to passwordError
  ///
  /// If there is no password error, [returns] null.
  /// If there is a password error, return that String.
  ///
  /// [BuildContext] is used to retrieve the localization
  String? getPasswordError(AppLocalizations localizations) {
    return maybeWhen(
        orElse: () => null,
        error: (error, passwordError, canRecover) =>
            passwordError?.call(localizations));
  }

  /// [Returns] if setting the password is currently possible
  bool get canLogin {
    return map(
      error: (e) => e.canRecover,
      initial: (_) => true,
      loading: (_) => false,
      done: (_) => false,
    );
  }
}

class ChooseNewPasswordStateNotifier
    extends StateNotifier<ChooseNewPasswordState> {
  ChooseNewPasswordStateNotifier({
    required this.auth,
  }) : super(ChooseNewPasswordState.initial());

  final FirebaseAuth auth;

  /// Verifies the password reset code
  ///
  /// Sets the state to an error state if something is wrong
  void verify(String oobCode) async {
    try {
      await auth.verifyPasswordResetCode(oobCode);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'expired-action-code') {
        state = ChooseNewPasswordState.error(
          error: (localizations) => localizations.passwordResetLinkExpired,
        );
      } else if (e.code == 'invalid-action-code') {
        state = ChooseNewPasswordState.error(
          error: (localizations) => localizations.passwordResetLinkInvalid,
        );
      } else if (e.code == 'user-disabled') {
        state = ChooseNewPasswordState.error(
          error: (localizations) => localizations.userDisabled,
        );
      } else if (e.code == 'user-not-found') {
        state = ChooseNewPasswordState.error(
          error: (localizations) => localizations.userNotFound,
        );
      }
    }
  }

  /// Resets the password to [newPassword] given a correct oobCode
  ///
  /// The oobCode is obtained from the password reset email and is the token
  /// that verifies that operation
  void resetPassword({
    required String newPassword,
    required String repeatedPassword,
    required String oobCode,
  }) async {
    if (newPassword != repeatedPassword) {
      state = ChooseNewPasswordState.error(
        passwordError: (localizations) => localizations.passwordsDontMatch,
        canRecover: true,
      );
      return;
    }

    try {
      await auth.confirmPasswordReset(code: oobCode, newPassword: newPassword);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'expired-action-code') {
        state = ChooseNewPasswordState.error(
          error: (localizations) => localizations.passwordResetLinkExpired,
        );
      } else if (e.code == 'invalid-action-code') {
        state = ChooseNewPasswordState.error(
          error: (localizations) => localizations.passwordResetLinkInvalid,
        );
      } else if (e.code == 'user-disabled') {
        state = ChooseNewPasswordState.error(
          error: (localizations) => localizations.userDisabled,
        );
      } else if (e.code == 'user-not-found') {
        state = ChooseNewPasswordState.error(
          error: (localizations) => localizations.userNotFound,
        );
      } else if (e.code == 'weak-password') {
        state = ChooseNewPasswordState.error(
          passwordError: (localizations) => localizations.passwordWeak,
          canRecover: true,
        );
      }
    }
  }
}
