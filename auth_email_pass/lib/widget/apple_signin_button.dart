import 'package:flutter/material.dart';

import 'package:auth_email_pass/view/main_screen.dart';
import 'package:auth_email_pass/services/auth.dart';

import 'package:firebase_auth/firebase_auth.dart';

class AppleSignInButton extends StatefulWidget {
  const AppleSignInButton({Key? key}) : super(key: key);

  @override
  State<AppleSignInButton> createState() => _AppleSignInButtonState();
}

class _AppleSignInButtonState extends State<AppleSignInButton> {
  bool _isSigningIn = false;

  Widget signInWithgoogleButton() {
    return OutlinedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)))),
      onPressed: () async {
        setState(() {
          _isSigningIn = true;
        });

        User? user = await Authentication.signInWithGoogle(context: context);

        setState(() {
          _isSigningIn = false;
        });

        if (user != null) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => MainScreen(
                user: user,
              ),
            ),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Image(image: AssetImage("assets/apple_logo.png"), height: 35.0),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("Sign in with Google"),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: _isSigningIn
            ? const CircularProgressIndicator()
            : signInWithgoogleButton());
  }
}
