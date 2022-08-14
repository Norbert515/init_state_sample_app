

import 'package:sample_app/modules/authentication/utils/password_validator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/mock.dart';

void main () {

  test('Correctly finds uppercase passwords', () {
    expect(PasswordValidator.hasUppercase('A'), true);
    expect(PasswordValidator.hasUppercase('AAAAA'), true);
    expect(PasswordValidator.hasUppercase('Aaaa'), true);
    expect(PasswordValidator.hasUppercase('1291027bbd1db1pdB2b8b'), true);
    expect(PasswordValidator.hasUppercase('.,.+_)=412370D'), true);
    expect(PasswordValidator.hasUppercase('Z'), true);

    expect(PasswordValidator.hasUppercase('a'), false);
    expect(PasswordValidator.hasUppercase('134120937fhsdf.;fsdc'), false);
    expect(PasswordValidator.hasUppercase('#@!*&)(^&@#'), false);
  });

  test('Correctly finds lowercase passwords', () {
    expect(PasswordValidator.hasLowercase('a'), true);
    expect(PasswordValidator.hasLowercase('aaaa'), true);
    expect(PasswordValidator.hasLowercase('aAAAA'), true);
    expect(PasswordValidator.hasLowercase('1291027bbd1db1pdB2b8b'), true);
    expect(PasswordValidator.hasLowercase('.,.+_)=412370Dn'), true);
    expect(PasswordValidator.hasLowercase('z'), true);

    expect(PasswordValidator.hasLowercase('A'), false);
    expect(PasswordValidator.hasLowercase('#&ASDJHBK'), false);
    expect(PasswordValidator.hasLowercase('NNHDASD@(&*'), false);
  });

  test('Correctly finds special character passwords', () {
    expect(PasswordValidator.hasSpecialCharacters('%'), true);
    expect(PasswordValidator.hasSpecialCharacters('#'), true);
    expect(PasswordValidator.hasSpecialCharacters('@'), true);
    expect(PasswordValidator.hasSpecialCharacters('@dalsb3017'), true);
    expect(PasswordValidator.hasSpecialCharacters('*'), true);
    expect(PasswordValidator.hasSpecialCharacters('^nal'), true);

    expect(PasswordValidator.hasSpecialCharacters('A'), false);
    expect(PasswordValidator.hasSpecialCharacters('ASDJHBK'), false);
    expect(PasswordValidator.hasSpecialCharacters('ndaphd'), false);
  });

  test('Correctly finds digits in passwords', () {
    expect(PasswordValidator.hasDigits('1'), true);
    expect(PasswordValidator.hasDigits('123'), true);
    expect(PasswordValidator.hasDigits('Hello123'), true);

    expect(PasswordValidator.hasDigits('Password'), false);
    expect(PasswordValidator.hasDigits('Hello^#@#&*'), false);
  });

  test('Correctly finds minimum length passwords', () {
    expect(PasswordValidator.validLength('aaaaaaaa'), true);
    expect(PasswordValidator.validLength('aaaaaaaaaaaaaaaaaa'), true);

    expect(PasswordValidator.validLength('a'), false);
    expect(PasswordValidator.validLength('aaaaaaa'), false);
  });

  test('Correctly checks all requirements', () {
    expect(PasswordValidator.checkPassword('Hello!123').conformsToRequirements, true);
    expect(PasswordValidator.checkPassword('@7423bfdsfNida').conformsToRequirements, true);
    expect(PasswordValidator.checkPassword('ThisIsAPassword748%').conformsToRequirements, true);
    expect(PasswordValidator.checkPassword('EvenThis#3IsCorrect').conformsToRequirements, true);

    expect(PasswordValidator.checkPassword('Short!3').conformsToRequirements, false);
    expect(PasswordValidator.checkPassword('ContainsNoDigit!!!').conformsToRequirements, false);
    expect(PasswordValidator.checkPassword('ONLYUPPERCASE').conformsToRequirements, false);
    expect(PasswordValidator.checkPassword('nouppercase').conformsToRequirements, false);
    expect(PasswordValidator.checkPassword('NoSpecialCharacter').conformsToRequirements, false);
  });

  group('Error messages', () {

    late MockAppLocalizations mockAppLocalizations;
    setUp(() {
      mockAppLocalizations = MockAppLocalizations();
    });

    test('Correct error message for short password', () {
      when(() => mockAppLocalizations.atLeastXCharacter(any())).thenReturn('');
      PasswordValidator.checkPassword('123').errorMessage!(mockAppLocalizations);

      verify(() => mockAppLocalizations.atLeastXCharacter(PasswordValidator.passwordMinLength)).called(1);
    });

    test('Correct error message for missing uppercase', () {
      when(() => mockAppLocalizations.needsAnUppercaseLetter).thenReturn('');
      PasswordValidator.checkPassword('asdfghjkl').errorMessage!(mockAppLocalizations);

      verify(() => mockAppLocalizations.needsAnUppercaseLetter).called(1);
    });

    test('Correct error message for missing digit', () {
      when(() => mockAppLocalizations.needsADigit).thenReturn('');
      PasswordValidator.checkPassword('asdfghjklA').errorMessage!(mockAppLocalizations);

      verify(() => mockAppLocalizations.needsADigit).called(1);
    });

    test('Correct error message for missing lowercase', () {
      when(() => mockAppLocalizations.needsALowercaseCharacter).thenReturn('');
      PasswordValidator.checkPassword('ABCDEFGHIJK123').errorMessage!(mockAppLocalizations);

      verify(() => mockAppLocalizations.needsALowercaseCharacter).called(1);
    });

    test('Correct error message for missing special character', () {
      when(() => mockAppLocalizations.needsASpecialCharacter).thenReturn('');
      PasswordValidator.checkPassword('ABCDEFGHIJK123a').errorMessage!(mockAppLocalizations);

      verify(() => mockAppLocalizations.needsASpecialCharacter).called(1);
    });
  });
}