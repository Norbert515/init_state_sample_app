import 'package:sample_app/modules/authentication/modules/registration/state/registration_state_notifier.dart';
import 'package:sample_app/modules/authentication/utils/password_validator.dart';
import 'package:riverpod/riverpod.dart';

/// A collection of providers for the registration process
///
/// This is only used as a namespace
class RegistrationProviders {
  /// Provides whether the register button should be enabled or not
  ///
  /// This is based on the current state of the form
  static final buttonEnabledProvider = Provider.autoDispose<bool>((ref) {
    var email = ref.watch(emailStateProvider);
    var password = ref.watch(passwordStateProvider);
    var passwordConfirm = ref.watch(passwordConfirmStateProvider);

    if (email.isEmpty || password.isEmpty || passwordConfirm.isEmpty) {
      return false;
    }

    if (!PasswordValidator.checkPassword(password).conformsToRequirements) {
      return false;
    }

    return ref.watch(registrationStateNotifierProvider).canRegister;
  });

  /// The [StateProvider] to set the email state
  ///
  /// This is supposed to be only used by the [RegistrationPage]
  static final emailStateProvider = StateProvider.autoDispose<String>((ref) {
    return '';
  });

  /// The [StateProvider] to set the password state
  ///
  /// This is supposed to be only used by the [RegistrationPage]
  static final passwordStateProvider = StateProvider.autoDispose<String>((ref) {
    return '';
  });

  /// The [StateProvider] to set the password confirm state
  ///
  /// This is supposed to be only used by the [RegistrationPage]
  static final passwordConfirmStateProvider =
      StateProvider.autoDispose<String>((ref) {
    return '';
  });
}
