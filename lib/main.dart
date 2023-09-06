import 'package:flutter/material.dart';
//import 'package:sa_yolo_ng/detail_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sa_yolo_ng/home_page.dart';
import 'package:sa_yolo_ng/home_page_copy.dart';
import 'package:sa_yolo_ng/parking_area.dart';

import 'firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
    /*   */
  }
}
