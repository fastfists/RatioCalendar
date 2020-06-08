import 'package:flutter/material.dart';
import 'package:RatioCalendar/api/api.dart';
import 'package:RatioCalendar/event.dart';
import 'package:RatioCalendar/widgets/eventTile.dart';

class CalendarWidget extends StatefulWidget {
  CalendarWidget({Key key}) : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  Future<List<Event>> _eventFuture;

  Future<List<Event>> getEvents() async {
    var user = await Api("fastfist", "fastfist22").loginUser();
    return await Api.getUserEvents(user);
  }

  @override
  void initState() {
    super.initState();
    _eventFuture = getEvents();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
            future: _eventFuture,
            builder: (context, snapshot){
              if (snapshot.connectionState == ConnectionState.done){
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Text("none");
                  case ConnectionState.active:
                  case ConnectionState.waiting:
                    return Text("active and waiting");
                  case ConnectionState.done:
                    print(snapshot.data);
                    return Text("Hell yes ${snapshot.data[0].name} ");
                  default:
                    return Text("default");
                }
              }//TODO: Handle loading widget
            });


}