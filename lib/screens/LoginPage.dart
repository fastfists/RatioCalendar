import 'package:RatioCalendar/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

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
                  ])),
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  height: 200,
                ),
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
  LoginStatus status;
  LoginForm({Key key, this.status}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _username;
  TextEditingController _password;

  @override
  void initState() {
    _username = TextEditingController(text: "");
    _password = TextEditingController(text: "");
    super.initState();
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  submitForm() async {
    var authentication = Provider.of<Auth>(context, listen: false);
    if (!await authentication.login(_username.text, _password.text)) {
      print("someting bad happend");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextFormField(
                controller: _username,
                decoration: InputDecoration(
                  hintText: "Username",
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Color(0x9AC4C4C4),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter a username";
                  }
                  return null;
                }),
            SizedBox(
              height: 10,
            ),
            TextFormField(
                controller: _password,
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Color(0x9AC4C4C4),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter a password";
                  }
                  return null;
                }),
            SizedBox(
              height: 30,
            ),
            Consumer<Auth>(builder: (context, auth, _) {
              return Column(
                children: <Widget>[
                  if (auth.status == LoginStatus.Authenticating)
                    CircularProgressIndicator(),
                  if (auth.status == LoginStatus.Unauthenticated)
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 4,
                              offset: Offset(0, 6),
                              color: Color.fromRGBO(0, 0, 0, .25)),
                        ],
                      ),
                      child: FlatButton(
                        onPressed: () async {
                          await submitForm();
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                    )
                ],
              );
            }),
          ],
        ),
      ),
    );
  }

}
