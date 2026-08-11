import 'package:dartz/dartz.dart';

import '../model/signup_params.dart';

abstract class SignupRepository {
  Future<Either<String, bool>> signup(SignupParams params);
}
