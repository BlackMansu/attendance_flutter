import 'package:flutter/material.dart';

class Navigate {
  static push(BuildContext context, Widget screen) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => screen));
  static back(BuildContext context) => Navigator.of(context).pop();

  static pushandreplace(BuildContext context, Widget screen) =>
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => screen));
  static pushandremoveuntil(BuildContext context, Widget screen) =>
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => screen), (route) => false);
}
