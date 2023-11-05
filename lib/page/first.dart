import 'package:flutter/material.dart';
import 'package:sa_yolo_ng/page/Homepage.dart';
import 'package:sa_yolo_ng/page/Feedback.dart';
import 'package:sa_yolo_ng/page/ref/whole_map.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
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
    const FeedBack(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
