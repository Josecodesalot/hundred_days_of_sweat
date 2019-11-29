import 'package:flutter/material.dart';
import 'package:hundred_days_of_sweat/core/images.dart';
import 'package:hundred_days_of_sweat/core/style.dart';
import 'package:hundred_days_of_sweat/core/validation.dart';
import 'package:hundred_days_of_sweat/features/auth/entities/auth_fields_model.dart';
import 'package:hundred_days_of_sweat/features/auth/entities/user_model.dart';
import 'package:hundred_days_of_sweat/features/auth/presentation/login_page.dart';
import 'package:hundred_days_of_sweat/features/auth/state/auth_provider.dart';
import 'package:hundred_days_of_sweat/features/auth/data/auth_data.dart';
import 'package:provider/provider.dart';


class SignUpPage extends StatelessWidget {
  static const String tag= "class=SignUpPage";
  final GlobalKey<FormState> loginFormKey = GlobalKey();
  final GlobalKey<ScaffoldState> signUpScaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    debugPrint("$tag built");
    final authP =Provider.of<AuthP>(context, listen: false);
    var authFields = AuthFields();
    authP.user = User.empty();

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Images.authBackgroundPath),
          fit: BoxFit.fitHeight,
        ),),
      child: Scaffold(
        key: signUpScaffoldKey,
        backgroundColor: Colors.transparent,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(

          onPressed: (){
            if(FormValidate.validate(loginFormKey)){
              authP.signUp(authFields, signUpScaffoldKey);
            }
          },

          backgroundColor: Colors.transparent,
          child: Column(
            children: <Widget>[
              Icon(Icons.send, color: Colors.white,),
              Text("Login",style: TextStyle(color: Colors.white),)
            ],
          ),
          tooltip: "Click to Login",
          focusColor: Colors.transparent,
        ),
        body:
        Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height/8,
            ),
            Container(
                alignment: Alignment.center,
                child: Text("100 days", style: TextStyle(color: Colors.white,fontSize: 36),)),

            SizedBox(
              height: MediaQuery.of(context).size.height/8,
            ),
            Container(
                alignment: Alignment.bottomCenter,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    child: Form(
                      key: loginFormKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[

                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 8.00, horizontal: 16.00),
                            child: TextFormField(
                              key: const Key('email'),
                              style: TextStyle(color: Colors.white),
                              cursorColor: Colors.white,
                              decoration: InputDecorators.authBoxes("email"),
                              validator: EmailFieldValidator.validate,
                              onSaved: (String value) {
                                authFields.email = value;
                                authP.user.email = value;

                                },
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 8.00, horizontal: 16.00),
                            child: TextFormField(
                              obscureText: true,
                              key: const Key('password'),
                              style: const TextStyle(color: Colors.white,),
                              cursorColor: Colors.white,
                              decoration: InputDecorators.authBoxes("password"),
                              validator: PasswordFieldValidator.validate,
                              onSaved: (String value) => authFields.password = value,
                            ),
                          ),

                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 8.00, horizontal: 16.00),
                            child: TextFormField(
                              key: const Key('name'),
                              style: const TextStyle(color: Colors.white,),
                              cursorColor: Colors.white,
                              decoration: InputDecorators.authBoxes("name"),
                              validator: EmptyFieldValidator.validate,
                              onSaved: (String value) {
                                authP.user.name = value;
                                },
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(top: 16.00),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text("back to login page",
                                  style: TextStyle(color: Colors.white),)),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
            Spacer(),
          ],
        ),
      ),
    );
  }
}




