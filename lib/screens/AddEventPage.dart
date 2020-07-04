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
    double spacing = 20;
    return Scaffold(
      appBar: AppBar(
        title: Text("hi"),
      ),
      body: Container(
        width: 500,
        color: Color(0xFF97E2E2),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          child: Column(
            children: <Widget>[
              Text("smd you bitch"),
              SizedBox(height: spacing),
              TextFormField(
                  decoration: InputDecoration(
                    hintText: "Title",
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please enter a title";
                    }
                    return null;
                  }),
              SizedBox(height: spacing),
              DateField(
                onDateSelected: (DateTime value) {  },
                selectedDate: DateTime.now(),
                ),
              SizedBox(height: spacing),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Description",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
