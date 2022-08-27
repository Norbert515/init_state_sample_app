import 'package:go_router/go_router.dart';
import 'package:sample_app/modules/authentication/modules/login/login_page.dart';
import 'package:sample_app/modules/authentication/modules/password_reset/modules/choose_new_password/choose_new_password_page.dart';
import 'package:sample_app/modules/authentication/modules/password_reset/modules/initiate_password_reset/initiate_password_reset_page.dart';
import 'package:sample_app/modules/authentication/modules/registration/registration_page.dart';
import 'package:sample_app/modules/error/error_page.dart';
import 'package:sample_app/modules/home/home_page.dart';
import 'package:sample_app/navigation/routes.dart';
import 'package:sample_app/utils/adaptive_navigation_transition.dart';
import 'package:sample_app/utils/navigation_refresh.dart';

/// A class to wrap the GoRouter-implementation used
///
/// This class holds the inivididual implementation of
/// GoRouter

class InitStateSampleAppRouter {
  InitStateSampleAppRouter({
    required this.navigationChangeNotifier,
  });

  final NavigationChangeNotifier navigationChangeNotifier;

  late final implementation = GoRouter(
    urlPathStrategy: UrlPathStrategy.path,
    debugLogDiagnostics: true,
    refreshListenable: navigationChangeNotifier,
    redirect: (state) {
      late final isAuthenticated = navigationChangeNotifier.isAuthenticated;
      final goingToLogin = state.location.startsWith(Routes.login);
      if (!isAuthenticated && !goingToLogin) {
        var to = state.location;
        return Routes.loginAndRedirect(to);
      }
      if (isAuthenticated && goingToLogin) {
        return Routes.initial;
      }
      return null;
    },
    navigatorBuilder: (context, state, child) {
      // Will be run every time a navigtion takes place
      // Perfect place for Debuggin, Analytics and more
      return child;
    },
    routes: [
      GoRoute(path: Routes.initial, redirect: (_) => Routes.home),
      GoRoute(
        path: Routes.home,
        pageBuilder: (context, state) => AdaptivePage.page(
          key: state.pageKey,
          child: const HomePage(),
        ),
      ),
      GoRoute(
          path: Routes.login,
          pageBuilder: (context, state) {
            var to = state.queryParams['redirect'] ?? Routes.home;
            return AdaptivePage.page(
                key: state.pageKey,
                child: LoginPage(
                  navigateAfterLoginPath: to,
                ));
          }),
      GoRoute(
          path: Routes.register,
          pageBuilder: (context, state) {
            var to = state.queryParams['redirect'] ?? Routes.home;
            return AdaptivePage.page(
                key: state.pageKey,
                child: RegistrationPage(
                  navigateAfterRegistrationPath: to,
                ));
          }),
      GoRoute(
          path: Routes.passwordReset,
          pageBuilder: (context, state) => AdaptivePage.page(
              key: state.pageKey, child: const InitiatePasswordResetPage())),
      GoRoute(
          path: Routes.chooseNewPassword,
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
