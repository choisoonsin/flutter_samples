import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:auth_email_pass/services/api.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late User _user;

  @override
  void initState() {
    _user = widget._user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        title: const Text('Welcome'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(_user.photoURL.toString())),
            const SizedBox(
              height: 20,
            ),
            Text(_user.displayName.toString()),
            const SizedBox(
              height: 20,
            ),
            Text(_user.email.toString()),
            const Divider(
              height: 40,
            ),
            Expanded(
                child: Column(
              children: [
                Row(
                  children: [
                    ElevatedButton(
                      child: Text("Send user credential"),
                      onPressed: () => ApiService.getToken(_user),
                    )
                  ],
                )
              ],
            ))
          ],
        )),
      ),
    );
  }
}
