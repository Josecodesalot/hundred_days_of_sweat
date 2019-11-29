// Created By Jose Ignacio Lara Arandia 2019/09/27/time:20:00

import 'package:meta/meta.dart';

class User{
  String name, email, uid, location;

  User({
    @required this.name,
    @required this.email,
    @required this.uid,
    @required this.location,
  });

  Map toMap(){
    return{
      UserFields.name: name,
      UserFields.email: email,
      UserFields.uid: uid,
      UserFields.location: location,
    };
  }

  static fromMap (userMap){
    return User(
        name: userMap[UserFields.name],
        email: userMap[UserFields.email],
        uid: userMap[UserFields.uid],
        location: userMap[UserFields.location]
    );
  }

  static User empty(){
    return User(name: "", email: "", uid: "", location: "");
  }

  @override
  String toString() {
    return 'User{name: $name, email: $email, uid: $uid, location: $location}';
  }


}


class UserFields{
 static final String name = "name";
 static final String email = "email";
 static final String uid = "uid";
 static final String location = "location";
}

//this will be under mainFields users