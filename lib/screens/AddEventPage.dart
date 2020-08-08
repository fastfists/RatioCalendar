import 'package:RatioCalendar/models/event.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AddEventPage extends StatefulWidget {
  AddEventPage({Key key}) : super(key: key);

  @override
  _AddEventPageState createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _title;
  TextEditingController _description;
  DateTime _date;

  DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    _title = TextEditingController(text: "");
    _description = TextEditingController(text: "");
    _date = DateTime.now();
  }

  @override
  void dispose() {
    _title.dispose();
    _description.dispose();
    super.dispose();
  }

  void submitForm(BuildContext context) {
    if (_formKey.currentState.validate()) {

      // Scaffold
      //     .of(context)
      //     .showSnackBar(SnackBar(content: Text('Processing Data')));
        var event = Event(
                name: _title.text,
                description: _description.text,
                date: _date);

        GetIt.I<EventModel>().addEvent(event);
        Navigator.pop(context);
    }
  }

 @override
  Widget build(BuildContext context) {
    double spacing = 20;
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar( title: Text("Create new task")),
      body: Container(
        color: Colors.black26,
        child: Column(
          children: [
            Container(
                height: size.height * 0.2,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Create New Task",
                          style: Theme.of(context).textTheme.headline3),
                    ])),
            Form(
              key: _formKey,
              child: Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFF97E2E2),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      )),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: spacing),
                      TextFormField(
                        controller: _title,
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
                        onDateSelected: (DateTime value) {
                          _date = value;
                        },
                        selectedDate: _date,
                      ),
                      SizedBox(height: spacing),
                      TextFormField(
                        controller: _description,
                        decoration: InputDecoration(
                          hintText: "Description",
                        ),
                        maxLines: 3,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please enter a title";
                          }
                          return null;
                        }
                      ),
                      Spacer(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: FlatButton(
                          onPressed: () => submitForm(context),
                          color: Colors.black26,
                          child: Text("Add Event"),
                        ),
                      ),
                      SizedBox(height: spacing),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
