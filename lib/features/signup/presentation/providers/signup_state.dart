import '../../shared/ui_state.dart';

class SignupIdle extends Idle {
  const SignupIdle();
}

class SignupLoading extends Loading {
  const SignupLoading();
}

class SignupSuccess extends Success<bool> {
  const SignupSuccess(super.data);
}

class SignupError extends ErrorState {
  const SignupError(super.message);
}
