import 'package:sample_app/modules/authentication/modules/login/state/login_providers.dart';
import 'package:sample_app/modules/authentication/modules/login/state/login_state_notifier.dart';
import 'package:sample_app/modules/authentication/widgets/adaptive_auth_screen.dart';
import 'package:sample_app/modules/authentication/widgets/email_text_field.dart';
import 'package:sample_app/modules/authentication/widgets/form_constraints.dart';
import 'package:sample_app/modules/authentication/widgets/password_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_app/navigation/routes.dart';
import 'package:sample_app/style/typography.dart';
import 'package:sample_app/utils/s.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key, required this.navigateAfterLoginPath})
      : super(key: key);

  /// The path that is used for navigation after the login is done.
  ///
  /// This should be the full path, for example: '/home/page/2'
  ///
  /// This distinction is done because the login will not always lead to /home.
  /// For example, when deep linking into content that needs authentication. After
  /// the authentication the user is expected to land on the desired content;
  final String navigateAfterLoginPath;

  /// Tries to login using the fields set on this page
  void login(WidgetRef ref) {
    ref.read(loginStateNotifierProvider.notifier).loginWithEmailAndPassword(
          email: ref.read(LoginProviders.emailProvider.state).state,
          password: ref.read(LoginProviders.passwordProvider.state).state,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      var loginState = ref.watch(loginStateNotifierProvider);

      var loginButtonEnabled =
          ref.watch(LoginProviders.loginButtonEnabled.state).state;
      ref.listen<LoginState>(loginStateNotifierProvider, (previous, state) {
        if (state is LoginSuccess) {
          context.go(navigateAfterLoginPath);
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).loginMessage,
                          style: MyTypography.h3,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        EmailTextField(
                          onChanged: (value) {
                            ref.read(LoginProviders.emailProvider.state).state =
                                value;
                          },
                          errorMessage: loginState.maybeMap(
                            error: (e) => e.emailError?.call(S.of(context)),
                            orElse: () => null,
                          ),
                        ),
                        PasswordTextField(
                          onChanged: (value) {
                            ref
                                .read(LoginProviders.passwordProvider.state)
                                .state = value;
                          },
                          errorMessage: loginState.maybeMap(
                            error: (e) => e.passwordError?.call(S.of(context)),
                            orElse: () => null,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              child: Text(
                                S.of(context).forgotPassword,
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              onTap: () {
                                context.push(Routes.passwordReset);
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Consumer(
                          builder: (context, ref, child) {
                            return SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: loginButtonEnabled
                                      ? () {
                                          login(ref);
                                        }
                                      : null,
                                  child: Text(S.of(context).login)),
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
                              text: S.of(context).registerInstead1,
                            ),
                            TextSpan(
                              text: S.of(context).registerInstead2,
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                              mouseCursor: SystemMouseCursors.click,
                            ),
                          ]),
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {
                      context.go(
                          Routes.registerAndRedirect(navigateAfterLoginPath));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
