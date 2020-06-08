import 'package:RatioCalendar/event.dart';
import 'package:RatioCalendar/user.dart';
import "dart:convert";
import "dart:io";
import "dart:async";
import 'package:http/http.dart' as http;


class Api {
  static String host = "https://ratiocal.herokuapp.com";

  String username;
  String password;

  static Future<Map<String, dynamic>> _makeRequest(String urlPath,
      Map sendJson) async {
    Uri uri = Uri.parse(host + urlPath);
    String jsonString = json.encode(sendJson);
    Map headers = <String, String>{
      HttpHeaders.contentTypeHeader: "application/json"
    };
    var response = await http.post(uri, headers: headers, body: jsonString);

    // TODO: check response status code and ensure ok request
    print('---- status code: ${response.statusCode}');
    Map<String, dynamic> receiveJson = json.decode(response.body);
    return receiveJson;
  }

  Future<User> loginUser() async {
    var json = <String, String>{
      "username": this.username,
      "password": this.password
    };
    Map<String, dynamic> reply = await _makeRequest(
        "/api/user/login", json);

    // cast json to user
    var usr = User.fromJson(reply);
    return usr;
  }

  static Future<List<Event>> createUserEvent(User user) async {
    var json = <String, String>{
      "slug": user.slug,
      "password": user.password
    };
    var reply = await _makeRequest("/api/events", json);
    List<Event> ret = [];
    for (var eventJson in reply["events"]) {
      ret.add(Event.fromJson(eventJson));
    }

    return ret;
  }

  static Future<List<Event>> getUserEvents(User user) async {
    var json = <String, String>{
      "slug": user.slug,
      "password": user.password
    };
    var reply = await _makeRequest("/api/events", json);
    List<Event> ret = [];

    for (var eventJson in reply["events"]) {
      ret.add(Event.fromJson(eventJson));
    }

    return ret;
  }

  Api(this.username, this.password);
}
