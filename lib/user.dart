import 'package:RatioCalendar/event.dart';

class User {
  String username;
  String slug;
  String email;
  String password;
  List<Event> events;

  User(this.username, this.slug, this.email, this.password);

  User.fromJson(Map<String, dynamic> inJson) {
    this.username = inJson["username"];
    this.slug = inJson["slug"];
    this.email = inJson["email"];
    this.password = inJson["password"];
    this.events = [];
  }

}
