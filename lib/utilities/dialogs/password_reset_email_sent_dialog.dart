import 'package:flutter/material.dart';
import 'package:notetaker/utilities/dialogs/generic_dialog.dart';

Future<void> showPasswordResetSentDialog(BuildContext context) {
  return showGenericDialog<void>(
    context: context,
    title: 'Password Reset',
    content: 'Password reset link sent. Please check your email.',
    optionBuilder: () => {
      'OK': null,
    },
  );
}
