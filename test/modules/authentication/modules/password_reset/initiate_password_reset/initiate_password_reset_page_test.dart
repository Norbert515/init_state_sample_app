import 'package:sample_app/modules/authentication/modules/password_reset/modules/initiate_password_reset/initiate_password_reset_page.dart';
import 'package:sample_app/modules/authentication/modules/password_reset/modules/initiate_password_reset/state/initiate_password_reset_state_notifier.dart';
import 'package:sample_app/modules/authentication/widgets/email_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../utils/common.dart';
import '../../../../../utils/mock.dart';

class MockInitiatePasswordResetStateNotifier extends MockStateNotifier<InitiatePasswordResetState>
    implements InitiatePasswordResetStateNotifier {
  MockInitiatePasswordResetStateNotifier() : super(InitiatePasswordResetState.ready());
}

void main() {

  late MockInitiatePasswordResetStateNotifier mockRegistrationStateNotifier;

  setUp(() {
    mockRegistrationStateNotifier = MockInitiatePasswordResetStateNotifier();
  });

  testWidgets('EmailTextField is shown by default', (WidgetTester tester) async {
    await tester.setupBasicApp(
      overrides: [
        initiatePasswordResetStateNotifierProvider.overrideWithValue(mockRegistrationStateNotifier)
      ],
      child: InitiatePasswordResetPage(),
    );

    expect(find.byType(EmailTextField), findsOneWidget);
  });

  testWidgets('Email error is shown', (WidgetTester tester) async {
    await tester.setupBasicApp(
      overrides: [
        initiatePasswordResetStateNotifierProvider.overrideWithValue(mockRegistrationStateNotifier)
      ],
      child: InitiatePasswordResetPage(),
    );
    mockRegistrationStateNotifier.debugState = InitiatePasswordResetState.error(emailError: (_) => 'error');
    await tester.pump();

    expect(find.text('error'), findsOneWidget);
  });

  testWidgets('General error is shown', (WidgetTester tester) async {
    await tester.setupBasicApp(
      overrides: [
        initiatePasswordResetStateNotifierProvider.overrideWithValue(mockRegistrationStateNotifier)
      ],
      child: InitiatePasswordResetPage(),
    );
    mockRegistrationStateNotifier.debugState = InitiatePasswordResetState.error(generalError: (_) => 'error');
    await tester.pump();

    expect(find.text('error'), findsOneWidget);
  });

  testWidgets('Tapping the button leads to sendPasswordResetLink being called', (WidgetTester tester) async {
    await tester.setupBasicApp(
      overrides: [
        initiatePasswordResetStateNotifierProvider.overrideWithValue(mockRegistrationStateNotifier)
      ],
      child: InitiatePasswordResetPage(),
    );

    await tester.enterText(find.byType(EmailTextField), 'mymail@mail.com');
    await tester.tap(find.byType(ElevatedButton));

    verify(() => mockRegistrationStateNotifier.sendPasswordResetLink('mymail@mail.com')).called(1);
  });

  testWidgets('Loading indicator is shown when loading, and tapping the button doesn\'t do anything', (WidgetTester tester) async {
    await tester.setupBasicApp(
      overrides: [
        initiatePasswordResetStateNotifierProvider.overrideWithValue(mockRegistrationStateNotifier)
      ],
      child: InitiatePasswordResetPage(),
    );
    mockRegistrationStateNotifier.debugState = InitiatePasswordResetState.loading();
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.tap(find.byType(ElevatedButton));

    verifyNever(() => mockRegistrationStateNotifier.sendPasswordResetLink(any()));
  });

  testWidgets('After email was sent, don\'t show a text input and button', (WidgetTester tester) async {
    await tester.setupBasicApp(
      overrides: [
        initiatePasswordResetStateNotifierProvider.overrideWithValue(mockRegistrationStateNotifier)
      ],
      child: InitiatePasswordResetPage(),
    );
    mockRegistrationStateNotifier.debugState = InitiatePasswordResetState.sent(toMail: 'mymail@mail.com');
    await tester.pump();

    expect(find.byType(EmailTextField), findsNothing);
    expect(find.byType(ElevatedButton), findsNothing);
  });

}