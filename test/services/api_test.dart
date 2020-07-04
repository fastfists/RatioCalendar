import 'dart:convert';

import 'package:RatioCalendar/models/event.dart';
import 'package:http/http.dart' as http;
import 'package:RatioCalendar/services/auth.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test("Logs in the user properly", () async{

    var auth = Auth();
    bool success = await auth.login("fastfist", "fastfist22");
    expect(success, true);
  });

  test("Gets user events", () async{

    var auth = Auth();

    bool success = await auth.login("fastfist", "fastfist22");
    expect(success, true);

    List<Event> events = await auth.getEvents();
    expect(events, isNot(null));
  });
}