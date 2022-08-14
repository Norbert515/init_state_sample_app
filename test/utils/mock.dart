import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


/// A collection of common mocks
/// Each Mock has the name Mock<original_name>

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUser extends Mock implements User {}

class MockAppLocalizations extends Mock implements AppLocalizations {}

/// Used to mock [StateNotifier] and provide an easy way to controll the state
/// without actually executing the inner logic.
///
/// An example:
///
/// ```
/// class MockRegistrationStateNotifier extends MockStateNotifier<RegistrationState>
///     implements RegistrationStateNotifier {
///   MockRegistrationStateNotifier() : super(RegistrationState.unauthenticated());
/// }
/// ```
///
/// And to use in a test:
///
/// ```
///     await tester.setupBasicApp(
///       child: RegistrationPage(),
///       overrides: [
///         registrationStateNotifierProvider.overrideWithValue(mockRegistrationStateNotifier),
///       ],
///     );
///
///     mockRegistrationStateNotifier.debugState = RegistrationState.error(emailError: 'error');
///     await tester.pump();
///     expect(find.text('error'), findsOneWidget);
/// ```
class MockStateNotifier<T> extends StateNotifier<T> with Mock {
  MockStateNotifier(T state) : super(state);

  /// Sets the [state] without triggering a lint due to @protected
  set debugState(T value) {
    state = value;
  }
}