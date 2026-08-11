import 'package:dartz/dartz.dart';

import '../domain/model/signup_params.dart';
import '../domain/repositories/signup_repository.dart';
import 'model/request/signup_request_model.dart';
import 'signup_data_source.dart';

class SignupRepositoryImpl extends SignupRepository {
  final SignupDataSource _dataSource;

  SignupRepositoryImpl(this._dataSource);

  @override
  Future<Either<String, bool>> signup(SignupParams params) async {
    try {
      final response = await _dataSource.signup(
        SignupRequestModel(
          email: params.email,
          password: params.password,
          displayName: params.displayName,
        ),
      );
      return Right(response.userId != null);
    } on SignupDataSourceException catch (error) {
      return Left(error.message);
    } catch (_) {
      return const Left('Something went wrong.');
    }
  }
}
