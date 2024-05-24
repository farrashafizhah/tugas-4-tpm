import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  final _isHours = true;

  @override
  void dispose() {
    super.dispose();
    _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //_stopWatchTimer.setPresetHoursTime(100);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder<int>(
            stream: _stopWatchTimer.rawTime,
            initialData: _stopWatchTimer.rawTime.value,
            builder: (context, snapshot) {
              final value = snapshot.data;
              final displayTime = StopWatchTimer.getDisplayTime(value!, hours: _isHours);

              return Text(
                displayTime,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                )
              );
            }
          ),
          SizedBox(height: 20),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                resetButton(),
                SizedBox(width: 20),
                startButton(),
                SizedBox(width: 20),
                stopButton(),
              ]
            )
          ),
        ],
      )
    );
  }

  IconButton startButton() {
    return IconButton(
      icon: Icon(Icons.play_arrow),
      iconSize: 30.0,
      onPressed: () {
        _stopWatchTimer.onExecute.add(StopWatchExecute.start);
      },
    );
  }

  IconButton stopButton() {
    return IconButton(
      icon: Icon(Icons.pause),
      iconSize: 30.0,
      onPressed: () {
        _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
      },
    );
  }

  IconButton resetButton() {
    return IconButton(
      icon: Icon(Icons.refresh),
      iconSize: 30.0,
      onPressed: () {
        _stopWatchTimer.onExecute.add(StopWatchExecute.reset);
      },
    );
  }
}
