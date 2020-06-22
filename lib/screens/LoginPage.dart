
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                color: Color(0xFF2C5695),
              ),
            ),
            Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF92C0C2),
                    Colors.white.withAlpha(0),
                  ],
                  stops: [
                    .16,
                    .78
                  ]
                )
              ),
            ),
            Column(
              children: <Widget>[
                SizedBox(height: 200,),
                LoginForm(),
              ],
            ),
          ],
        ),
      ),
    );

  }
}

class LoginForm extends StatefulWidget {
  LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Username"
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter a username";
                  }
                  return null;
                }
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Password"
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter a password";
                  }
                  return null;
                }
              ),
            ],
          ),
        ),
    );
  }
}
