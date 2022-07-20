import 'package:flutter/material.dart';

var containerDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(12),
  boxShadow: const [
    BoxShadow(
      color: Color.fromARGB(255, 213, 225, 243),
      offset: Offset(
        2.0,
        2.0,
      ),
      blurRadius: 13.0,
      spreadRadius: 0.0,
    ), //BoxShadow
    BoxShadow(
      color: Colors.white,
      offset: Offset(0.0, 0.0),
      blurRadius: 0.0,
      spreadRadius: 0.0,
    ), //BoxShadow
  ],
);

var inputDecoration = InputDecoration(
  // hintText: 'البريد الإلكتروني',
  labelStyle: TextStyle(
    fontSize: 16.0,
    color: Colors.grey[800],
  ),
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.white,
        width: 2.0,
      ),
      borderRadius: BorderRadius.circular(34)),
  focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black54, width: 2.0),
      borderRadius: BorderRadius.circular(34)),
);
