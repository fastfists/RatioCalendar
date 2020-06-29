import 'package:RatioCalendar/models/event.dart';
import 'package:flutter/material.dart';

class CalendarWidget extends StatefulWidget {
  CalendarWidget({Key key}) : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  Future<List<Event>> _eventFuture;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
          child: FutureBuilder(
          future: _eventFuture,
          builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text("none");
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return Text("active and waiting");
                case ConnectionState.done:
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, idx) {
                      return EventDetails(event:snapshot.data[idx]);
                    }
                  );
                default:
                  return Text("default");
              } //TODO: Handle loading widget
          }),
    );
  }

}

class EventDetails extends StatelessWidget {
  final Event event;
  EventDetails({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var boldFont = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    return Container(
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.only(bottom: 21, left: 17, right: 17),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(0xFFC6C1CE),
          ),
          child: Row(
            children: <Widget>[
              Center(
                child: Column(
                  children: [
                    Text("${this.event.date}"),
                  ],
                )
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("${this.event.date.toString()}."),
                    ]
                  ),
                  Text("${this.event.name}", style: boldFont),
                  Text("${this.event.description}"),
                ],
              ),
            ],
      ),
    );
  }
}
