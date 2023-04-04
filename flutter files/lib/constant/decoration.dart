import 'package:flutter/material.dart';

const textFieldDecoration = InputDecoration(
  labelText: '',
  hintText: '',
  // fillColor: Color(0xFF585353),
  // filled: true,
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(30.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 2.5),
    borderRadius: BorderRadius.all(Radius.circular(30.0)),
  ),
);

// 585353
//     InputDecoration(
//     labelText: 'Email', hintText: "johnjackson@example.com"),
// );
