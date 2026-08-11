import 'package:flutter/material.dart';
import 'package:my_app_test/features/signup/data/signup_data_source.dart';
import 'package:my_app_test/features/signup/data/signup_repository_impl.dart';
import 'package:my_app_test/features/signup/domain/usecases/signup_usecase.dart';
import 'package:my_app_test/features/signup/domain/validation/signup_validation.dart';
import 'package:my_app_test/features/signup/presentation/providers/signup_provider.dart';
import 'package:my_app_test/features/signup/presentation/screens/signup_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ChangeNotifierProvider(
        create: (_) => SignupProvider(
          SignupUseCase(
            SignupRepositoryImpl(SignupDataSource()),
            const SignupValidation(),
          ),
        ),
        child: const SignupScreen(),
      ),
    );
  }
}
