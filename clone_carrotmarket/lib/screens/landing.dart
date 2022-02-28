import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    init();
  }

  void init() async {
    // verify authorization
    bool _isAuthorized = await verifyAuthorization();

    if (_isAuthorized) {
      Navigator.pushNamed(context, '/home');
    }
  }

  Future<bool> verifyAuthorization() {
    return Future.delayed(const Duration(seconds: 2), () => true);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image(
      image: AssetImage('images/icon.png'),
      width: 30,
    ));
  }
}
