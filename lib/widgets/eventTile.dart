import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';


class EventTile extends StatelessWidget {
  const EventTile({this.leading, this.title, this.subtitle, this.onTap, Key key}) : super(key:key);

  final leading;
  final title;
  final subtitle;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: leading,
        title: title,
        subtitle: subtitle,
        onTap: onTap
      );
  }
}