
import 'package:RatioCalendar/src/event.dart';
import 'package:RatioCalendar/src/user.dart';
import "dart:convert";
import "dart:io";
import "dart:async";


class Api {
  String url = "https://ratiocal.herokuapp.com";
  User user;

  String username;
  String password;

  Future<String> _makeRequest(Map sendJson) async {
    HttpClient client = new HttpClient();
    HttpClientRequest request = await client.postUrl(Uri.parse(this.url));
    request.headers.set("content-type", "application/json");
    request.add(utf8.encode(json.encode(sendJson)));
    HttpClientResponse response= await request.close();
    // TODO: check response status code and ensure ok request
    String reply = await response.transform(utf8.decoder).join();
    client.close();

    return reply;
  }


  bool loginUser() {

    var json = { "slug" : this.username, "password": this.password };
    this.user = user;
    String reply;
    this._makeRequest(json)
        .then((value) => reply = value)
        .catchError((e) {
          print(e.error);
          return 42;
        });
    print(reply);
  }


  List<Event> getUserEvents(){

  }

  Api(this.username, this.password);
}
