import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: _Timer(),
    );
  }
}

class _Timer extends StatelessWidget {
  const _Timer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          const BackGround(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DisplayTimer(),
              SizedBox(
                height: 10,
              ),
              ActionBar()
            ],
          )
        ],
      ),
    );
  }
}

class BackGround extends StatelessWidget {
  const BackGround({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blue, Colors.blueGrey])),
    );
  }
}

class DisplayTimer extends StatelessWidget {
  const DisplayTimer({Key? key}) : super(key: key);

  static const _timerTextStyle = TextStyle(fontSize: 70, color: Colors.white);

  Widget _PieceTimer({required String displayNumber}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.black54),
      child: Text(
        displayNumber,
        style: _timerTextStyle,
      ),
    );
  }

  Widget _Colon() {
    return Container(
      padding: EdgeInsets.only(bottom: 11),
      child: Text(
        ":",
        style: _timerTextStyle,
      ),
    );
  }

  List<Widget> _Timer({required int time}) {
    final _sec = (time % 60).floor().toString().padLeft(2, '0'); // seconds
    final _min =
        ((time / 60) % 60).floor().toString().padLeft(2, '0'); // minutes
    final _hour = (time / 60 / 60).floor().toString().padLeft(2, '0'); // hours

    print('Hours $_hour, Minutes $_min, Seconds $_sec');

    return [
      _PieceTimer(displayNumber: _hour.substring(0, 1)),
      _PieceTimer(displayNumber: _hour.substring(1, 2)),
      _Colon(),
      _PieceTimer(displayNumber: _min.substring(0, 1)),
      _PieceTimer(displayNumber: _min.substring(1, 2)),
      _Colon(),
      _PieceTimer(displayNumber: _sec.substring(0, 1)),
      _PieceTimer(displayNumber: _sec.substring(1, 2)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [..._Timer(time: 8690)],
      ),
    );
  }
}

enum ActionStatus { init, progress, pause, complete }

class ActionBar extends StatelessWidget {
  const ActionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _state = ActionStatus.init;

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (_state == ActionStatus.init) ...[
            FloatingActionButton(
              child: const Icon(Icons.play_arrow),
              onPressed: () => print('Play'),
            ),
          ],
          if (_state == ActionStatus.progress) ...[
            FloatingActionButton(
              child: const Icon(Icons.pause),
              onPressed: () => print('Pause'),
            ),
            FloatingActionButton(
              child: const Icon(Icons.replay),
              onPressed: () => print('Replay'),
            ),
          ],
          if (_state == ActionStatus.pause) ...[
            FloatingActionButton(
              child: const Icon(Icons.play_arrow),
              onPressed: () => print('Resume'),
            ),
            FloatingActionButton(
              child: const Icon(Icons.replay),
              onPressed: () => print('Reset'),
            ),
          ],
          if (_state == ActionStatus.complete) ...[
            FloatingActionButton(
              child: const Icon(Icons.replay),
              onPressed: () => print('Reset'),
            ),
          ]
        ],
      ),
    );
  }
}
