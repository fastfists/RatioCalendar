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
  Expired,
}

class Auth extends ChangeNotifier{

  // Make it a singleton
  static final Auth _singleton = Auth._internal();
  factory Auth() => _singleton;
  Auth._internal();

  User _user;
  String token;
  LoginStatus _status = LoginStatus.Uninitialized;
  
  set status(LoginStatus newStatus) {
    var _status = newStatus;
    notifyListeners();
  }

  LoginStatus get status => _status;

  Future<bool> login(String username, String password) async {
    var jsonBody = {
      "username": username,
      "password": password,
    };
    _status = LoginStatus.Authenticating;
    notifyListeners();

    var req = await http.post("${host}/user/login", body: jsonBody);
    var responseJson = json.decode(req.body);

    if (responseJson["status"] == "success"){
      _user = User.fromJson(responseJson);
      _user.events = await getEvents(_user);
      _status = LoginStatus.Authenticated;
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<List<Event>> getEvents(User user) async {
    var req = await http.get("${host}/user/login");
    var responseJson = json.decode(req.body);

    if (responseJson["status"] == "success"){
      return responseJson["events"];
    }
  }

  Future<bool> logout() {

  }

  Future<User> getUser() {
  }

}
