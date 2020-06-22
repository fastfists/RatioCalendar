import 'dart:async';

import 'package:flutter/material.dart';

class TimeWidget extends StatefulWidget {
  final DateTime date;

  TimeWidget({this. date, Key key}) : super(key: key);

  @override
  _TimeWidgetState createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget>{
  double maxWidth = 100;
  double ratio = 0.5;


  void updateTimer() {
    setState(() {
      int num = DateTime.now().difference( widget.date ).inSeconds;
    });
  }

  @override
  void initState() { 
    super.initState();
    Timer(
      Duration(seconds: 1),
      () => updateTimer(),
    );
  }

  
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
            child:Stack(
              alignment: Alignment.centerLeft,
              children: <Widget> [
                // holder of the thingggy
                Container(
                  width: maxWidth,
                  height: 20,
                  decoration: BoxDecoration(color: Colors.white),
                ),
                Container(
                  width: maxWidth * ratio,
                  height: 20,
                  decoration: BoxDecoration(color: Colors.red),
                ),
              ],
            ),
          );
  }
}