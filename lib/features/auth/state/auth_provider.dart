// Created By Jose Ignacio Lara Arandia 2019/09/25/time:22:23

import 'package:flutter/material.dart';
import 'package:hundred_days_of_sweat/core/widgets/custom_snackbar.dart';
import 'package:hundred_days_of_sweat/features/auth/data/auth_data.dart';
import 'package:hundred_days_of_sweat/features/auth/entities/auth_fields_model.dart';
import 'package:hundred_days_of_sweat/features/auth/entities/user_model.dart';

class AuthP extends ChangeNotifier{
  String uid;
  User user;

  checkStatus()async{
    user = await AuthData.checkStatus();
  }

  signIn(AuthFields authFields, GlobalKey<ScaffoldState> scaffoldKey)async{
    try {
      user = await AuthData.signIn(authFields);
      notifyListeners();
    }catch(e){
      CustomSnackBar(
        scaffoldKey: scaffoldKey,
        message: e.toString(),
        duration: 4,
        color: Colors.red,
      ).show();
    }
  }

  signUp(AuthFields authFields, GlobalKey<ScaffoldState> scaffoldKey)async{
    try {
      user = await AuthData.signUp(authFields, user);
      notifyListeners();
    }catch(e){
      CustomSnackBar(
        scaffoldKey: scaffoldKey,
        message: e,
        duration: 4,
        color: Colors.red,
      ).show();
    }
  }

  void signOut() {
    user = null;
    uid = null;
    AuthData.signOut();
    notifyListeners();
  }


}

