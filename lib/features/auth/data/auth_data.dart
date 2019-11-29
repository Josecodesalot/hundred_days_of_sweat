// Created By Jose Ignacio Lara Arandia 2019/09/27/time:00:58


import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hundred_days_of_sweat/core/const.dart';
import 'package:hundred_days_of_sweat/features/auth/entities/auth_fields_model.dart';
import 'package:hundred_days_of_sweat/features/auth/entities/user_model.dart';

class AuthData {
  static final FirebaseAuth auth = FirebaseAuth.instance;
  static final DatabaseReference db = FirebaseDatabase.instance.reference();

  static Future<User> checkStatus() async{
    FirebaseUser user = await auth.currentUser();
    String  uid = user.uid;

    if(uid!=null){
      Map userMap = await getUser(uid);
      if(userMap.isNotEmpty)

        return User.fromMap(userMap);
    }
    return null;
  }

  static signIn(AuthFields authFields) async{
    try {
      AuthResult result = await auth
          .signInWithEmailAndPassword(
          email: authFields.email,
          password: authFields.password
      );
      var uid = result.user.uid;
      if(uid!=null){
        Map userMap =  await getUser(uid);
        if(userMap.isNotEmpty){
          return User.fromMap(userMap);
        }else{
          throw "Error singing in";
        }
      }
    } catch (e){
      throw e.runtimeType==String? e: e.message.toString();
    }
  }

  static signUp(AuthFields authFields, User user) async{
    assert(user.name!="");
    assert(user.email!="");

    try {
      AuthResult result = await auth
          .createUserWithEmailAndPassword(
          email: authFields.email,
          password: authFields.password
      );
      var uid = result.user.uid;
      if(uid!=null){
        user.uid=uid;
        await addUserToDatabase(user);
        Map userMap = await getUser(uid);
        if(userMap.isNotEmpty){
          return User.fromMap(userMap);
        }else{
          deleteUser();
          throw "Error adding user to database. please try again";
        }
      }
    } catch (d){
      throw d.runtimeType==String? d: d.message;
    }
  }

  static deleteUser()async{
    FirebaseUser user = await auth.currentUser();
    user.delete();
  }
  static Future signOut()async{
    await auth.signOut();
  }

  static getUser(String uid) async{
    DataSnapshot ds = await db.child(MainFields.users).child(uid).once();
    if(ds.value!=null){
      debugPrint("value not null");
      return Map.from(ds.value);
    }else{
      return{};
    }
  }

  static Future<void> addUserToDatabase(User user) async{
    assert(user.uid!=null);
    assert(user.uid.isNotEmpty);

    db.child(MainFields.users).child(user.uid).set(user.toMap());
  }

}