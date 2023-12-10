import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:sa_yolo_ng/page/Homepage.dart';
import 'package:sa_yolo_ng/page/first.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(204, 179, 59, 1),
            Color.fromRGBO(132, 1, 0, 1)
          ]),
        ),
        child: AnimatedSplashScreen(
          splash: Image.asset('assets/images/ss_logo.png', height: 200),
          nextScreen: const First(),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}
