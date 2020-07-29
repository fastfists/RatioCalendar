import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

class AddEventPage extends StatefulWidget {
  AddEventPage({Key key}) : super(key: key);

  @override
  _AddEventPageState createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    double spacing = 20;
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black26,
              ),
              height: size.height * 0.4,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.arrow_back),
                  Text("Create New Task", style: Theme.of(context).textTheme.headline3),
                ]
              )
            ),
            Form(
              child: Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF97E2E2),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    )
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
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
            ),
              ],
      ),
    );
  }
}
