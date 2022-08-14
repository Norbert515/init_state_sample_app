import 'package:sample_app/modules/authentication/modules/registration/state/registration_providers.dart';
import 'package:sample_app/modules/authentication/modules/registration/state/registration_state_notifier.dart';
import 'package:sample_app/modules/authentication/widgets/adaptive_auth_screen.dart';
import 'package:sample_app/modules/authentication/widgets/email_text_field.dart';
import 'package:sample_app/modules/authentication/widgets/form_constraints.dart';
import 'package:sample_app/modules/authentication/widgets/password_requirements_display.dart';
import 'package:sample_app/modules/authentication/widgets/password_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_app/style/typography.dart';
import 'package:sample_app/utils/s.dart';

/// The page for the registration process
class RegistrationPage extends StatelessWidget {
  const RegistrationPage(
      {Key? key, required this.navigateAfterRegistrationPath})
      : super(key: key);

  /// The page to go to after the registration was successful.
  ///
  /// For additional information see [LoginPage.navigateAfterLogin]
  final String navigateAfterRegistrationPath;

  /// Register based on the forms filled out
  void register(WidgetRef ref) {
    var registerStateNotifier =
        ref.watch(registrationStateNotifierProvider.notifier);
    registerStateNotifier.registerWithEmailAndPassword(
      ref.read(RegistrationProviders.emailStateProvider.state).state,
      ref.read(RegistrationProviders.passwordStateProvider.state).state,
      ref.read(RegistrationProviders.passwordConfirmStateProvider.state).state,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        var registerState = ref.watch(registrationStateNotifierProvider);

        ref.listen<RegistrationState>(registrationStateNotifierProvider,
            (previous, state) {
          if (state is RegistrationSuccess) {
            context.go(navigateAfterRegistrationPath);
          }
        });

        return AdaptiveAuthScreen(
          optionalChild: SvgPicture.asset(
            'assets/backgrounds/login_bg.svg',
            fit: BoxFit.cover,
          ),
          child: Scaffold(
            body: FormConstraints(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            S.of(context).registerMessage,
                            style: MyTypography.subhead,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          EmailTextField(
                            onChanged: (value) {
                              ref
                                  .read(
                                      RegistrationProviders.emailStateProvider.state)
                                  .state = value;
                            },
                            errorMessage: registerState.maybeMap(
                              error: (e) => e.emailError?.call(S.of(context)),
                              orElse: () => null,
                            ),
                          ),
                          PasswordTextField(
                            onChanged: (value) {
                              ref
                                  .read(RegistrationProviders
                                      .passwordStateProvider.state)
                                  .state = value;
                            },
                            errorMessage: registerState.maybeMap(
                              error: (e) => e.passwordError?.call(S.of(context)),
                              orElse: () => null,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Consumer(
                            builder: (context, ref, child) {
                              return PasswordRequirementsDisplay(
                                password: ref
                                    .watch(RegistrationProviders
                                        .passwordStateProvider.state)
                                    .state,
                              );
                            },
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          PasswordTextField.repeat(
                            onChanged: (value) {
                              ref
                                  .read(RegistrationProviders
                                      .passwordConfirmStateProvider.state)
                                  .state = value;
                            },
                          ),
                          const SizedBox(height: 24),
                          Consumer(
                            builder: (context, ref, child) {
                              return SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                    onPressed: ref.watch(RegistrationProviders
                                            .buttonEnabledProvider)
                                        ? () => register(ref)
                                        : null,
                                    child: Text(S.of(context).register)),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      child: RichText(
                        text: TextSpan(
                            style: Theme.of(context).textTheme.bodyText1,
                            children: [
                              TextSpan(
                                text: S.of(context).loginInstead1,
                              ),
                              TextSpan(
                                text: S.of(context).loginInstead2,
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                                mouseCursor: SystemMouseCursors.click,
                              ),
                              TextSpan(
                                text: S.of(context).loginInstead3,
                              ),
                            ]),
                        textAlign: TextAlign.center,
                      ),
                      onTap: () {
                        context
                            .go('/login?redirect=${navigateAfterRegistrationPath}');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
