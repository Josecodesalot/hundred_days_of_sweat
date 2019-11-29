import 'package:flutter/material.dart';
import 'package:hundred_days_of_sweat/core/images.dart';
import 'package:hundred_days_of_sweat/core/style.dart';
import 'package:hundred_days_of_sweat/core/validation.dart';
import 'package:hundred_days_of_sweat/features/auth/entities/auth_fields_model.dart';
import 'package:hundred_days_of_sweat/features/auth/state/auth_provider.dart';
import 'package:hundred_days_of_sweat/features/auth/presentation/sign_up_page.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  static const String tag= "class=LoginPage";
  final loginFormKey = GlobalKey<FormState>();
  final loginScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    print("$tag built");
    final authP =Provider.of<AuthP>(context, listen: false);
    var authFields = AuthFields();

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Images.authBackgroundPath),
          fit: BoxFit.cover,
        ),),
      child: Scaffold(
        key: loginScaffoldKey,
        backgroundColor: Colors.transparent,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(

          onPressed: (){
            if(FormValidate.validate(loginFormKey)){
              authP.signIn(authFields, loginScaffoldKey);
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
                              onSaved: (String value) => authFields.email = value,
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
                            margin: const EdgeInsets.only(top: 16.00),
                            alignment: Alignment.center,
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context, MaterialPageRoute(
                                      builder: (context) => SignUpPage()));
                                },
                                child: Text("No account? tap here to create one",
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




