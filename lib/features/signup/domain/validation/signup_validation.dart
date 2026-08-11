import '../model/signup_params.dart';

class SignupValidation {
  const SignupValidation();

  String? validate(SignupParams params) {
    if (params.displayName.trim().isEmpty) {
      return 'Display name is required.';
    }
    if (!params.email.contains('@')) {
      return 'Enter a valid email.';
    }
    if (params.password.length < 8) {
      return 'Password must be at least 8 characters.';
    }
    return null;
  }
}
