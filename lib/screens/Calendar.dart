import 'dart:async';

import 'package:RatioCalendar/models/event.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

class CalendarPage extends StatefulWidget {
  CalendarPage({Key key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  Future<List<Event>> _eventFuture;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Event event = Event(
      name: "8th grade staar test with my mom and friends",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Risus sed sed viverra pharetra diam mattis elementum sapien pretium. Nunc, pellentesque at nulla in. Dolor vel enim massa facilisis tristique et diam. Pulvinar cras diam non consequat pulvinar feugiat massa.",
      date: DateTime(2020, 07, 26),
    );
    return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(11, 105, 157, .56),
            ),
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, idx) {
                return EventDetails(event: event);
              }
            ),
          ),
    );
  }

}

class EventDetails extends StatelessWidget {
  final Event event;
  EventDetails({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var normal = TextStyle(fontSize: 10);
    var bold = Theme.of(context).textTheme.headline3;

    return Stack(
      children: <Widget>[
        Container(
              padding: EdgeInsets.all(19),
              margin: EdgeInsets.symmetric(horizontal: 11,vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xFFFFFFFF),
              ),
              child: Row(
                children: <Widget>[
                  Column(
                    children: [
                      Text("${this.event.date.day}", style: bold,),
                      Text("${DateFormat.MMMM().format(this.event.date)}, ${this.event.date.year}"),
                    ],
                  ),
                  SizedBox(width: 42,),
                  Column(
                    children: <Widget>[
                      Text("${this.event.name}", style: normal),
                      SizedBox(height: 5,),
                      CounterWidget(date: event.date),
                    ],
                  ),
                ],
          ),
        ),
        Positioned(
          bottom: 30,
          right: 20,
          child: Icon(Icons.chevron_right),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF97C7E2),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.horizontal(left: Radius.circular(30)),
            ),
            margin: EdgeInsets.symmetric(horizontal: 11,vertical: 20),
            width: 400,
            height: 24,
          )
        ),
      ],
    );
  }
}

class CounterWidget extends StatelessWidget {

  DateTime date;

  CounterWidget({Key key, this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TimerBuilder.periodic(Duration(seconds: 1), 
      builder: (context) {
        double spacing = 20;
        double difference = -DateTime.now().difference(this.date).inMilliseconds.toDouble();
        var _days = (difference / (1000 * 60 * 60 * 24)).floorToDouble();
        var _hours = ((difference % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60)).floorToDouble();
        var _mins = ((difference % (1000 * 60 * 60)) / (1000 * 60)).floorToDouble();
        var _secs = ((difference % (1000 * 60)) / 1000).floorToDouble();
        return Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Text("Days:"),
                Text("${_days.toInt()}"),
              ],
            ),
            SizedBox(width: spacing,),
            Column(
              children: <Widget>[
                Text("Hours:"),
                Text("${_hours.toInt()}"),
              ],
            ),
            SizedBox(width: spacing,),
            Column(
              children: <Widget>[
                Text("Mins:"),
                Text("${_mins.toInt()}"),
              ],
            ),
            SizedBox(width: spacing,),
            Column(
              children: <Widget>[
                Text("Secs:"),
                Text("${_secs.toInt()}"),
              ],
            ),
          ],
        );
      }
    );
  }

}