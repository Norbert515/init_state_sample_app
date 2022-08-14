import 'package:firebase_auth/firebase_auth.dart';
import 'package:sample_app/modules/authentication/modules/password_reset/modules/initiate_password_reset/state/initiate_password_reset_state_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../utils/mock.dart';

void main() {
  late InitiatePasswordResetStateNotifier passwordResetStateNotifier;
  late MockFirebaseAuth firebaseAuthMock;

  setUp(() {
    firebaseAuthMock = MockFirebaseAuth();
    passwordResetStateNotifier =
        InitiatePasswordResetStateNotifier(firebaseAuthMock);
  });

  test('Send password reset link calls sendPasswordResetEmail', () async {
    when(
      () => firebaseAuthMock.sendPasswordResetEmail(
        email: any(named: 'email'),
      ),
    ).thenAnswer((invocation) => Future.value());

    passwordResetStateNotifier.sendPasswordResetLink('mymail@mail.com');
    verify(() =>
            firebaseAuthMock.sendPasswordResetEmail(email: 'mymail@mail.com'))
        .called(1);
  });

  test('Send password reset goes into sent state if no exception is thrown', () async {
    when(
          () => firebaseAuthMock.sendPasswordResetEmail(
        email: any(named: 'email'),
      ),
    ).thenAnswer((invocation) => Future.value());

    passwordResetStateNotifier.sendPasswordResetLink('mymail@mail.com');
    await pumpEventQueue();

    expect(passwordResetStateNotifier.debugState, isA<PasswordResetSent>());
  });

  test('Send password reset goes into sent state if no exception is thrown', () async {
    when(
          () => firebaseAuthMock.sendPasswordResetEmail(
        email: any(named: 'email'),
      ),
    ).thenThrow(FirebaseAuthException(code: 'invalid-email'));

    passwordResetStateNotifier.sendPasswordResetLink('mymail@mail.com');
    await pumpEventQueue();

    expect(passwordResetStateNotifier.debugState, isA<PasswordResetError>());

  });

  test('Send password reset goes into sent state if no exception is thrown', () async {
    when(
          () => firebaseAuthMock.sendPasswordResetEmail(
        email: any(named: 'email'),
      ),
    ).thenThrow(FirebaseAuthException(code: 'user-not-found'));

    passwordResetStateNotifier.sendPasswordResetLink('mymail@mail.com');
    await pumpEventQueue();

    expect(passwordResetStateNotifier.debugState, isA<PasswordResetError>());
  });
}
