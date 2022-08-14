import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_app/modules/error/error_page.dart';
import 'package:sample_app/modules/home/home_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sample_app/style/colors.dart';
import 'package:sample_app/style/text_theme_builder.dart';
import 'package:sample_app/utils/adaptive_navigation_transition.dart';
import 'package:sample_app/utils/navigation_refresh.dart';
import 'package:sample_app/modules/authentication/modules/login/login_page.dart';
import 'package:sample_app/modules/authentication/modules/password_reset/modules/choose_new_password/choose_new_password_page.dart';
import 'package:sample_app/modules/authentication/modules/password_reset/modules/initiate_password_reset/initiate_password_reset_page.dart';
import 'package:sample_app/modules/authentication/modules/registration/registration_page.dart';
import 'modules/authentication/state/authentication_state_notifier.dart';
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: _MyAppContent(),
    );
  }
}

/// Distinction between [MyApp] and [_MyAppContent] is made
/// so it is easy to access Riverpod related things
class _MyAppContent extends ConsumerStatefulWidget {
  const _MyAppContent({Key? key}) : super(key: key);

  @override
  ConsumerState<_MyAppContent> createState() => _MyAppContentState();
}

class _MyAppContentState extends ConsumerState<_MyAppContent> {

  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = GoRouter(
      urlPathStrategy: UrlPathStrategy.path,
      refreshListenable: ref.read(navigationChangeProvider),
      routes: [
 
        GoRoute(path: '/', redirect: (_) => '/home'),
        GoRoute(
          path: '/',
          redirect: (state) {
            var isAuthenticated = ref.read(isAuthenticatedProvider);
            final goingToLogin = state.location == '/login';

            if (!isAuthenticated && !goingToLogin) {
              var to = state.location;
              return '/login?redirect=$to';
            }

            if (isAuthenticated && goingToLogin) {
              return '/';
            }

            return null;
          },
          routes: [
            GoRoute(
              path: 'home',
              pageBuilder: (context, state) => AdaptivePage.page(
                key: state.pageKey,
                child: const HomePage(),
              ),
            )
          ],
        ),
        GoRoute(
            path: '/login',
            pageBuilder: (context, state) {
              var to = state.queryParams['redirect'] ?? '/home';
              return AdaptivePage.page(
                  key: state.pageKey,
                  child: LoginPage(
                    navigateAfterLoginPath: to,
                  ));
            }),
        GoRoute(
            path: '/register',
            pageBuilder: (context, state) {
              var to = state.queryParams['redirect'] ?? '/home';
              return AdaptivePage.page(
                  key: state.pageKey,
                  child: RegistrationPage(
                    navigateAfterRegistrationPath: to,
                  ));
            }),
        GoRoute(
            path: '/password_reset',
            pageBuilder: (context, state) => AdaptivePage.page(
                key: state.pageKey, child: const InitiatePasswordResetPage())),
        GoRoute(
            path: '/choose_new_password',
            pageBuilder: (context, state) => AdaptivePage.page(
                key: state.pageKey,
                child: ChooseNewPasswordPage(
                  oobCode: state.queryParams['oobCode'],
                ))),
      ],
      errorPageBuilder: (context, state) => AdaptivePage.page(
        key: state.pageKey,
        child: ErrorPage.locationNotFound(location: state.location),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      // Rebuilds this portion and triggers a redirect refresh in GoRouter
      // when the user changes.
      ref.watch(isAuthenticatedProvider);

      var myColors = ref.watch(myColorProvider);

      return MaterialApp.router(
        title: 'sample_app',
        routeInformationParser: _router.routeInformationParser,
        routeInformationProvider: _router.routeInformationProvider,
        routerDelegate: _router.routerDelegate,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: TextThemeBuilder.build(myColors),
      );
    });
  }
}
