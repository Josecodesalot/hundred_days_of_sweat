import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hundred_days_of_sweat/core/style.dart';
import 'package:hundred_days_of_sweat/features/auth/state/auth_provider.dart';
import 'package:provider/provider.dart';
import 'HomePage.dart';
import 'features/auth/presentation/login_page.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async{
  debugPrint("main called");
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  await Hive.openBox('auth');

  runApp(Providers());
}


class Providers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint("ProviderStep called");

    return  MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthP>.value(value: AuthP()),
      ],
      child: AuthDecider());
  }
}

class AuthDecider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint("AuthDecider called");
    final authP = Provider.of<AuthP>(context);
    
    return FutureBuilder(

      future: authP.checkStatus(),
      builder: (context, asyncSnap) {
        switch(asyncSnap.connectionState){

          case ConnectionState.none:
            return Scaffold(
              body: Center(child: Text("Connection Error"),),
            );
            break;
          case ConnectionState.done:
            return MyMaterialApp();
            break;
          default:
            return Container();
            break;
        }

      });
  }
}




class MyMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authP = Provider.of<AuthP>(context, listen:false);
    final user = authP.user;

    return MaterialApp(
      title: 'Hundred days of sweat',
      theme: ThemeData(
        scaffoldBackgroundColor: MyColors.background,
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(

            title: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32.00,
                color: Colors.white)
          ),
          elevation: 0,
          color: MyColors.background
        ),
          primaryColor:Colors.lightGreen
      ),
      home: user!=null? HomePage(): LoginPage(),
    );
  }
}
