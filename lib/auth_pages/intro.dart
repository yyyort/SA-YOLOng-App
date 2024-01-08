import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sa_yolo_ng/auth_pages/login.dart';
import 'package:sa_yolo_ng/auth_pages/signup.dart';
import 'package:sa_yolo_ng/page/first.dart';
import 'package:sa_yolo_ng/service/firebase_auth_services.dart';
import 'package:sa_yolo_ng/toast.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(132, 1, 0, 1),
              Color.fromRGBO(204, 179, 59, 1)
            ], begin: Alignment.bottomLeft, end: Alignment.topRight),
            image: DecorationImage(
              image: AssetImage("assets/images/splash_logo.png"),
            )),
        child: const Center(
          child: Column(
            children: [
              SizedBox(
                height: 200,
              ),
              AuthButton(name: "Login"),
              AuthButton(name: "Sign up"),
              AuthButton(name: "Guess Login")
            ],
          ),
        ),
      ),
    );
  }
}

class AuthButton extends StatefulWidget {
  final String name;

  const AuthButton({super.key, required this.name});

  @override
  State<AuthButton> createState() => _AuthButtonState();
}

class _AuthButtonState extends State<AuthButton> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 60,
      width: 300,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10,
            offset: Offset(3, 5),
          ),
        ],
      ),
      child: ElevatedButton(
          onPressed: () {
            switch (widget.name) {
              case "Login":
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Login()));
                break;
              case "Sign up":
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Signup()));
                break;
              case "Guess Login":
                _signInAnonymously();
                break;
            }
          },
          child: Text(
            widget.name,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          )),
    );
  }

  void _signInAnonymously() async {
    User? user = await _auth.signInAnonymously();

    if (user != null) {
      showToast(message: 'Sign in Anonymously success');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const First()));
    } else {
      showToast(message: 'Sign in failed.');
    }
  }
}
