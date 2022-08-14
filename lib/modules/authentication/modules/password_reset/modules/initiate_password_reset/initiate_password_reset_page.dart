import 'package:sample_app/modules/authentication/modules/password_reset/modules/initiate_password_reset/state/initiate_password_reset_state_notifier.dart';
import 'package:sample_app/modules/authentication/modules/password_reset/modules/initiate_password_reset/widgets/check_email_page.dart';
import 'package:sample_app/modules/authentication/widgets/adaptive_auth_screen.dart';
import 'package:sample_app/modules/authentication/widgets/email_text_field.dart';
import 'package:sample_app/modules/authentication/widgets/form_constraints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sample_app/utils/s.dart';

class InitiatePasswordResetPage extends ConsumerStatefulWidget {
  const InitiatePasswordResetPage({Key? key}) : super(key: key);

  @override
  ConsumerState<InitiatePasswordResetPage> createState() =>
      _InitiatePasswordResetPageState();
}

class _InitiatePasswordResetPageState
    extends ConsumerState<InitiatePasswordResetPage> {
  @override
  Widget build(BuildContext context) {
    return AdaptiveAuthScreen(
      optionalChild: SvgPicture.asset(
        'assets/backgrounds/login_bg.svg',
        fit: BoxFit.cover,
      ),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: _getContent(context),
        ),
      ),
    );
  }

  /// The content of the page
  ///
  /// Depending on whether the email was already sent or not, this returns different
  /// content to show.
  Widget _getContent(BuildContext context) {
    var passwordResetState =
        ref.watch(initiatePasswordResetStateNotifierProvider);
    return passwordResetState.maybeMap(
      orElse: () => _InitialPage(),
      sent: (sent) => CheckEmailPageContent(
        email: sent.toMail,
      ),
    );
  }
}

/// The initial page of the flow
///
/// Once the email was sent, there is no going back
class _InitialPage extends ConsumerStatefulWidget {
  const _InitialPage({Key? key}) : super(key: key);

  @override
  ConsumerState<_InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends ConsumerState<_InitialPage> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var passwordResetState =
        ref.watch(initiatePasswordResetStateNotifierProvider);
    return FormConstraints(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.of(context).resetPassword, style: Theme.of(context).textTheme.headline5,),
          const SizedBox(height: 128,),
          EmailTextField(
            controller: _emailController,
            errorMessage: passwordResetState.getEmailError(context),
          ),
          if (passwordResetState.getGeneralError(context) != null)
            Container(
              padding: const EdgeInsets.all(4),
              child: Text(passwordResetState.getGeneralError(context)!),
            ),
          const SizedBox(height: 8,),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              child: passwordResetState.isLoading
                  ? const CircularProgressIndicator()
                  : Text(S.of(context).sendPasswordResetEmail),
              onPressed: passwordResetState.isLoading
                  ? null
                  : () {
                      ref
                          .read(
                              initiatePasswordResetStateNotifierProvider.notifier)
                          .sendPasswordResetLink(_emailController.text);
                    },
            ),
          ),
        ],
      ),
    );
  }
}
