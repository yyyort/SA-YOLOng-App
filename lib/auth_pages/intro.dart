import 'package:flutter/material.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(132, 1, 0, 1),
              Color.fromRGBO(204, 179, 59, 1)
            ]),
            image: DecorationImage(
              image: AssetImage("assets/images/splash_logo.png"),
            )),
        child: Center(
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

class AuthButton extends StatelessWidget {
  final String name;

  const AuthButton({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 60,
      width: 300,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30))),
      child: ElevatedButton(
          onPressed: () => {},
          child: Text(
            name,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }
}
