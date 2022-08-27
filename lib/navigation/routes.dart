/// A class to handle all Routes within the App
///
/// This ensures that route-naming changes can be done smoothly without
/// touching too many files at once.

class Routes {
  Routes._();

  static const initial = '/';

  // Auth
  static const login = '/login';
  static String loginAndRedirect(redirection) => '$login?redirect=$redirection';
  static const register = '/register';
  static String registerAndRedirect(redirection) =>
      '$register?redirect=$redirection';
  static const passwordReset = '/password_reset';
  static const chooseNewPassword = '/choose_new_password';

  // Home
  static const home = '/home';
}
