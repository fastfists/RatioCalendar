import 'package:RatioCalendar/screens/Calendar.dart';
import 'package:RatioCalendar/screens/LoginPage.dart';
import 'package:RatioCalendar/services/google.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/auth.dart';

void main() {
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
      ),
      home: HomePage(),
    );
  }
}

class GooglePageSignIn extends StatelessWidget {
  const GooglePageSignIn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: () async {
            await GoogleAuth().singInWtihGoogle();
          },
          child: Container(
              decoration: BoxDecoration(color: Theme.of(context).accentColor),
              padding: EdgeInsets.all(20),
              child: Text("click me to login")),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Auth(),
      child: Consumer<Auth>(builder: (context, Auth auth, _) {
        switch (auth.status) {
          case LoginStatus.Uninitialized:
            return Splash();
          case LoginStatus.Unauthenticated:
          case LoginStatus.Authenticating:
            return LoginPage();
          case LoginStatus.Authenticated:
            return CalendarPage();
        }
      }),
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text("Splash Screen"),
      ),
    );
  }
}
