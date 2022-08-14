import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:sample_app/modules/authentication/modules/registration/state/registration_state_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../utils/mock.dart';

class MockUserCredential extends Mock implements UserCredential {}

void main() {
  late MockFirebaseAuth firebaseAuthMock;
  late RegistrationStateNotifier registrationStateNotifier;
  late MockAppLocalizations mockAppLocalizations;

  setUp(() {
    firebaseAuthMock = MockFirebaseAuth();
    mockAppLocalizations = MockAppLocalizations();
    registrationStateNotifier = RegistrationStateNotifier(firebaseAuthMock);
  });

  test('Can register is correct for all states', () async {
    expect(RegistrationState.success().canRegister, false);
    expect(RegistrationState.loading().canRegister, false);

    expect(RegistrationState.error().canRegister, true);
    expect(RegistrationState.unauthenticated().canRegister, true);
  });

  test('Register goes into loading then success state if auth was successful',
      () async {
    var registerCompleter = Completer<UserCredential>();

    var mail = 'my@email.com';
    var password = 'SomePassword123!';

    when(() => firebaseAuthMock.createUserWithEmailAndPassword(
          email: any(named: 'email'),
          password: any(named: 'password'),
        )).thenAnswer((invocation) => registerCompleter.future);

    registrationStateNotifier.registerWithEmailAndPassword(
      mail,
      password,
      password,
    );

    expect(registrationStateNotifier.debugState, isA<RegistrationLoading>());

    registerCompleter.complete(MockUserCredential());

    await pumpEventQueue();
    expect(registrationStateNotifier.debugState, isA<RegistrationSuccess>());

    verify(() => firebaseAuthMock.createUserWithEmailAndPassword(
          email: mail,
          password: password,
        )).called(1);
  });

  test('email-already-in-use handled', () async {
    when(() => firebaseAuthMock.createUserWithEmailAndPassword(
          email: any(named: 'email'),
          password: any(named: 'password'),
        )).thenThrow(FirebaseAuthException(code: 'email-already-in-use'));

    registrationStateNotifier.registerWithEmailAndPassword(
      'mail@mail.com',
      'SomeWeirdPassword12345!',
      'SomeWeirdPassword12345!',
    );

    when(() => mockAppLocalizations.emailAlreadyInUse).thenReturn('');

    expect(registrationStateNotifier.debugState, isA<RegistrationError>());
    (registrationStateNotifier.debugState as RegistrationError)
        .emailError!(mockAppLocalizations);
    verify(() => mockAppLocalizations.emailAlreadyInUse).called(1);
  });

  test('passwords dont match handled', () async {
    when(() => firebaseAuthMock.createUserWithEmailAndPassword(
      email: any(named: 'email'),
      password: any(named: 'password'),
    )).thenAnswer((_) => Future.value(MockUserCredential()));

    registrationStateNotifier.registerWithEmailAndPassword(
      'mail@mail.com',
      'SomeWeirdPassword12345!',
      'something else',
    );

    when(() => mockAppLocalizations.passwordsDontMatch).thenReturn('');

    expect(registrationStateNotifier.debugState, isA<RegistrationError>());
    (registrationStateNotifier.debugState as RegistrationError)
        .passwordError!(mockAppLocalizations);
    verify(() => mockAppLocalizations.passwordsDontMatch).called(1);
  });

  test('invalid-email handled', () async {
    when(() => firebaseAuthMock.createUserWithEmailAndPassword(
          email: any(named: 'email'),
          password: any(named: 'password'),
        )).thenThrow(FirebaseAuthException(code: 'invalid-email'));

    registrationStateNotifier.registerWithEmailAndPassword(
      'mail@mail.com',
      'SomeWeirdPassword12345!',
      'SomeWeirdPassword12345!',
    );

    when(() => mockAppLocalizations.invalidEmail).thenReturn('');

    expect(registrationStateNotifier.debugState, isA<RegistrationError>());
    (registrationStateNotifier.debugState as RegistrationError)
        .emailError!(mockAppLocalizations);
    verify(() => mockAppLocalizations.invalidEmail).called(1);
  });

  test('operation-not-allowed handled', () async {
    when(() => firebaseAuthMock.createUserWithEmailAndPassword(
          email: any(named: 'email'),
          password: any(named: 'password'),
        )).thenThrow(FirebaseAuthException(code: 'operation-not-allowed'));

    registrationStateNotifier.registerWithEmailAndPassword(
      'mail@mail.com',
      'SomeWeirdPassword12345!',
      'SomeWeirdPassword12345!',
    );

    when(() => mockAppLocalizations.emailSignInNotSupported).thenReturn('');

    expect(registrationStateNotifier.debugState, isA<RegistrationError>());
    (registrationStateNotifier.debugState as RegistrationError)
        .emailError!(mockAppLocalizations);
    verify(() => mockAppLocalizations.emailSignInNotSupported).called(1);
  });

  test('weak-password handled', () async {
    when(() => firebaseAuthMock.createUserWithEmailAndPassword(
          email: any(named: 'email'),
          password: any(named: 'password'),
        )).thenThrow(FirebaseAuthException(code: 'weak-password'));

    registrationStateNotifier.registerWithEmailAndPassword(
      'mail@mail.com',
      'SomeWeirdPassword12345!',
      'SomeWeirdPassword12345!',
    );

    when(() => mockAppLocalizations.passwordWeak).thenReturn('');
    expect(registrationStateNotifier.debugState, isA<RegistrationError>());

    (registrationStateNotifier.debugState as RegistrationError)
        .passwordError!(mockAppLocalizations);
    verify(() => mockAppLocalizations.passwordWeak).called(1);
  });

  test('unknown error handled', () async {
    when(() => firebaseAuthMock.createUserWithEmailAndPassword(
          email: any(named: 'email'),
          password: any(named: 'password'),
        )).thenThrow(FirebaseAuthException(code: 'unknown'));

    expect(
        () => registrationStateNotifier.registerWithEmailAndPassword(
              'mail@mail.com',
              'SomeWeirdPassword12345!',
              'SomeWeirdPassword12345!',
            ),
        throwsA(isA<FirebaseAuthException>()));
  });
}
