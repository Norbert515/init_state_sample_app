import 'package:firebase_auth/firebase_auth.dart';
import 'package:sample_app/modules/authentication/state/firebase_auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/utils/localized_string.dart';
import 'package:sample_app/utils/s.dart';

part 'initiate_password_reset_state_notifier.freezed.dart';

/// Provider for [InitiatePasswordResetStateNotifier], this is intended to be used by the
/// [InitiatePasswordResetPage] only.
///
/// This auto-disposes so a new instance of the state notifier is created when the
/// user leaves the screen and comes back.
final initiatePasswordResetStateNotifierProvider =
    StateNotifierProvider.autoDispose<InitiatePasswordResetStateNotifier,
        InitiatePasswordResetState>((ref) {
  return InitiatePasswordResetStateNotifier(ref.read(firebaseAuthProvider));
});

@freezed
class InitiatePasswordResetState with _$InitiatePasswordResetState {
  const InitiatePasswordResetState._();
  const factory InitiatePasswordResetState.ready() = PasswordResetReady;
  const factory InitiatePasswordResetState.error({
    LocalizedString? emailError,
    LocalizedString? generalError,
  }) = PasswordResetError;
  const factory InitiatePasswordResetState.loading() = PasswordResetLoading;

  const factory InitiatePasswordResetState.sent({
    /// The email the password reset link was sent to
    required String toMail,
  }) = PasswordResetSent;

  /// [Returns] the error associated with the email
  ///
  /// For example if it is an invalid email.
  ///
  /// This returns null if there is no error
  String? getEmailError(BuildContext context) {
    return mapOrNull<String?>(error: (e) => e.emailError?.call(S.of(context)));
  }

  /// [Returns] a general error
  ///
  /// This returns null if there is no error
  String? getGeneralError(BuildContext context) {
    return mapOrNull<String?>(error: (e) => e.generalError?.call(S.of(context)));
  }

  bool get isLoading => maybeMap(orElse: () => false, loading: (_) => true);
}

/// StateNotifier that manages password reset state
class InitiatePasswordResetStateNotifier
    extends StateNotifier<InitiatePasswordResetState> {
  InitiatePasswordResetStateNotifier(this.auth)
      : super(InitiatePasswordResetState.ready());

  final FirebaseAuth auth;

  /// Sends a password reset email
  void sendPasswordResetLink(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      // Nothing went wrong, show the user that the email was sent
      state = InitiatePasswordResetState.sent(toMail: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        state = InitiatePasswordResetState.error(
          emailError: (localizations) => localizations.invalidEmail,
        );
      } else if (e.code == 'user-not-found') {
        state = InitiatePasswordResetState.error(
            generalError: (localizations) => localizations.userNotFound);
      } else if (e.code == 'missing-android-pkg-name') {
        // The rest of the errors can never occur as we are not using the ActionCodeSettings
        // The code is here if at some point that will change. Until then, rethrow
        // so other mechanisms (the console or error reporting) can take care of this.
        rethrow;
      } else if (e.code == 'missing-continue-uri') {
        rethrow;
      } else if (e.code == 'missing-ios-bundle-id') {
        rethrow;
      } else if (e.code == 'invalid-continue-uri') {
        rethrow;
      } else if (e.code == 'unauthorized-continue-uri') {
        rethrow;
      } else {
        state = InitiatePasswordResetState.error(
          emailError: (localizations) => e.message ?? '',
        );
      }
    }
  }
}
