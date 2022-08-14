import 'package:sample_app/modules/authentication/modules/login/state/login_providers.dart';
import 'package:sample_app/modules/authentication/modules/login/state/login_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../login_page_test.dart';

void main() {
  late ProviderContainer providerContainer;
  late MockLoginStateNotifier mockLoginStateNotifier;

  setUp(() {
    mockLoginStateNotifier = MockLoginStateNotifier();
    providerContainer = ProviderContainer(overrides: [
      loginStateNotifierProvider.overrideWithValue(mockLoginStateNotifier),
    ]);
  });

  test('Login button not enabled by default', () async {
    expect(
        providerContainer.read(LoginProviders.loginButtonEnabled.state).state, false);
  });

  test('Login button enabled if criteria met', () async {
    providerContainer.read(LoginProviders.emailProvider.state).state =
        'mail@mail.com';
    providerContainer.read(LoginProviders.passwordProvider.state).state = 'Password';

    mockLoginStateNotifier.debugState = LoginState.unauthenticated();

    expect(
        providerContainer.read(LoginProviders.loginButtonEnabled), true);
  });
}
