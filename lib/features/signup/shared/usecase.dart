import 'package:dartz/dartz.dart';

abstract class UseCase<Result, Params> {
  Future<Either<String, Result>> call(Params params);
}
