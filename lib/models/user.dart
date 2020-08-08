import 'package:flutter/widgets.dart';

import './event.dart';

class User {
  String username;
  String slug;
  String email;
  String password;

  setJsonInfo(Map<String, dynamic> inJson){
    this.username = inJson["username"];
    this.email = inJson["email"];
    this.slug = inJson["slug"];
    this.password = inJson["password"];
  }

  User({this.username, this.email});

  User.fromJson(Map<String, dynamic> inJson){
    this.username = inJson["username"];
    this.email = inJson["email"];
    this.slug = inJson["slug"];
    this.password = inJson["password"];
  }
}
