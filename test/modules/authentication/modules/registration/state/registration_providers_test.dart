import 'package:sample_app/modules/authentication/modules/registration/state/registration_providers.dart';
import 'package:sample_app/modules/authentication/modules/registration/state/registration_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../registration_page_test.dart';

void main() {
  late MockRegistrationStateNotifier mockRegistrationStateNotifier;
  late ProviderContainer providerContainer;

  setUp(() {
    mockRegistrationStateNotifier = MockRegistrationStateNotifier();
    providerContainer = ProviderContainer(overrides: [
      registrationStateNotifierProvider
          .overrideWithValue(mockRegistrationStateNotifier),
    ]);
  });

  test('Button disabled when any text fields empty', () async {
    expect(providerContainer.read(RegistrationProviders.buttonEnabledProvider),
        false);
  });

  test(
      'Button enabled when all text fields not empty and registration state notifier'
      ' in default state and password fulfils minimum requirements', () async {
    mockRegistrationStateNotifier.debugState =
        RegistrationState.unauthenticated();

    providerContainer
        .read(RegistrationProviders.emailStateProvider.state)
        .state = 'a';
    providerContainer
        .read(RegistrationProviders.passwordStateProvider.state)
        .state = 'Password1234!!';
    providerContainer
        .read(RegistrationProviders.passwordConfirmStateProvider.state)
        .state = 'a';

    expect(providerContainer.read(RegistrationProviders.buttonEnabledProvider),
        true);
  });

  test('Loading registration state blocks button', () async {
    mockRegistrationStateNotifier.debugState = RegistrationState.loading();

    providerContainer
        .read(RegistrationProviders.emailStateProvider.state)
        .state = 'a';
    providerContainer
        .read(RegistrationProviders.passwordStateProvider.state)
        .state = 'Password1234!!';
    providerContainer
        .read(RegistrationProviders.passwordConfirmStateProvider.state)
        .state = 'a';

    expect(providerContainer.read(RegistrationProviders.buttonEnabledProvider),
        false);
  });
}
