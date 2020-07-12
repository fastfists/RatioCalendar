import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

class AddEventView extends StatefulWidget {
  AddEventView({Key key, this.controller}) : super(key: key);
  Animation controller;

  @override
  _AddEventViewState createState() => _AddEventViewState();
}

class _AddEventViewState extends State<AddEventView> {
  DateTime selectedDate;
  Animation _animation;

  @override
  void initState() { 
    super.initState();
    _animation = CurvedAnimation(
      parent: widget.controller,
      curve: Curves.elasticOut,
    );

  }

  @override
  Widget build(BuildContext context) {
    double spacing = 20;

    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, snapshot) {
        var scaleX = _animation.value;
        var scaleY = _animation.value;
        
        var size = MediaQuery.of(context).size;

        return Transform(
            alignment: FractionalOffset.bottomCenter, 
            transform: Matrix4.identity()
              ..scale(scaleX, scaleY),
            child: Container(
              height: size.height * 0.75,
              color: Color(0xFF97E2E2),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: spacing),
                    Text(
                      "Add Event",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30
                      ),
                    ),
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
    );
  }

}
