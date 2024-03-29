import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notetaker/services/auth/bloc/auth_bloc.dart';
import 'package:notetaker/services/auth/bloc/auth_event.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Email'),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
                'We\'ve sent you an email verification. Please click the link provided to verify your account.'),
            const Text(
                'If you haven\'t recieved an email, press the button below.'),
            TextButton(
              onPressed: () async {
                context.read<AuthBloc>().add(
                      const AuthEventSendEmailVerification(),
                    );
              },
              child: const Text('Send email verification'),
            ),
            TextButton(
              onPressed: () async {
                context.read<AuthBloc>().add(
                      const AuthEventLogOut(),
                    );
              },
              child: const Text('Restart'),
            ),
          ],
        ),
      ),
    );
  }
}
