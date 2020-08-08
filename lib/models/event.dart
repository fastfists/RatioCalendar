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

  final _events = BehaviorSubject<List<Event>>.seeded(<Event>[
    Event(name: "Fuck them", description: "Right in the Pussy", date: DateTime.now()),
    Event(name: "Fuck them", description: "Right in the Pussy", date: DateTime.now()),
  ]);

  Stream<List<Event>> get stream => _events.stream;

  void addEvent(Event event) {
    var list = _events.value.toList();
    _events.add(list..add(event)..toList());
  }
}
