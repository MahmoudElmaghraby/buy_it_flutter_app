import 'package:but_it_flutter_app/screens/login_screen.dart';
import 'package:but_it_flutter_app/screens/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
      },
    );
  }
}
