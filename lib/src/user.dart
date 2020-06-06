import 'package:RatioCalendar/src/event.dart';

class User {
  String username;
  String slug;
  String email;
  String password;
  List<Event> events;

  User(this.username, this.slug, this.email, this.password);
}
