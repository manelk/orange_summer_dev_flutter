import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app_test/features/signup/domain/model/signup_params.dart';
import 'package:my_app_test/features/signup/domain/repositories/signup_repository.dart';
import 'package:my_app_test/features/signup/domain/usecases/signup_usecase.dart';
import 'package:my_app_test/features/signup/domain/validation/signup_validation.dart';

class FakeSignupRepository implements SignupRepository {
  int calls = 0;

  @override
  Future<Either<String, bool>> signup(SignupParams params) async {
    calls++;
    return const Right(true);
  }
}

void main() {
  late FakeSignupRepository repository;
  late SignupUseCase useCase;

  setUp(() {
    repository = FakeSignupRepository();
    useCase = SignupUseCase(repository, const SignupValidation());
  });

  test('returns Right(true) when repository signup succeeds', () async {
    const params = SignupParams(
      email: 'person@example.com',
      password: 'StrongPass123',
      displayName: 'Person',
    );

    final result = await useCase(params);

    expect(result, const Right(true));
    expect(repository.calls, 1);
  });

  test('returns validation message before calling repository', () async {
    const invalidParams = SignupParams(
      email: 'wrong-email',
      password: '123',
      displayName: '',
    );

    final result = await useCase(invalidParams);

    expect(result.isLeft(), isTrue);
    expect(
      result.fold((message) => message, (_) => null),
      'Display name is required.',
    );
    expect(repository.calls, 0);
  });
}
