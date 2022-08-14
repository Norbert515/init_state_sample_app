import 'package:sample_app/modules/authentication/modules/password_reset/modules/choose_new_password/state/choose_new_password_providers.dart';
import 'package:sample_app/modules/authentication/modules/password_reset/modules/choose_new_password/state/choose_new_password_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../choose_new_password_page_test.dart';

void main() {
  late ProviderContainer providerContainer;
  late MockChooseNewPasswordStateNotifier mockChooseNewPasswordStateNotifier;
  setUp(() {
    mockChooseNewPasswordStateNotifier = MockChooseNewPasswordStateNotifier();
    providerContainer = ProviderContainer(
      overrides: [
        chooseNewPasswordStateNotifierProvider
            .overrideWithValue(mockChooseNewPasswordStateNotifier),
      ],
    );
  });

  test('setPasswordButtonEnabled is false by default', () async {
    expect(
        providerContainer
            .read(ChooseNewPasswordProviders.setPasswordButtonEnabled),
        false);
  });

  test(
      'setPasswordButtonEnabled is true if fields are not empty and state allows login',
      () async {
    mockChooseNewPasswordStateNotifier.debugState =
        ChooseNewPasswordState.initial();
    providerContainer.read(ChooseNewPasswordProviders.passwordProvider.state).state =
        'p';
    providerContainer
        .read(ChooseNewPasswordProviders.passwordRepeatProvider.state)
        .state = 'p';
  });
}
