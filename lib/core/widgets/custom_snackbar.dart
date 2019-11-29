// Created By JLA 2019/10/10/time:01:02

import 'package:flutter/material.dart';

class CustomSnackBar{
  CustomSnackBar
      ({
    @required this.message,
    @required this.scaffoldKey,
    this.color,
    this.duration,
    this.icon});
  final String message;
  final Color color;
  final int duration;
  final Icon icon;
  final GlobalKey<ScaffoldState> scaffoldKey;

  show(){
      final Widget snackBar =  SnackBar(content: Text(message),duration: Duration(seconds: duration??4) ,
          backgroundColor: color ?? Colors.red);
      scaffoldKey.currentState.showSnackBar(snackBar);
    }
}
