import 'package:flutter/material.dart';
import '../widgets/auth_form.dart'; // Importing the dialog form

class GreenStrideAuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SelectableText('GreenStride'),
        backgroundColor: Colors.green.shade700,
        actions: [
          TextButton(
            onPressed: () {
              _showAuthDialog(context, "Login");
            },
            child: const SelectableText("Login",
                style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () {
              _showAuthDialog(context, "Signup");
            },
            child: const SelectableText("Signup",
                style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: const Center(
        child: SelectableText(
          "Welcome to GreenStride! Please login or signup to continue.",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  void _showAuthDialog(BuildContext context, String action) {
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
}
