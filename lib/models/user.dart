import './event.dart';

class User {
  String username;
  String email;

  List<Event> events;

  User({this.username, this.email });

  User.fromJson(Map<String, dynamic> inJson){
    this.username = inJson["username"];
    this.email = inJson["email"];
  }
}