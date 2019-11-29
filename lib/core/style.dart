// Created By JLA 2019/11/28/time:17:05

import 'package:flutter/material.dart';

class InputDecorators{
  static authBoxes(String labelText){
    return InputDecoration(
        labelStyle: TextStyle(color: Colors.grey),
    errorStyle: TextStyle(color: Colors.red),
    focusColor: Colors.white,
    focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
    borderSide: BorderSide(width: 1, color: Colors.grey),
    ),
    labelText: labelText,
    enabledBorder: const OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.grey, width: 0.0),
    ),
    errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
    borderSide: BorderSide(width: 1, color: Colors.red),
    ),
    );
  }
}

class MyColors{
  static const Color background = Color(0xff262B40);

}

class TextStyles{
  static const TextStyle appBarTitle = TextStyle(
    color: Colors.white,
    fontSize: 32,
    fontWeight: FontWeight.bold,


  ) ;

}