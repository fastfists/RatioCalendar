
class Event {
  String name;
  String description;
  DateTime date;

  Event(this.name, this.description, this.date);

  Event.fromJson(Map<String, dynamic> inJson) {
      this.name = inJson["name"];
      this.description = inJson["description"];
      this.date = DateTime.parse(inJson["date"]);
  }
}
