import 'package:flutter_test/flutter_test.dart';
import 'package:digi_notes/core/utils/validators.dart';

void main() {
  group('Validators', () {
    group('validateEmail', () {
      test('should return null for valid email', () {
        expect(Validators.validateEmail('test@example.com'), isNull);
        expect(Validators.validateEmail('user.name@domain.co.uk'), isNull);
      });

      test('should return error message for invalid email', () {
        expect(Validators.validateEmail(''), isNotNull);
        expect(Validators.validateEmail('invalid-email'), isNotNull);
        expect(Validators.validateEmail('test@'), isNotNull);
        expect(Validators.validateEmail('@example.com'), isNotNull);
      });
    });

    group('validatePassword', () {
      test('should return null for valid password', () {
        expect(Validators.validatePassword('password123'), isNull);
        expect(Validators.validatePassword('12345678'), isNull);
      });

      test('should return error message for invalid password', () {
        expect(Validators.validatePassword(''), isNotNull);
        expect(Validators.validatePassword('123'), isNotNull);
        expect(Validators.validatePassword('short'), isNotNull);
      });
    });

    group('validateConfirmPassword', () {
      test('should return null for matching passwords', () {
        expect(Validators.validateConfirmPassword('password123', 'password123'), isNull);
      });

      test('should return error message for non-matching passwords', () {
        expect(Validators.validateConfirmPassword('password123', 'different'), isNotNull);
        expect(Validators.validateConfirmPassword('', 'password123'), isNotNull);
      });
    });

    group('validateName', () {
      test('should return null for valid name', () {
        expect(Validators.validateName('John'), isNull);
        expect(Validators.validateName('John Doe'), isNull);
      });

      test('should return error message for invalid name', () {
        expect(Validators.validateName(''), isNotNull);
        expect(Validators.validateName('A'), isNotNull);
      });
    });

    group('validatePhone', () {
      test('should return null for valid phone', () {
        expect(Validators.validatePhone('1234567890'), isNull);
        expect(Validators.validatePhone('+1234567890'), isNull);
      });

      test('should return error message for invalid phone', () {
        expect(Validators.validatePhone(''), isNotNull);
        expect(Validators.validatePhone('123'), isNotNull);
        expect(Validators.validatePhone('123456789'), isNotNull);
      });
    });

    group('isFormValid', () {
      test('should return true for valid form', () {
        final validations = {
          'email': null,
          'password': null,
          'name': null,
        };
        expect(Validators.isFormValid(validations), isTrue);
      });

      test('should return false for invalid form', () {
        final validations = {
          'email': 'Invalid email',
          'password': null,
          'name': null,
        };
        expect(Validators.isFormValid(validations), isFalse);
      });
    });
  });
}
