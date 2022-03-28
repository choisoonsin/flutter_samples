import 'package:auth_email_pass/view/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // const firebaseConfig = {
  //   apiKey: "AIzaSyAFvCeem_pyZKZS4oOzN6PwJ-HMb1lAn_Y",
  //   authDomain: "flutter-982af.firebaseapp.com",
  //   projectId: "flutter-982af",
  //   storageBucket: "flutter-982af.appspot.com",
  //   messagingSenderId: "328138354483",
  //   appId: "1:328138354483:web:44e455bc4028db31e5d846",
  //   measurementId: "G-9YX6WMY109"
  // };

  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: "AIzaSyAFvCeem_pyZKZS4oOzN6PwJ-HMb1lAn_Y",
    appId: "1:328138354483:web:44e455bc4028db31e5d846d",
    messagingSenderId: "328138354483",
    projectId: "flutter-982af",
    authDomain: "flutter-982af.firebaseapp.com",
  ));
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}
