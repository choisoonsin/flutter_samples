import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _Timer(),
    );
  }
}

class _Timer extends StatefulWidget {
  const _Timer({Key? key}) : super(key: key);

  @override
  State<_Timer> createState() => __TimerState();
}

class Ticker {
  const Ticker();
  Stream<int> tick({required int ticks}) {
    return Stream.periodic(Duration(seconds: 1), (x) => ticks - x).take(ticks);
  }
}

class __TimerState extends State<_Timer> {
  late StreamSubscription<int> subscription;
  int? _currentTick;
  bool _isPaused = false;

  @override
  initState() {
    super.initState();
    _start(30);
  }

  void _start(int duration) {
    subscription = Ticker().tick(ticks: duration).listen((value) {
      setState(() {
        _isPaused = false;
        _currentTick = value;
      });
    });
  }

  void _resume() {
    setState(() {
      _isPaused = false;
    });
    subscription.resume();
  }

  void _pause() {
    setState(() {
      _isPaused = true;
    });
    subscription.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Text(
              _currentTick == null ? '' : _currentTick.toString(),
              style: TextStyle(fontSize: 100, color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    subscription.cancel();
                    _start(30);
                  },
                  child: const Text('ReStart')),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    _isPaused ? _resume() : _pause();
                  },
                  child: Text(_isPaused ? 'Resume' : 'Stop'))
            ],
          )
        ],
      ),
    );
  }
}
