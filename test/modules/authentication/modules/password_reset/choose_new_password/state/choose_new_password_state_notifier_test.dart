import 'package:firebase_auth/firebase_auth.dart';
import 'package:sample_app/modules/authentication/modules/password_reset/modules/choose_new_password/state/choose_new_password_state_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../utils/mock.dart';

void main() {
  group('ChooseNewPasswordState tests', () {

    late MockAppLocalizations mockAppLocalizations;
    setUp(() {
      mockAppLocalizations = MockAppLocalizations();
    });

    test(
        'ChooseNewPasswordState getPasswordError returns error when in error state',
        () {
      var state = ChooseNewPasswordState.error(passwordError: (_) => 'error');
      expect(state.getPasswordError((mockAppLocalizations)), equals('error'));
    });

    test(
        'ChooseNewPasswordState getPasswordError returns null for not error states',
        () {
      expect(
          ChooseNewPasswordState.initial().getPasswordError(MockAppLocalizations()),
          isNull);
      expect(
          ChooseNewPasswordState.loading().getPasswordError(MockAppLocalizations()),
          isNull);
      expect(ChooseNewPasswordState.done().getPasswordError(MockAppLocalizations()),
          isNull);
    });
  });

  group('ChooseNewPasswordStateNotifier tests', () {
    late ChooseNewPasswordStateNotifier chooseNewPasswordStateNotifier;
    late MockFirebaseAuth mockFirebaseAuth;

    setUp(() {
      mockFirebaseAuth = MockFirebaseAuth();
      chooseNewPasswordStateNotifier =
          ChooseNewPasswordStateNotifier(auth: mockFirebaseAuth);
    });

    test('Verify calls verifyPasswordResetCode on firebase auth', () async {
      when(() => mockFirebaseAuth.verifyPasswordResetCode(any()))
          .thenAnswer((_) => Future.value(''));
      chooseNewPasswordStateNotifier.verify('oobCode');

      verify(() => mockFirebaseAuth.verifyPasswordResetCode('oobCode'))
          .called(1);
    });

    test('Verify handles "expired-action-code" error', () async {
      when(() => mockFirebaseAuth.verifyPasswordResetCode(any()))
          .thenThrow(FirebaseAuthException(code: 'expired-action-code'));

      chooseNewPasswordStateNotifier.verify('oobCode');

      expect(chooseNewPasswordStateNotifier.debugState,
          isA<ChooseNewPasswordError>());
      expect(
          (chooseNewPasswordStateNotifier.debugState as ChooseNewPasswordError)
              .error,
          isNotNull);
    });

    test('Verify handles "invalid-action-code" error', () async {
      when(() => mockFirebaseAuth.verifyPasswordResetCode(any()))
          .thenThrow(FirebaseAuthException(code: 'invalid-action-code'));

      chooseNewPasswordStateNotifier.verify('oobCode');

      expect(chooseNewPasswordStateNotifier.debugState,
          isA<ChooseNewPasswordError>());
      expect(
          (chooseNewPasswordStateNotifier.debugState as ChooseNewPasswordError)
              .error,
          isNotNull);
    });

    test('Verify handles "user-disabled" error', () async {
      when(() => mockFirebaseAuth.verifyPasswordResetCode(any()))
          .thenThrow(FirebaseAuthException(code: 'user-disabled'));

      chooseNewPasswordStateNotifier.verify('oobCode');

      expect(chooseNewPasswordStateNotifier.debugState,
          isA<ChooseNewPasswordError>());
      expect(
          (chooseNewPasswordStateNotifier.debugState as ChooseNewPasswordError)
              .error,
          isNotNull);
    });

    test('Verify handles "user-not-found" error', () async {
      when(() => mockFirebaseAuth.verifyPasswordResetCode(any()))
          .thenThrow(FirebaseAuthException(code: 'user-not-found'));

      chooseNewPasswordStateNotifier.verify('oobCode');

      expect(chooseNewPasswordStateNotifier.debugState,
          isA<ChooseNewPasswordError>());
      expect(
          (chooseNewPasswordStateNotifier.debugState as ChooseNewPasswordError)
              .error,
          isNotNull);
    });

    test('resetPassword goes into an error state if passwords don\'t match',
        () async {
      chooseNewPasswordStateNotifier.resetPassword(
        newPassword: 'one',
        repeatedPassword: 'two',
        oobCode: 'oobCode',
      );

      expect(chooseNewPasswordStateNotifier.debugState,
          isA<ChooseNewPasswordError>());
      expect(
          (chooseNewPasswordStateNotifier.debugState as ChooseNewPasswordError)
              .passwordError,
          isNotNull);
    });

    test('reset password calls firebase auth confirmPasswordReset', () async {
      when(() => mockFirebaseAuth.confirmPasswordReset(
              newPassword: any(named: 'newPassword'), code: any(named: 'code')))
          .thenAnswer((invocation) => Future.value());

      chooseNewPasswordStateNotifier.resetPassword(
        newPassword: 'one',
        repeatedPassword: 'one',
        oobCode: 'oobCode',
      );

      verify(() => mockFirebaseAuth.confirmPasswordReset(newPassword: 'one', code: 'oobCode')).called(1);
    });

    test('reset password calls firebase auth confirmPasswordReset', () async {
      when(() => mockFirebaseAuth.confirmPasswordReset(
          newPassword: any(named: 'newPassword'), code: any(named: 'code')))
          .thenAnswer((invocation) => Future.value());

      chooseNewPasswordStateNotifier.resetPassword(
        newPassword: 'one',
        repeatedPassword: 'one',
        oobCode: 'oobCode',
      );

      verify(() => mockFirebaseAuth.confirmPasswordReset(newPassword: 'one', code: 'oobCode')).called(1);
    });

    test('reset password handles expired-action-code', () async {
      when(() => mockFirebaseAuth.confirmPasswordReset(
          newPassword: any(named: 'newPassword'), code: any(named: 'code')))
          .thenThrow(FirebaseAuthException(code: 'expired-action-code'));

      chooseNewPasswordStateNotifier.resetPassword(
        newPassword: 'one',
        repeatedPassword: 'one',
        oobCode: 'oobCode',
      );

      expect(chooseNewPasswordStateNotifier.debugState,
          isA<ChooseNewPasswordError>());
      expect(
          (chooseNewPasswordStateNotifier.debugState as ChooseNewPasswordError)
              .error,
          isNotNull);
    });

    test('reset password handles invalid-action-code', () async {
      when(() => mockFirebaseAuth.confirmPasswordReset(
          newPassword: any(named: 'newPassword'), code: any(named: 'code')))
          .thenThrow(FirebaseAuthException(code: 'invalid-action-code'));

      chooseNewPasswordStateNotifier.resetPassword(
        newPassword: 'one',
        repeatedPassword: 'one',
        oobCode: 'oobCode',
      );

      expect(chooseNewPasswordStateNotifier.debugState,
          isA<ChooseNewPasswordError>());
      expect(
          (chooseNewPasswordStateNotifier.debugState as ChooseNewPasswordError)
              .error,
          isNotNull);
    });

    test('reset password handles user-disabled', () async {
      when(() => mockFirebaseAuth.confirmPasswordReset(
          newPassword: any(named: 'newPassword'), code: any(named: 'code')))
          .thenThrow(FirebaseAuthException(code: 'user-disabled'));

      chooseNewPasswordStateNotifier.resetPassword(
        newPassword: 'one',
        repeatedPassword: 'one',
        oobCode: 'oobCode',
      );

      expect(chooseNewPasswordStateNotifier.debugState,
          isA<ChooseNewPasswordError>());
      expect(
          (chooseNewPasswordStateNotifier.debugState as ChooseNewPasswordError)
              .error,
          isNotNull);
    });

    test('reset password handles user-not-found', () async {
      when(() => mockFirebaseAuth.confirmPasswordReset(
          newPassword: any(named: 'newPassword'), code: any(named: 'code')))
          .thenThrow(FirebaseAuthException(code: 'user-not-found'));

      chooseNewPasswordStateNotifier.resetPassword(
        newPassword: 'one',
        repeatedPassword: 'one',
        oobCode: 'oobCode',
      );

      expect(chooseNewPasswordStateNotifier.debugState,
          isA<ChooseNewPasswordError>());
      expect(
          (chooseNewPasswordStateNotifier.debugState as ChooseNewPasswordError)
              .error,
          isNotNull);
    });

    test('reset password handles weak-password', () async {
      when(() => mockFirebaseAuth.confirmPasswordReset(
          newPassword: any(named: 'newPassword'), code: any(named: 'code')))
          .thenThrow(FirebaseAuthException(code: 'weak-password'));

      chooseNewPasswordStateNotifier.resetPassword(
        newPassword: 'one',
        repeatedPassword: 'one',
        oobCode: 'oobCode',
      );

      expect(chooseNewPasswordStateNotifier.debugState,
          isA<ChooseNewPasswordError>());
      expect(
          (chooseNewPasswordStateNotifier.debugState as ChooseNewPasswordError)
              .passwordError,
          isNotNull);
    });
  });
}
