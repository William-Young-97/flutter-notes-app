import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer' as devtools show log;
import 'package:notetaker/constants/routes.dart';
import 'package:notetaker/utilities/show_error_dialog.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          TextField(
            controller: _email,
            enableSuggestions: false,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(hintText: 'Enter email...'),
          ),
          TextField(
            controller: _password,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(hintText: 'Enter password...'),
          ),
          TextButton(
            onPressed: () async {
              final email = _email.text;
              final password = _password.text;
              try {
                await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: email,
                  password: password,
                );
                if (!context.mounted) return;
                Navigator.of(context).pushNamedAndRemoveUntil(
                  notesRoute,
                  (_) => false,
                );
              } on FirebaseAuthException catch (e) {
                if (e.code == 'user-not-found') {
                  if (!context.mounted) {
                    return devtools.log('Buildcontext not found');
                  }
                  await showErrorDialog(context, 'User not found');
                } else if (e.code == 'wrong-password') {
                  if (!context.mounted) {
                    return devtools.log('Buildcontext not found');
                  }
                  await showErrorDialog(context, 'Wrong password');
                } else {
                  if (!context.mounted) {
                    return devtools.log('Buildcontext not found');
                  }
                  await showErrorDialog(context, 'Error: ${e.code}');
                }
              } catch (e) {
                showErrorDialog(
                  context,
                  'Error: ${e.toString()}',
                );
              }
            },
            child: const Text('Login'),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(registerRoute, (route) => false);
              },
              child: const Text('Not registered? Register here!'))
        ],
      ),
    );
  }
}
