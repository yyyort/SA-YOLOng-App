import 'package:flutter/material.dart';
//import 'package:sa_yolo_ng/detail_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sa_yolo_ng/detail_page_copy.dart';
import 'package:sa_yolo_ng/home_page.dart';
import 'package:sa_yolo_ng/page/practice.dart';
import 'package:sa_yolo_ng/service/firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  /* print(getParkingAreas().toString()); */

  /*  ParkingArea dolse = await parkingModel
      .doc('dolse_garcia_hall')
      .get()
      .then((value) => value.data()!);

  ParkingArea alumni =
      await parkingModelStream.first.then((value) => value.data()!);

  //a: use .snapshots() instead of .get()
  print(alumni.spots);

  print(dolse.spots); */

/*  Movie movie42 = await moviesRef.doc('42').get().then((snapshot) => snapshot.data()!); */
  runApp(const ProviderScope(child: MyApp()));
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
      home: const Practice(),
    );
    /*   */
  }
}
