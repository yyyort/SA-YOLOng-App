// ignore_for_file: unused_import

import 'package:flutter/material.dart';
//import 'package:sa_yolo_ng/detail_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sa_yolo_ng/page/Homepage.dart';
import 'package:sa_yolo_ng/page/details/alumni1.dart';
import 'package:sa_yolo_ng/page/ref/map_images.dart';
import 'package:sa_yolo_ng/page/ref/whole_map.dart';
import 'package:sa_yolo_ng/service/firebase_options.dart';
import 'package:sa_yolo_ng/page/faq.dart';

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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentPageIndex = 0;

  final List<NavigationDestination> _destinations = const [
    NavigationDestination(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    NavigationDestination(
      icon: Icon(Icons.map_outlined),
      label: 'Map',
    ),
    NavigationDestination(
      icon: Icon(Icons.message_outlined),
      label: 'Faq',
    ),
  ];

  final List<Widget> _pages = [
    //homepage
    const Homepage(),
    const WholeMap(),
    const Faq(),
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/usa_logo.png', height: 40, width: 40),
              const Text(
                'Sa Yolo\'Ng',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          backgroundColor: Colors.white,
        ),
        body: _pages[currentPageIndex],
        bottomNavigationBar: NavigationBar(
          destinations: _destinations,
          selectedIndex: currentPageIndex,
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
        ),
      ),

      //const Homepage(),
    );
    /*   */
  }
}
