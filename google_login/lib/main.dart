import 'dart:async';
import 'dart:convert' show json;

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// The scopes required by this application.
const List<String> scopes = <String>[
  'email',
  'https://www.googleapis.com/auth/contacts.readonly',
];

// GoogleSignIn _googleSignIn = GoogleSignIn(
//     clientId:
//         '477127473397-t3gqtc04g1jleo33n3s969tip6usaj16.apps.googleusercontent.com',
//     scopes: scopes);

void main() {
  runApp(const MaterialApp(
    title: 'Google Sign In',
    home: SignInDemo(),
  ));
}

class SignInDemo extends StatefulWidget {
  const SignInDemo({super.key});

  @override
  State<SignInDemo> createState() => _SignInDemoState();
}

class _SignInDemoState extends State<SignInDemo> {
  void signInGoogle() async {
    final GoogleSignInAccount? _googleSignIn = await GoogleSignIn().signIn();

    if (_googleSignIn != null) {
      print('name: ${_googleSignIn.displayName}');
    }
  }

  Widget _buildBody() {
    // The user is NOT Authenticated
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        const Text('Google Login'),
        // This method is used to separate mobile from web code with conditional exports.
        // See: src/sign_in_button.dart
        ElevatedButton(onPressed: signInGoogle, child: const Text('Sign In')),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Google Sign In')),
        body: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: _buildBody(),
        ));
  }
}
