import 'package:sample_app/modules/authentication/modules/login/login_page.dart';
import 'package:sample_app/modules/authentication/modules/login/state/login_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/common.dart';
import '../../../../utils/mock.dart';

class MockLoginStateNotifier extends MockStateNotifier<LoginState>
    implements LoginStateNotifier {
  MockLoginStateNotifier() : super(LoginState.unauthenticated());
}

void main() {
  late MockLoginStateNotifier mockLoginStateNotifier;

  setUp(() {
    mockLoginStateNotifier = MockLoginStateNotifier();
  });

  tearDown(() {});

  testWidgets('Errors are displayed', (WidgetTester tester) async {
    // Fix overflows with Ahem font
    tester.binding.window.textScaleFactorTestValue = 0.5;

    mockLoginStateNotifier.debugState = LoginState.error(
      passwordError: (_) => 'passwordError',
      emailError: (_) => 'emailError',
    );
    await tester.setupBasicApp(
      child: LoginPage(
        navigateAfterLoginPath: '/',
      ),
      overrides: [
        loginStateNotifierProvider.overrideWithValue(mockLoginStateNotifier),
      ],
    );

    expect(find.text('passwordError'), findsOneWidget);
    expect(find.text('emailError'), findsOneWidget);
    tester.binding.window.clearTextScaleFactorTestValue();
  });

  testWidgets('Cannot press button when loading', (WidgetTester tester) async {
    // Fix overflows with Ahem font
    tester.binding.window.textScaleFactorTestValue = 0.5;

    mockLoginStateNotifier.debugState = LoginState.loading();

    await tester.setupBasicApp(
      child: LoginPage(
        navigateAfterLoginPath: '/',
      ),
      overrides: [
        loginStateNotifierProvider.overrideWithValue(mockLoginStateNotifier),
      ],
    );

    await tester.tap(find.byType(ElevatedButton));

    verifyNever(() => mockLoginStateNotifier.loginWithEmailAndPassword(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ));
    tester.binding.window.clearTextScaleFactorTestValue();
  });
}
