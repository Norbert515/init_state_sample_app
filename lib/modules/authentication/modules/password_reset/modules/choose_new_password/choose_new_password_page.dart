import 'package:flutter/widgets.dart';
import 'package:sample_app/modules/authentication/modules/password_reset/modules/choose_new_password/state/choose_new_password_providers.dart';
import 'package:sample_app/modules/authentication/modules/password_reset/modules/choose_new_password/state/choose_new_password_state_notifier.dart';
import 'package:sample_app/modules/authentication/widgets/form_constraints.dart';
import 'package:sample_app/modules/authentication/widgets/password_requirements_display.dart';
import 'package:sample_app/modules/authentication/widgets/password_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_app/style/typography.dart';
import 'package:sample_app/utils/s.dart';

class ChooseNewPasswordPage extends ConsumerStatefulWidget {
  const ChooseNewPasswordPage({
    Key? key,
    String? oobCode,
  })  : this.oobCode = oobCode ?? "",
        super(key: key);

  /// The one-time code provided by the password reset link
  ///
  /// This code is received by a deeplink from the e-mail the user received.
  ///
  /// For more information about this parameter, check out the Firebase documentation:
  /// https://firebase.google.com/docs/auth/custom-email-handler
  ///
  /// This is optional so error handling can be done on this screen if the
  /// deeplink is broken for some reason.
  final String oobCode;

  @override
  ConsumerState<ChooseNewPasswordPage> createState() =>
      _ChooseNewPasswordPageState();
}

class _ChooseNewPasswordPageState extends ConsumerState<ChooseNewPasswordPage> {
  @override
  void initState() {
    super.initState();
    // Validate at the start so an error message might show
    ref
        .read(chooseNewPasswordStateNotifierProvider.notifier)
        .verify(widget.oobCode);
  }

  /// Sets the new password based on the form fields
  void setPassword() {
    ref.read(chooseNewPasswordStateNotifierProvider.notifier).resetPassword(
          newPassword:
              ref.read(ChooseNewPasswordProviders.passwordProvider.state).state,
          repeatedPassword: ref
              .read(ChooseNewPasswordProviders.passwordRepeatProvider.state)
              .state,
          oobCode: widget.oobCode,
        );
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(chooseNewPasswordStateNotifierProvider);
    return Scaffold(
      body: FormConstraints(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(S.of(context).chooseANewPassword, style: MyTypography.h3),
                PasswordTextField(
                  onChanged: (value) {
                    ref
                        .read(ChooseNewPasswordProviders.passwordProvider.state)
                        .state = value;
                  },
                  errorMessage: state.getPasswordError(S.of(context)),
                ),
                const SizedBox(height: 8,),
                Consumer(
                  builder: (context, ref, child) {
                    return PasswordRequirementsDisplay(
                      password: ref
                          .watch(
                              ChooseNewPasswordProviders.passwordProvider.state)
                          .state,
                    );
                  },
                ),
                const SizedBox(height: 8,),
                PasswordTextField.repeat(
                  onChanged: (value) {
                    ref
                        .read(ChooseNewPasswordProviders
                            .passwordRepeatProvider.state)
                        .state = value;
                    print(value);
                  },
                ),
                if (state is ChooseNewPasswordError && state.error != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(state.error!.call(S.of(context)), style: MyTypography.button,),
                  ),
                const SizedBox(height: 8,),
                Consumer(
                  builder: (context, ref, child) {
                    return ElevatedButton(
                      child: Text(S.of(context).setPasswordButtonText),
                      onPressed: ref.watch(ChooseNewPasswordProviders
                              .setPasswordButtonEnabled)
                          ? () {
                              setPassword();
                            }
                          : null,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
