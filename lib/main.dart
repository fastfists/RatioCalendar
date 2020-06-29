import 'package:RatioCalendar/screens/Calendar.dart';
import 'package:RatioCalendar/service_locator.dart';
import 'package:RatioCalendar/screens/LoginPage.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                inputDecorationTheme: InputDecorationTheme(
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Color(0x9AC4C4C4),
                ),
            ),
            home: LoginPage(),
        );
    }
}

