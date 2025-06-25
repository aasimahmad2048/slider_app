import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ProgressBarClass());
  }
}

class ProgressBarClass extends StatefulWidget {
  const ProgressBarClass({super.key});

  @override
  State<StatefulWidget> createState() {
    return ProgressBarClassState();
  }
}

class ProgressBarClassState extends State<ProgressBarClass> {
  late bool _loading;
  late double _progressValue;

  @override
  void initState() {
    super.initState();
    _loading = false;
    _progressValue = 0.0;
  }

  void _updateProgress() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) {
      setState(() {
        _progressValue += 0.1;
        // we "finish" downloading here
        if (_progressValue > 1) {
          _loading = false;
          _progressValue = 0;
          t.cancel();
          

          return;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ProgressBar Indicator App")),
      body: Column(
        children: <Widget>[
          Text("this is progress bar"),
          Center(
            child: Container(
              padding: EdgeInsets.all(12),
              child: _loading
                  ? Column(
                      children: <Widget>[
                        LinearProgressIndicator(
                          backgroundColor: Colors.cyan,

                          valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                          value: _progressValue,
                        ),
                        Text(("${(_progressValue * 100).round()}%")),
                      ],
                    )
                  : Text("Press button for downloading"),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            _loading = !_loading;

            _updateProgress();
          });
        },
        tooltip: "Download",
        icon: Icon(Icons.cloud_download),
        label: Text("Download"),
      ),
    );
  }
}
