import 'dart:ffi';

import 'package:RatioCalendar/src/event.dart';
import 'package:RatioCalendar/src/user.dart';
import "dart:convert";
import "dart:io";
import "dart:async";
import 'package:http/http.dart' as http;


class Api {
  String host = "https://ratiocal.herokuapp.com";
  User user;

  String username;
  String password;

  Future<Map<String, dynamic>> _makeRequest(String urlPath, Map sendJson) async {

    Uri uri = Uri.parse(this.host + urlPath);
    String jsonString = json.encode(sendJson);
    Map headers = <String, String>{ HttpHeaders.contentTypeHeader: "application/json" };
    var response = await http.post(uri, headers: headers, body:jsonString);

    // TODO: check response status code and ensure ok request
    print('---- status code: ${response.statusCode}');
    Map<String, dynamic> receiveJson = json.decode(response.body);
    print(receiveJson);

    return receiveJson;
  }

  Future<bool> loginUser() async {
    var json = <String, String>{ "username" : this.username, "password": this.password };
    var reply = await this._makeRequest("/api/user/login",json)

    // cast json to user
    //this.user = (User) reply;
  }


  List<Event> getUserEvents(){

  }

  Api(this.username, this.password);
}
