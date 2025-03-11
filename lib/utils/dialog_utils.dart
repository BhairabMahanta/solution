import 'package:flutter/material.dart';
import '../widgets/auth_form.dart'; // Import AuthForm for popup content

void showAuthDialog(BuildContext context, String action) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: SelectableText("$action Form"),
        content: AuthForm(action: action),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const SelectableText("Close"),
          ),
        ],
      );
    },
  );
}
