class Failure implements Exception {
  final String error;
  Failure(
    this.error,
  );
  @override
  String toString() {
    return error;
  }
}

class SignUpWithEmailAndPasswordFailure extends Failure {
  SignUpWithEmailAndPasswordFailure(this.error) : super('');

  factory SignUpWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return SignUpWithEmailAndPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return SignUpWithEmailAndPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'email-already-in-use':
        return SignUpWithEmailAndPasswordFailure(
          'An account already exists for that email.',
        );
      case 'operation-not-allowed':
        return SignUpWithEmailAndPasswordFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'weak-password':
        return SignUpWithEmailAndPasswordFailure(
          'Please enter a stronger password.',
        );
      default:
        return SignUpWithEmailAndPasswordFailure('');
    }
  }

  @override
  final String error;
}

class LogInWithEmailAndPasswordFailure extends Failure {
  LogInWithEmailAndPasswordFailure(this.error) : super('');

  factory LogInWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return LogInWithEmailAndPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return LogInWithEmailAndPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return LogInWithEmailAndPasswordFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return LogInWithEmailAndPasswordFailure(
          'Incorrect password, please try again.',
        );
      default:
        return LogInWithEmailAndPasswordFailure("");
    }
  }

  @override
  final String error;
}

class LogInWithGoogleFailure extends Failure {
  /// {@macro log_in_with_google_failure}
  LogInWithGoogleFailure(this.error) : super('');

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory LogInWithGoogleFailure.fromCode(String code) {
    switch (code) {
      case 'account-exists-with-different-credential':
        return LogInWithGoogleFailure(
          'Account exists with different credentials.',
        );
      case 'invalid-credential':
        return LogInWithGoogleFailure(
          'The credential received is malformed or has expired.',
        );
      case 'operation-not-allowed':
        return LogInWithGoogleFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'user-disabled':
        return LogInWithGoogleFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return LogInWithGoogleFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return LogInWithGoogleFailure(
          'Incorrect password, please try again.',
        );
      case 'invalid-verification-code':
        return LogInWithGoogleFailure(
          'The credential verification code received is invalid.',
        );
      case 'invalid-verification-id':
        return LogInWithGoogleFailure(
          'The credential verification ID received is invalid.',
        );
      default:
        return LogInWithGoogleFailure('');
    }
  }

  /// The associated error message.
  @override
  final String error;
}

class LogOutFailure extends Failure {
  LogOutFailure(super.error);
}

class LocalStorageFailure extends Failure {
  LocalStorageFailure(super.error);
}

class FireStoreFailure extends Failure {
  FireStoreFailure(super.error);
}