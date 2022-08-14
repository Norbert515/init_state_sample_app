import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:sample_app/modules/authentication/modules/login/state/login_state_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../utils/mock.dart';
import '../../registration/state/registration_state_notifier_test.dart';

void main() {
  group('LoginState', () {
    test('Can login is correct for states', () {
      expect(LoginState.loading().canLogin, equals(false));
      expect(LoginState.success().canLogin, equals(false));

      expect(LoginState.error().canLogin, equals(true));
      expect(LoginState.unauthenticated().canLogin, equals(true));
    });
  });

  group('LoginStateNotifier', () {
    late MockFirebaseAuth mockFirebaseAuth;
    late MockAppLocalizations mockAppLocalizations;

    late LoginStateNotifier loginStateNotifier;

    setUp(() {
      mockFirebaseAuth = MockFirebaseAuth();
      mockAppLocalizations = MockAppLocalizations();
      loginStateNotifier = LoginStateNotifier(mockFirebaseAuth);
    });

    test('If firebase throws no error, goes into loading then success state',
        () async {
      var completer = Completer<UserCredential>();

      when(() => mockFirebaseAuth.signInWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenAnswer((invocation) => completer.future);

      loginStateNotifier.loginWithEmailAndPassword(
          email: 'mymail@mail.com', password: 'ThePassword123#');

      expect(loginStateNotifier.debugState, isA<LoginLoading>());
      completer.complete(MockUserCredential());
      await pumpEventQueue();

      expect(loginStateNotifier.debugState, isA<LoginSuccess>());
    });

    test('Handles invalid-email', () {
      when(() => mockFirebaseAuth.signInWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenThrow(FirebaseAuthException(code: 'invalid-email'));

      loginStateNotifier.loginWithEmailAndPassword(
          email: 'mymail@mail.com', password: 'ThePassword123#');

      expect(loginStateNotifier.debugState, isA<LoginError>());

      when(() => mockAppLocalizations.invalidEmail).thenReturn('');
      (loginStateNotifier.debugState as LoginError)
          .emailError!(mockAppLocalizations);

      verify(() => mockAppLocalizations.invalidEmail).called(1);
    });

    test('Handles user-disabled', () {
      when(() => mockFirebaseAuth.signInWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenThrow(FirebaseAuthException(code: 'user-disabled'));

      loginStateNotifier.loginWithEmailAndPassword(
          email: 'mymail@mail.com', password: 'ThePassword123#');

      expect(loginStateNotifier.debugState, isA<LoginError>());

      when(() => mockAppLocalizations.userDisabled).thenReturn('');
      (loginStateNotifier.debugState as LoginError)
          .emailError!(mockAppLocalizations);

      verify(() => mockAppLocalizations.userDisabled).called(1);
    });

    test('Handles user-not-found', () {
      when(() => mockFirebaseAuth.signInWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenThrow(FirebaseAuthException(code: 'user-not-found'));

      loginStateNotifier.loginWithEmailAndPassword(
          email: 'mymail@mail.com', password: 'ThePassword123#');

      expect(loginStateNotifier.debugState, isA<LoginError>());

      when(() => mockAppLocalizations.userNotFound).thenReturn('');
      (loginStateNotifier.debugState as LoginError)
          .emailError!(mockAppLocalizations);

      verify(() => mockAppLocalizations.userNotFound).called(1);
    });

    test('Handles wrong-password', () {
      when(() => mockFirebaseAuth.signInWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenThrow(FirebaseAuthException(code: 'wrong-password'));

      loginStateNotifier.loginWithEmailAndPassword(
          email: 'mymail@mail.com', password: 'ThePassword123#');

      expect(loginStateNotifier.debugState, isA<LoginError>());

      when(() => mockAppLocalizations.passwordWrong).thenReturn('');
      (loginStateNotifier.debugState as LoginError)
          .passwordError!(mockAppLocalizations);

      verify(() => mockAppLocalizations.passwordWrong).called(1);
    });

    test('Handles unknown code', () {
      when(() => mockFirebaseAuth.signInWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenThrow(FirebaseAuthException(code: 'unknown'));

      expect(
          () => loginStateNotifier.loginWithEmailAndPassword(
              email: 'mymail@mail.com', password: 'ThePassword123#'),
          throwsA(isA<FirebaseAuthException>()));
    });
  });
}
