import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notetaker/constants/routes.dart';
import 'dart:developer' as devtools show log;
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
      body: Column(
        children: [
          const Text(
              'We\'ve sent you an email verification. Please click the link provided to verify your account.'),
          const Text(
              'If you haven\'t recieved an email, press the button below.'),
          TextButton(
            onPressed: () async {
              context.read<AuthBloc>().add(
                    const AuthEventVerifyEmail(),
                  );
            },
            child: const Text('Send email verification'),
          ),
          TextButton(
            onPressed: () async {
              if (!context.mounted) {
                return devtools.log('Buildcontext not found');
              }
              context.read<AuthBloc>().add(
                    const AuthEventLogOut(),
                  );
              Navigator.of(context).pushNamedAndRemoveUntil(
                registerRoute,
                (route) => false,
              );
            },
            child: const Text('Restart'),
          ),
        ],
      ),
    );
  }
}
