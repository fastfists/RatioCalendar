import 'package:RatioCalendar/screens/SplashScreen/splash.dart';
// import 'package:RatioCalendar/services/google.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/Calendar.dart';
import 'screens/LoginPage.dart';
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
        backgroundColor: Color.fromRGBO(11, 105, 157, .56),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
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

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Auth(),
      child: Consumer<Auth>(builder: (context, Auth auth, _) {
        switch (auth.status) {
          case LoginStatus.Uninitialized:
          case LoginStatus.Unauthenticated:
          case LoginStatus.Authenticating:
            return LoginPage();
            break;
          case LoginStatus.Authenticated:
            return CalendarPage();
        }
      }),
    );
  }
}

