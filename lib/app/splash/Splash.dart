import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sistema_para_psicologos/app/home/Home.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  void startTime() {
    new Timer(Duration(seconds: 2), navigatePage);
  }

  void navigatePage(){
    Navigator.pushReplacementNamed(context, 'login');  
  }

  @override
  void initState() {
    super.initState();
    this.startTime();
  }

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/images/psicologia128px.png"),
              fit: BoxFit.none,
            ),
          ),
        ) 
      ),
    );
  }
}