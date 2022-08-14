import 'package:sample_app/modules/authentication/modules/password_reset/modules/choose_new_password/state/choose_new_password_state_notifier.dart';
import 'package:riverpod/riverpod.dart';

/// A collection of providers for the [LoginPage]
class ChooseNewPasswordProviders {
  /// [Returns] if the login button should be enabled
  static final setPasswordButtonEnabled = Provider.autoDispose<bool>((ref) {
    if (ref.watch(passwordProvider).isEmpty ||
        ref.watch(passwordRepeatProvider).isEmpty) {
      return false;
    }

    return ref.watch(chooseNewPasswordStateNotifierProvider).canLogin;
  });

  /// Holds state about the password [TextField]
  ///
  /// This is updated by the [PasswordTextField] when typing
  static final passwordProvider = StateProvider.autoDispose<String>((ref) {
    return '';
  });

  /// Holds state about the password confirm [TextField]
  ///
  /// This is updated by the [PasswordTextField] when typing
  static final passwordRepeatProvider =
      StateProvider.autoDispose<String>((ref) {
    return '';
  });
}
