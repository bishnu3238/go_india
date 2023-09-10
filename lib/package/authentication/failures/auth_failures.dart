abstract class AuthFailure implements Exception {
  AuthFailure();
}

class SignUpWithServerFailure implements Exception {
  final String message;
  const SignUpWithServerFailure(
      [this.message = "An unknown exception occurred."]);

  factory SignUpWithServerFailure.fromCode(String code) {
    switch (code) {
      case 'phone-no-already-in-use':
        return const SignUpWithServerFailure(
          'An account already exists for that phone number.',
        );
      case 'email-already-in-use':
        return const SignUpWithServerFailure(
          'An account already exists for that email.',
        );
      default:
        return const SignUpWithServerFailure();
    }
  }
}

class LogInWithServerFailure implements Exception {
  const LogInWithServerFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  factory LogInWithServerFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-user-name':
        return const LogInWithServerFailure(
          'User name is not valid.',
        );
      case 'user-disabled':
        return const LogInWithServerFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const LogInWithServerFailure(
          'User is not found, please create an account.',
        );
      case 'wrong-password':
        return const LogInWithServerFailure(
          'Incorrect password, please try again.',
        );
      default:
        return const LogInWithServerFailure();
    }
  }

  final String message;
}

class FirebaseSignUpWithEmailAndPasswordFailure implements AuthFailure {
  const FirebaseSignUpWithEmailAndPasswordFailure(
      [this.message = 'An unknown exception occurred.']);

  factory FirebaseSignUpWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const FirebaseSignUpWithEmailAndPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const FirebaseSignUpWithEmailAndPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'email-already-in-use':
        return const FirebaseSignUpWithEmailAndPasswordFailure(
          'An account already exists for that email.',
        );
      case 'operation-not-allowed':
        return const FirebaseSignUpWithEmailAndPasswordFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'weak-password':
        return const FirebaseSignUpWithEmailAndPasswordFailure(
          'Please enter a stronger password.',
        );
      default:
        return const FirebaseSignUpWithEmailAndPasswordFailure();
    }
  }
  final String message;
}

class FirebaseLogInWithEmailAndPasswordFailure implements AuthFailure {
  const FirebaseLogInWithEmailAndPasswordFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  factory FirebaseLogInWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const FirebaseLogInWithEmailAndPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const FirebaseLogInWithEmailAndPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const FirebaseLogInWithEmailAndPasswordFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const FirebaseLogInWithEmailAndPasswordFailure(
          'Incorrect password, please try again.',
        );
      default:
        return const FirebaseLogInWithEmailAndPasswordFailure();
    }
  }

  final String message;
}

class LogInWithGoogleFailure implements AuthFailure {
  const LogInWithGoogleFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  factory LogInWithGoogleFailure.fromCode(String code) {
    switch (code) {
      case 'account-exists-with-different-credential':
        return const LogInWithGoogleFailure(
          'Account exists with different credentials.',
        );
      case 'invalid-credential':
        return const LogInWithGoogleFailure(
          'The credential received is malformed or has expired.',
        );
      case 'operation-not-allowed':
        return const LogInWithGoogleFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'user-disabled':
        return const LogInWithGoogleFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const LogInWithGoogleFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const LogInWithGoogleFailure(
          'Incorrect password, please try again.',
        );
      case 'invalid-verification-code':
        return const LogInWithGoogleFailure(
          'The credential verification code received is invalid.',
        );
      case 'invalid-verification-id':
        return const LogInWithGoogleFailure(
          'The credential verification ID received is invalid.',
        );
      default:
        return const LogInWithGoogleFailure();
    }
  }

  final String message;
}

class FirebaseSendOtpFailure implements AuthFailure {
  const FirebaseSendOtpFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  factory FirebaseSendOtpFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-phone-number':
        return const FirebaseSendOtpFailure(
          'The phone number is invalid.',
        );
      case 'phone-number-already-in-use':
        return const FirebaseSendOtpFailure(
          'The phone number is already in use.',
        );
      case 'verification-code-expired':
        return const FirebaseSendOtpFailure(
          'The verification code has expired.',
        );
      case 'verification-code-mismatch':
        return const FirebaseSendOtpFailure(
          'The verification code does not match.',
        );
      default:
        return const FirebaseSendOtpFailure();
    }
  }

  final String message;
}

class FirebaseOtpVerificationFailure implements AuthFailure {
  final String message;

  const FirebaseOtpVerificationFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  factory FirebaseOtpVerificationFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-verification-code':
        return const FirebaseOtpVerificationFailure(
          'Invalid OTP. Please enter the correct code.',
        );
      case 'quota-exceeded':
        return const FirebaseOtpVerificationFailure(
          'SMS quota for this project has been exceeded. Please try again later.',
        );
      case 'session-expired':
        return const FirebaseOtpVerificationFailure(
          'The verification session has expired. Please request a new OTP.',
        );
      case 'invalid-verification-id':
        return const FirebaseOtpVerificationFailure(
          'Invalid verification ID. Please restart the verification process.',
        );
      default:
        return const FirebaseOtpVerificationFailure();
    }
  }
}

class LogOutFailure implements AuthFailure {
  const LogOutFailure([this.message = 'An unknown exception occurred.']);
  final String message;
}
