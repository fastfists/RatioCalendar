import "dart:convert";
import "dart:io";
import "dart:async";
import 'package:http/http.dart' as http;

String host = "https://ratiocal.herokuapp.com";

bool loginUser(){
  // logins a user, returns true if worked.
