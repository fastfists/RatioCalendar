import "dart:convert";
import "dart:async";
import 'package:RatioCalendar/models/event.dart';
import 'package:RatioCalendar/models/user.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

String host = "https://ratiocal.herokuapp.com";

  
String value = await storage.read(key: key);

Map<String, String> allValues = await storage.readAll();

await storage.delete(key: key);

await storage.deleteAll();

await storage.write(key: key, value: value);

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
  String statusError;
  final storage = FlutterSecureStorage();

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
    status = LoginStatus.Authenticating;

    var req = await http.post("${host}/api/user/login", body: jsonBody, headers: headers);
    try {
      Map responseJson = json.decode(req.body);
      print(req.body);
      if(req.statusCode != 200){
        status = LoginStatus.Authenticating;
        if ( responseJson.containsValue("error") ){
          statusError = responseJson["error"];
        }
        return false;
      }
      _user = User.fromJson(responseJson);
      status = LoginStatus.Authenticated;
      await storage.write(key: "token", value: _user.password);
      return true;
    }
    catch(e) {
      print(req.body);
      return false;
    }
  }

  Future<bool> _loginFromStorage() async {
    var password = await storage.read(key: "token");

    var headers = {
      "Content-Type": "application/json",
      "Authorization" : password,
    };

    var req = await http.get("${host}/api/user/login");

    try {
      Map responseJson = json.decode(req.body);
      if(req.statusCode != 200){
        return false;
      }
      _user = User.fromJson(responseJson);
      return true;
    }
    catch(e) {
      print(req.body);
      return false;
    }
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
