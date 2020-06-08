import 'package:RatioCalendar/api/api.dart';
import 'package:RatioCalendar/event.dart';
import 'package:RatioCalendar/widgets/Calendar.dart';
import 'package:flutter/material.dart';


void main() => runApp(App());

class App extends StatelessWidget {
  // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: HomePage(title: 'Flutter Demo Home Page'),
        );
    }
}

class HomePage extends StatefulWidget {
    HomePage({Key key, this.title}) : super(key: key);
    final String title;


    @override
    HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
    int counter = 0;
    void _incrementCounter() {
        setState(() {
            counter++;
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(widget.title),
            ),
            body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                        Text(
                            'You have pushed the button this many times:',
                        ),
                        Text(
                            '$counter', style: Theme.of(context).textTheme.headline4,
                        ),
                        Text(
                            "I just fucked ur bitch ho",
                            style: Theme.of(context).textTheme.headline4
                        ),
                        CalendarWidget()
                    ],
                ),
            ),
            floatingActionButton: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
            ),
        );
    }
}
