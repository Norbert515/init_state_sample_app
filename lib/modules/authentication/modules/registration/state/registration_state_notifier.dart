import 'package:firebase_auth/firebase_auth.dart';
import 'package:sample_app/modules/authentication/state/firebase_auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:sample_app/utils/localized_string.dart';

part 'registration_state_notifier.freezed.dart';

/// [RegistrationStateNotifier] is intended to be only used by the [RegistrationPage].
///
/// AutoDispose takes care of destroying the object after the user leaves the screen
/// so everything is reset when re-entering.
final registrationStateNotifierProvider = StateNotifierProvider.autoDispose<
    RegistrationStateNotifier, RegistrationState>((ref) {
  return RegistrationStateNotifier(ref.read(firebaseAuthProvider));
});

@freezed
class RegistrationState with _$RegistrationState {
  const RegistrationState._();

  const factory RegistrationState.unauthenticated() =
      RegistrationUnauthenticated;

  const factory RegistrationState.error({
    LocalizedString? emailError,
    LocalizedString? passwordError,
  }) = RegistrationError;

  const factory RegistrationState.loading() = RegistrationLoading;

  /// Success has no value as the state is handled by the underlying Firebase app
  const factory RegistrationState.success() = RegistrationSuccess;

  /// [Returns] if login is currently possible
  ///
  /// More specifically, login is possible if not already successfully logged in
  /// or currently loading.
  bool get canRegister {
    return map(
      unauthenticated: (_) => true,
      error: (_) => true,
      success: (_) => false,
      loading: (_) => false,
    );
  }
}

/// State notifier for the login
class RegistrationStateNotifier extends StateNotifier<RegistrationState> {
  RegistrationStateNotifier(this._auth)
      : super(RegistrationState.unauthenticated());

  final FirebaseAuth _auth;

  void registerWithEmailAndPassword(String email, String password, String passwordConfirm) async {
    // This can not be called while a request is loading (button is disabled)
    // and when successfully logged in (page is gone).
    assert(state is RegistrationUnauthenticated || state is RegistrationError);

    if(password != passwordConfirm) {
      state = RegistrationState.error(
        passwordError: (localizations) => localizations.passwordsDontMatch,
      );
      return;
    }

    try {
      state = RegistrationState.loading();
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      state = RegistrationState.success();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        state = RegistrationState.error(
          emailError: (localizations) => localizations.invalidEmail,
        );
      } else if (e.code == 'email-already-in-use') {
        state = RegistrationState.error(
          emailError: (localizations) => localizations.emailAlreadyInUse,
        );
      } else if (e.code == 'operation-not-allowed') {
        state = RegistrationState.error(
          emailError: (localizations) => localizations.emailSignInNotSupported,
        );
      } else if (e.code == 'weak-password') {
        state = RegistrationState.error(
          passwordError: (localizations) => localizations.passwordWeak,
        );
      } else if(e.code == 'network-request-failed') {
        state = RegistrationState.error(
          emailError: (localizations) => localizations.networkError,
        );
      } else {
        state = RegistrationState.error(
          emailError: (_) => e.message?? '',
        );
        rethrow;
      }
    }
  }
}
