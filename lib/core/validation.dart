// Created By JLA 2019/11/28/time:17:05

import 'package:flutter/cupertino.dart';

class EmailFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Email can\'t be empty' : null;
  }
}

class PasswordFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Password can\'t be empty' : null;
  }
}

class EmptyFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Field can\'t be empty' : null;
  }
}

class FormValidate{
  static bool validate(GlobalKey<FormState> key){
    var formState = key.currentState;
    if(formState.validate()){
      formState.save();
      return true;
    }else{
      return false;
    }
  }
}
