import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/wellcome.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Wellcome()),
      );
    });
    return Scaffold(
      backgroundColor: Color(0xff53B175),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: .center,
          children: [
            Image.asset(
              'lib/assets/Group 12.png',
              height: 68.61,
              width: 267.42,
            ),
          ],
        ),
      ),
    );
  }
}
