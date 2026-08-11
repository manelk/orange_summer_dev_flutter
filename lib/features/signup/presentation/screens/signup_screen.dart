import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/signup_provider.dart';
import '../providers/signup_state.dart';
import '../widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SignupProvider>(
      builder: (context, provider, _) {
        final state = provider.state;

        if (state is SignupSuccess) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!context.mounted) return;
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Signup successful.')));
          });
        }

        return Scaffold(
          appBar: AppBar(title: const Text('Create account')),
          body: SafeArea(
            child: SignupForm(state: state, onSignup: provider.signup),
          ),
        );
      },
    );
  }
}
