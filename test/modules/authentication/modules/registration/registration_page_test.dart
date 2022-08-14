import 'package:sample_app/modules/authentication/modules/registration/registration_page.dart';
import 'package:sample_app/modules/authentication/modules/registration/state/registration_state_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sample_app/utils/s.dart';

import '../../../../utils/common.dart';
import '../../../../utils/mock.dart';

class MockRegistrationStateNotifier extends MockStateNotifier<RegistrationState>
    implements RegistrationStateNotifier {
  MockRegistrationStateNotifier() : super(RegistrationState.unauthenticated());
}

void main() {
  late MockRegistrationStateNotifier mockRegistrationStateNotifier;

  setUp(() {
    mockRegistrationStateNotifier = MockRegistrationStateNotifier();
  });

  testWidgets('Error state is shown', (WidgetTester tester) async {
    await tester.setupBasicApp(
      child: RegistrationPage(
        navigateAfterRegistrationPath: '/',
      ),
      overrides: [
        registrationStateNotifierProvider
            .overrideWithValue(mockRegistrationStateNotifier),
      ],
    );

    mockRegistrationStateNotifier.debugState =
        RegistrationState.error(emailError: (context) => 'error');
    await tester.pump();
    expect(find.text('error'), findsOneWidget);
  });

  testWidgets('Navigates to home on successful register',
      (WidgetTester tester) async {
    await tester.setupBasicApp(
      child: RegistrationPage(
        navigateAfterRegistrationPath: '/',
      ),
      overrides: [
        registrationStateNotifierProvider
            .overrideWithValue(mockRegistrationStateNotifier),
      ],
    );

    mockRegistrationStateNotifier.debugState = RegistrationState.success();
    await tester.pump();

    GoRouter.of(debugContext(tester)).location == '/home';
  });

  testWidgets('Register cannot be pressed if loading',
      (WidgetTester tester) async {
    await tester.setupBasicApp(
      child: RegistrationPage(
        navigateAfterRegistrationPath: '/',
      ),
      overrides: [
        registrationStateNotifierProvider
            .overrideWithValue(mockRegistrationStateNotifier),
      ],
    );

    mockRegistrationStateNotifier.debugState = RegistrationState.loading();
    await tester.pump();
    await tester.tap(find.text(
      S.of(debugContext(tester)).register,
    ));
    await tester.pump();

    verifyNever(() => mockRegistrationStateNotifier
        .registerWithEmailAndPassword(any(), any(), any()));
  });
}
