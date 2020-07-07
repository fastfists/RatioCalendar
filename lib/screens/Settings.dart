import 'package:RatioCalendar/models/user.dart';
import 'package:RatioCalendar/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Auth>(
      builder: (context, auth, _) {
        User user = auth.getUser();
        return Container(
        );
      }
    );
  }
}