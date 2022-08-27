import 'package:flutter/material.dart';
import 'package:sample_app/navigation/routes.dart';
import 'package:sample_app/style/typography.dart';
import 'package:sample_app/modules/authentication/state/authentication_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// The main entry point to the application
///
/// Most apps have a home page which acts as a sort of hub to navigate between
/// different features inside the application.
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to your new app!',
                style: MyTypography.h1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Text(
                'To get started, please take a look at the README.md',
                style: MyTypography.body,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 64,
              ),
              Consumer(builder: (context, ref, child) {
                return ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).go(Routes.login);
                      ref
                          .read(authenticationStateNotifierProvider.notifier)
                          .logout();
                    },
                    child: Text('Logout'));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
