import 'package:RatioCalendar/api/api.dart';
import 'package:RatioCalendar/user.dart';
import 'package:RatioCalendar/event.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test("Returns a User successfully in Sequence", (){
    Api("fastfist", "fastfist22").loginUser()
    .then((value) {
      expect(value, isA<User>());
    });
    }
  );

  test("Returns a User successfully in Sequence", (){

    List<Event> _events = [];
    Api("fastfist", "fastfist22").loginUser()
        .then((user) {
          print(user);
          if(user != null) Api.getUserEvents(user);
        })
        .then((events) {
          _events = events;
          expect(events, isNotNull);
        })
        .catchError(print);
    
    expect(_events, isNotNull);
  });

  test("Returns a User successfully in Sequence", (){
    List<Event> _events = [];
    Api("fastfist", "fastfist22").loginUser()
        .then((user) {
          print(user);
          if(user != null) Api.getUserEvents(user);
        })
        .then((events) {

          expect(events, isA<List<Event>>());
          expect(events, isNotNull);
        })
        .catchError(print);
    }
  );
}