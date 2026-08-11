import 'package:dartz/dartz.dart';

import '../../shared/usecase.dart';
import '../model/signup_params.dart';
import '../repositories/signup_repository.dart';
import '../validation/signup_validation.dart';

class SignupUseCase extends UseCase<bool, SignupParams> {
  final SignupRepository _repository;
  final SignupValidation _validation;

  SignupUseCase(this._repository, this._validation);

  @override
  Future<Either<String, bool>> call(SignupParams params) async {
    final validationMessage = _validation.validate(params);
    if (validationMessage != null) {
      return Left(validationMessage);
    }

    return _repository.signup(params);
  }
}
