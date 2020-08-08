import "dart:convert";
import "dart:async";
import 'package:RatioCalendar/models/event.dart';
import 'package:RatioCalendar/models/user.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

String host = "https://ratiocal.herokuapp.com";

  
// String value = await storage.read(key: key);

// Map<String, String> allValues = await storage.readAll();

// await storage.delete(key: key);

// await storage.deleteAll();

// await storage.write(key: key, value: value);

enum LoginStatus {
  Authenticated,
  Authenticating,
  Unauthenticated,
  Uninitialized,
}

class AuthModel {

  String _token;

  // TODO: Does this cancel on Error????
  final statusBehavior = BehaviorSubject<LoginStatus>.seeded(
    LoginStatus.Unauthenticated
  );
  final user = BehaviorSubject<User>();

  Stream<LoginStatus> get statusStream => statusBehavior.stream; 
  LoginStatus get status => statusBehavior.stream.value; 

  Stream<User> get userStream => user.stream;

  AuthModel() {
    statusStream
        .where( (status) => status == LoginStatus.Authenticated)
        .listen((status) async {
          await getEvents();
        });
  }

  Future<bool> login(String username, String password) async {
    var jsonBody = json.encode({
      "username": username,
      "password": password,
    });
    var headers = {
      "Content-Type": "application/json",
    };

    statusBehavior.add(LoginStatus.Authenticating);

    var req = await http.post("$host/api/user/login", body: jsonBody, headers: headers);
    try {
      Map responseJson = json.decode(req.body);
      print(req.body);
      if(req.statusCode != 200){
        statusBehavior.add(LoginStatus.Authenticating);
        if ( responseJson.containsValue("error") ){
          statusBehavior.addError(responseJson["error"]);
        }
        return false;
      }
      user.add(User.fromJson(responseJson));
      statusBehavior.add(LoginStatus.Authenticated);
      // await storage.write(key: "token", value: _user.password);
      return true;
    }
    catch(e) {
      print(req.body);
      return false;
    }
  }

  // Future<bool> _loginFromStorage() async {
  //   var password = await storage.read(key: "token");

  //   var headers = {
  //     "Content-Type": "application/json",
  //     "Authorization" : password,
  //   };

  //   var req = await http.get("${host}/api/user/login");

  //   try {
  //     Map responseJson = json.decode(req.body);
  //     if(req.statusCode != 200){
  //       return false;
  //     }
  //     _user = User.fromJson(responseJson);
  //     return true;
  //   }
  //   catch(e) {
  //     print(req.body);
  //     return false;
  //   }
  // }

  getEvents() async {

    var headers = {
      "Authorization" : user.stream.value.password,
    };

    var req = await http.get("$host/api/events", headers: headers);
    var responseJson = json.decode(req.body);

    if (req.statusCode == 200){
      var events = <Event>[];
      responseJson["events"].forEach((element) {
        events.add(Event.fromJson(element));
      });

      GetIt.I<EventModel>().addAllEvents(events);
      
      print(events);
      return events;
    }
  }

  // Future<bool> logout() {

  // }

  // User getUser() {
  //   if (_user == null) {
  //     throw Error;
  //   }
  //   return _user;
  // }

}
