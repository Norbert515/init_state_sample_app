import 'package:firebase_auth/firebase_auth.dart';
import 'package:sample_app/modules/authentication/state/firebase_auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:sample_app/utils/localized_string.dart';

part 'login_state_notifier.freezed.dart';

/// Private [LoginStateNotifier] provider
///
/// [LoginStateNotifier] is intended to be only used by this page, therefore the provider
/// is private.
///
/// AutoDispose takes care of destroying the object after the user leaves the screen
/// so everything is reset when re-entering.
final loginStateNotifierProvider =
    StateNotifierProvider.autoDispose<LoginStateNotifier, LoginState>((ref) {
  return LoginStateNotifier(ref.read(firebaseAuthProvider));
});

/// The state of the login page
///
/// This state is only used on the login page and doesn't reflect general authentication
/// state of the app. For that take a look at [AuthenticationState]
@freezed
class LoginState with _$LoginState {
  const LoginState._();

  const factory LoginState.unauthenticated() = LoginUnauthenticated;
  const factory LoginState.error({
    LocalizedString? emailError,
    LocalizedString? passwordError,
  }) = LoginError;
  const factory LoginState.loading() = LoginLoading;

  /// Success has no value as the state is handled by the underlying Firebase app
  const factory LoginState.success() = LoginSuccess;

  /// [Returns] if login is currently possible
  ///
  /// More specifically, login is possible if not already successfully logged in
  /// or currently loading.
  bool get canLogin {
    return map(
      unauthenticated: (_) => true,
      error: (_) => true,
      loading: (_) => false,
      success: (_) => false,
    );
  }
}

/// State notifier for the login
class LoginStateNotifier extends StateNotifier<LoginState> {
  LoginStateNotifier(this.auth) : super(LoginState.unauthenticated());

  final FirebaseAuth auth;

  void loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    // This can not be called while a request is loading (button is disabled)
    // and when successfully logged in (page is gone).
    assert(state is LoginUnauthenticated || state is LoginError);

    try {
      state = LoginState.loading();
      await auth.signInWithEmailAndPassword(email: email, password: password);
      state = LoginState.success();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        state = LoginState.error(
          emailError: (localizations) => localizations.invalidEmail,
        );
      } else if (e.code == 'user-disabled') {
        state = LoginState.error(
          emailError: (localizations) => localizations.userDisabled,
        );
      } else if (e.code == 'user-not-found') {
        state = LoginState.error(
          emailError: (localizations) => localizations.userNotFound,
        );
      } else if (e.code == 'wrong-password') {
        state = LoginState.error(
          passwordError: (localizations) => localizations.passwordWrong,
        );
      }  else if(e.code == 'network-request-failed') {
        state = LoginState.error(
          emailError: (localizations) => localizations.networkError,
        );
      } else {
        state = LoginState.error(
          emailError: (_) => e.message?? '',
        );
        rethrow;
      }
    }
  }
}
