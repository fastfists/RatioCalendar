import 'dart:async';
import 'dart:math';

import 'package:RatioCalendar/clips.dart';
import 'package:RatioCalendar/models/event.dart';
import 'package:RatioCalendar/screens/AddEventPage.dart';
import 'package:RatioCalendar/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:timer_builder/timer_builder.dart';

import 'Settings.dart';

class CalendarPage extends StatefulWidget {
  CalendarPage({Key key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {

  var _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void onItemTap(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var bottomBarWidgets = [
      CalendarView(),
      SettingsView(),
    ];
    return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: onItemTap,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today),
                title: Text('Calendar'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                title: Text('Settings'),
              ),
            ],
            selectedItemColor: Colors.white,
            backgroundColor: Color(0xFF97E2E2),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => AddEventPage()
                ),
              );
            },
            backgroundColor: Colors.blue[200],
            foregroundColor: Colors.white, 
            child:Icon(Icons.add),
            ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          body: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(11, 105, 157, .56),
            ),
            child: bottomBarWidgets[_selectedIndex],
          ),
    );
  }

}

class CalendarView extends StatelessWidget {
  const CalendarView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Auth>(
      builder: (BuildContext context, Auth value, Widget child) { 
        return FutureBuilder(
          future: value.getEvents(),
          builder: (BuildContext context, AsyncSnapshot<List<Event>> snapshot) { 
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text("null");
                break;
              case ConnectionState.waiting:
                return Text("waiting");
              case ConnectionState.active:
                return Text("active");
              case ConnectionState.done:
                print(snapshot.data.length.toDouble());
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, idx) {
                    return EventDetails(event:snapshot.data[idx] );
                  }
                );
            }
          },
        );
      },
    );
  }
}

class EventDetails extends StatefulWidget {
  final Event event;
  EventDetails({Key key, this.event}) : super(key: key);

  @override
  _EventDetailsState createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> 
    with SingleTickerProviderStateMixin{

  bool flipped = false;
  AnimationController _controller; 

  @override
  void initState() {
    _controller = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    _controller.addStatusListener((status) {
      print(status);
      if(status == AnimationStatus.completed) {
        setState(() {
          flipped = true;
        });
      }else if (status == AnimationStatus.dismissed){
        setState(() {
          flipped = false;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        var side = (_controller.value > 0.5)? backSide(context): frontSide(context);
        return Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.002)
              ..rotateX(pi*_controller.value),
              child: GestureDetector(
                onTap: (){
                  if (flipped) {
                    _controller.reverse();
                  } else {
                    _controller.forward();
                  }
                },
                child: Container(
                    child: side,
                    width: 500,
                    height: 190,
                  ),
              )
        );
      }
    );
  }

  @override
  Widget backSide(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.002)
        ..rotateX(pi),
      alignment: FractionalOffset.center,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, .25),
                offset: Offset(0,4),
                blurRadius: 4,
              )
            ],
          ),
          padding: EdgeInsets.all(19),
          margin: EdgeInsets.symmetric(horizontal: 11,vertical: 20),  
          child: Text(widget.event.description),    
      ),
    );
  }

  @override
  Widget frontSide(BuildContext context) {
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
                      SizedBox(height:20),
                      Text("${this.widget.event.date.day}", style: bold,),
                      Text("${DateFormat.MMM().format(this.widget.event.date)}, ${this.widget.event.date.year}"),
                    ],
                  ),
                  SizedBox(width: 42,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height:25),
                        Text("${this.widget.event.name}", style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.black, fontSize: 20)),
                        Spacer(),
                        CounterWidget(date: widget.event.date),
                      ],
                    ),
                  ),
                ],
          ),
        ),
        // Positioned(
        //   bottom: 30,
        //   right: 20,
        //   child: Icon(Icons.chevron_right),
        // ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: ClipPath(
            clipper: SemiCircleClipper(),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF97E2D0),
              ),
              margin: EdgeInsets.symmetric(horizontal: 11,vertical: 20),
              width: double.infinity,
              height: 30,
            ),
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
