import 'dart:async';
import 'package:rxdart/rxdart.dart';

class Event {
  String name;
  String description;
  DateTime date;

  Event({this.name, this.description, this.date});

  Event.fromJson(Map<String, dynamic> inJson) {
      this.name = inJson["name"];
      this.description = inJson["description"];
      this.date = DateTime.parse(inJson["date"]);
  }
}

class EventModel {

  final _events = BehaviorSubject<List<Event>>.seeded(<Event>[]);

  Stream<List<Event>> get stream => _events.stream;

  void addAllEvents(List<Event> events) {
    var list = _events.value.toList();
    _events.add(list..addAll(events)..toList());
  }

  void addEvent(Event event) {
    var list = _events.value.toList();
    _events.add(list..add(event)..toList());
  }
}
