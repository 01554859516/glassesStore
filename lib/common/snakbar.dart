import 'package:flutter/material.dart';

ShowSnakBar(BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Color.fromARGB(255, 210, 7, 255),
    duration: Duration(seconds: 2),
    content: Text(text),
    // action: SnackBarAction(label: "close", onPressed:(){}),
  ));
}
