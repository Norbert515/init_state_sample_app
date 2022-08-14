import 'package:riverpod/riverpod.dart';

import 'login_state_notifier.dart';

/// A collection of providers for the [LoginPage]
class LoginProviders {
  /// [Returns] if the login button should be enabled
  static final loginButtonEnabled = StateProvider.autoDispose<bool>((ref) {
    if (ref.watch(emailProvider).isEmpty ||
        ref.watch(passwordProvider).isEmpty) {
      return false;
    }

    return ref.watch(loginStateNotifierProvider).canLogin;
  });

  /// Holds state about the email [TextField]
  ///
  /// This is updated by the [EmailTextField] when typing
  static final emailProvider = StateProvider.autoDispose<String>((ref) {
    return '';
  });

  /// Holds state about the password [TextField]
  ///
  /// This is updated by the [PasswordTextField] when typing
  static final passwordProvider = StateProvider.autoDispose<String>((ref) {
    return '';
  });
}
