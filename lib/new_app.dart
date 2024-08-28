import 'package:firebase_auth/firebase_auth.dart' ;
import 'package:flutter/material.dart';
import 'package:task/data/auth/app_authentication.dart';
 import 'package:task/main.dart';
import 'package:task/screens/login_screen.dart';


class NewApp extends StatelessWidget {
  const NewApp({super.key});

  @override
  Widget build(BuildContext context) {
    // AppAuthentication.userChangeState(context);

    print('AppAuthentication.isLogin ${AppAuthentication.isLogin}');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.pink,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,

          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.green,
          selectedItemColor: Colors.pink,
          unselectedItemColor: Colors.black,
        ),
      ),

      home: FirebaseAuth.instance.currentUser != null
          ?  MainScreen()
          : const LoginScreen(),
    );
  }
}
