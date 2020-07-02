
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({Key key}) : super(key: key);

  @override
  _AddEventPageState createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {

  DateTime selectedDate;

  @override
  Widget build(BuildContext context) {

    var decor = TextFormField(
      decoration: InputDecoration(
        hintText: "Username"
      ),
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter a username";
        }
        return null;
      }
    );
    
    return Scaffold(
      appBar: AppBar(
        title: Text("hi"),
        ),
      body: Form(
        child: Container(
          width: 500,
          color: Color(0xFF97E2E2),
          child: Column(
            children: <Widget>[
              Text("smd you bitch"),
              Row(children: <Widget>[Text("Event Name"), ],),
              Row(children: <Widget>[Text("Date"), ]),
              Row(children: <Widget>[Text("Description"), ],),
            ],
          ),
        ),
      ),
    );
  }
}