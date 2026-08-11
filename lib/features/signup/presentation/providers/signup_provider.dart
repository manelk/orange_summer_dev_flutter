import 'package:flutter/foundation.dart';

import '../../domain/model/signup_params.dart';
import '../../domain/usecases/signup_usecase.dart';
import '../../shared/ui_state.dart';
import 'signup_state.dart';

class SignupProvider extends ChangeNotifier {
  final SignupUseCase _signupUseCase;

  SignupProvider(this._signupUseCase);

  UIState _state = const SignupIdle();

  UIState get state => _state;

  Future<void> signup(SignupParams params) async {
    _state = const SignupLoading();
    notifyListeners();

    final result = await _signupUseCase(params);

    result.fold(
      (message) => _state = SignupError(message),
      (success) => _state = SignupSuccess(success),
    );

    notifyListeners();
  }
}
