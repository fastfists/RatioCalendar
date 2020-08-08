import 'package:RatioCalendar/screens/Calendar.dart';
import 'package:RatioCalendar/screens/AddEventPage.dart';
import 'package:RatioCalendar/models/event.dart';
// import 'package:RatioCalendar/services/google.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';


void setup() {
  GetIt.I.registerSingleton<EventModel>(EventModel());
}

void main() {
  setup();
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/' : (context) => CalendarPage(),
        '/addPage' : (context) => AddEventPage(),
      },
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Color.fromRGBO(11, 105, 157, .56),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

// class GooglePageSignIn extends StatelessWidget {
//   const GooglePageSignIn({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: MaterialButton(
//           onPressed: () async {
//             await GoogleAuth().singInWtihGoogle();
//           },
//           child: Container(
//               decoration: BoxDecoration(color: Theme.of(context).accentColor),
//               padding: EdgeInsets.all(20),
//               child: Text("click me to login")),
//         ),
//       ),
//     );
//   }
// }
