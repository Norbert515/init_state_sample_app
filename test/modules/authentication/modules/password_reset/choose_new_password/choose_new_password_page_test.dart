import 'package:sample_app/modules/authentication/modules/password_reset/modules/choose_new_password/choose_new_password_page.dart';
import 'package:sample_app/modules/authentication/modules/password_reset/modules/choose_new_password/state/choose_new_password_state_notifier.dart';
import 'package:sample_app/modules/authentication/widgets/password_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sample_app/utils/s.dart';

import '../../../../../utils/common.dart';
import '../../../../../utils/mock.dart';

class MockChooseNewPasswordStateNotifier
    extends MockStateNotifier<ChooseNewPasswordState>
    implements ChooseNewPasswordStateNotifier {
  MockChooseNewPasswordStateNotifier()
      : super(ChooseNewPasswordState.initial());
}

void main() {
  late MockChooseNewPasswordStateNotifier mockChooseNewPasswordStateNotifier;

  setUp(() {
    mockChooseNewPasswordStateNotifier = MockChooseNewPasswordStateNotifier();
  });

  testWidgets('Verify called at start', (WidgetTester tester) async {
    await tester.setupBasicApp(
      child: ChooseNewPasswordPage(
        oobCode: 'oobCode',
      ),
      overrides: [
        chooseNewPasswordStateNotifierProvider
            .overrideWithValue(mockChooseNewPasswordStateNotifier),
      ],
    );
    verify(() => mockChooseNewPasswordStateNotifier.verify('oobCode'))
        .called(1);
  });

  testWidgets('Error is shown', (WidgetTester tester) async {
    await tester.setupBasicApp(
      child: ChooseNewPasswordPage(
        oobCode: 'oobCode',
      ),
      overrides: [
        chooseNewPasswordStateNotifierProvider
            .overrideWithValue(mockChooseNewPasswordStateNotifier),
      ],
    );
    mockChooseNewPasswordStateNotifier.debugState =
        ChooseNewPasswordState.error(error: (_) => 'error');

    await tester.pump();
    expect(find.text('error'), findsOneWidget);
  });

  testWidgets('Button calls resetPassword', (WidgetTester tester) async {
    await tester.setupBasicApp(
      child: ChooseNewPasswordPage(
        oobCode: 'oobCode',
      ),
      overrides: [
        chooseNewPasswordStateNotifierProvider
            .overrideWithValue(mockChooseNewPasswordStateNotifier),
      ],
    );

    var password = 'MyCoolPassword123!';

    await tester.tap(
      find.widgetWithText(PasswordTextField, S.of(debugContext(tester)).passwordHint),
    );
    tester.testTextInput.enterText(password);
    await tester.pump();
    await tester.tap(
      find.widgetWithText(PasswordTextField, S.of(debugContext(tester)).passwordRepeatHint),
    );
    tester.testTextInput.enterText(password);
    await tester.pump();

    await tester.tap(find.byType(ElevatedButton));

    verify(() => mockChooseNewPasswordStateNotifier.resetPassword(
          newPassword: password,
          repeatedPassword: password,
          oobCode: 'oobCode',
        )).called(1);
  });

  testWidgets('Password error is shown', (WidgetTester tester) async {
    await tester.setupBasicApp(
      child: ChooseNewPasswordPage(
        oobCode: 'oobCode',
      ),
      overrides: [
        chooseNewPasswordStateNotifierProvider
            .overrideWithValue(mockChooseNewPasswordStateNotifier),
      ],
    );

    mockChooseNewPasswordStateNotifier.debugState = ChooseNewPasswordState.error(
      passwordError: (_) => 'error',
    );
    await tester.pump();

    expect(find.text('error'), findsOneWidget);
  });
}
