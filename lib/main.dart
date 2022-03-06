import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_web_proj/src/liquid_swipe_page_directory/WithBuilder.dart';
import 'package:flutter_web_proj/src/signup_module/widget/SignUpScreen.dart';


void main() {
  runApp(MyApp());
}





class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WithBuilder(),
      routes: {
        '/signup': (context) => const SignUpScreen(),
        '/welcome': (context) => const WelcomeScreen(),
      },
    );
  }
}



class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Welcome!', style: Theme.of(context).textTheme.headline2),
      ),
    );
  }
}




