import 'package:flutter/material.dart';

import '../../domain/model/signup_params.dart';
import '../../shared/ui_state.dart';
import '../providers/signup_state.dart';

class SignupForm extends StatefulWidget {
  final UIState state;
  final void Function(SignupParams params) onSignup;

  const SignupForm({super.key, required this.state, required this.onSignup});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _displayNameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _displayNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = widget.state;
    final isLoading = state is SignupLoading;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          const Icon(Icons.person_add_alt_1, size: 56),
          const SizedBox(height: 12),
          const Text(
            'Sign up',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 28),
          TextField(
            controller: _displayNameController,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: 'Display name',
              prefixIcon: Icon(Icons.person_outline),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email_outlined),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock_outline),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          if (state is SignupError)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          FilledButton(
            onPressed: isLoading
                ? null
                : () {
                    widget.onSignup(
                      SignupParams(
                        displayName: _displayNameController.text,
                        email: _emailController.text,
                        password: _passwordController.text,
                      ),
                    );
                  },
            child: isLoading
                ? const SizedBox(
                    height: 18,
                    width: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('Create account'),
          ),
        ],
      ),
    );
  }
}
