import "dart:convert";
import "dart:async";
import 'package:RatioCalendar/models/event.dart';
import 'package:RatioCalendar/models/user.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

String host = "https://ratiocal.herokuapp.com";

enum LoginStatus {
  Authenticated,
  Authenticating,
  Unauthenticated,
  Uninitialized,
}

class Auth extends ChangeNotifier{

  // Make it a singleton
  static final Auth _singleton = Auth._internal();
  factory Auth() => _singleton;
  Auth._internal();

  User _user = null;
  String token;
  LoginStatus _status = LoginStatus.Unauthenticated;
  
  set status(LoginStatus newStatus) {
    var _status = newStatus;
    notifyListeners();
  }

  LoginStatus get status => _status;

  Future<bool> login(String username, String password) async {
    var jsonBody = json.encode({
      "username": username,
      "password": password,
    });
    var headers = {
      "Content-Type": "application/json",
    };
    _status = LoginStatus.Authenticating;
    notifyListeners();

    var req = await http.post("${host}/api/user/login", body: jsonBody, headers: headers);
    try {
      var responseJson = json.decode(req.body);
      print(req.body);
      if(req.statusCode != 200){
        return false;
      }
      _user = User.fromJson(responseJson);
      _status = LoginStatus.Authenticated;
      notifyListeners();
      return true;
    }
    catch(e) {
      print(req.body);
      return false;
    }
    return false;
  }

  Future<List<Event>> getEvents() async {
    if (_user == null) {
      throw Error;
    }
    if (_user.events != null){
      return _user.events;
    }

    var headers = {
      "Authorization" : _user.password,
    };

    var req = await http.get("${host}/api/events", headers: headers);
    var responseJson = json.decode(req.body);

    if (req.statusCode == 200){
      var events = <Event>[];
      responseJson["events"].forEach((element) {
        events.add(Event.fromJson(element));
      });
      
      _user.events = events;
      print(events);
      return events;
    }
  }

  Future<bool> logout() {

  }

  User getUser() {
    if (_user != null) {
      throw Error;
    }
    return _user;
  }

}
