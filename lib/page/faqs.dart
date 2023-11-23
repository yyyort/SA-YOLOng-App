import 'package:flutter/material.dart';

class FAQsApp extends StatelessWidget {
  const FAQsApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Disable the debug banner
      home: FAQsPage(),
    );
  }
}

class FAQsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'FAQs',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Eagle_2.png'),
          ),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(132, 1, 0, 1),
            Color.fromRGBO(204, 179, 59, 1)
          ], begin: Alignment.bottomLeft, end: Alignment.topRight),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            FAQItem('How to use the Application',
                'If you want to access the parking spot:\n \n1. Go to Home Page, you can see the Available Parking spots in each different halls or you can use search to check your desired Building hall,\n \n2. After picking the building hall you want click View to check the spots available,\n \n3. You can find the location provided by the map under the parking spots and a carousel of pictures.\n \n4. You also view whole map under the Map options in the Navbar'),
            FAQItem('Color Coding of Halls in the Home Page',
                'The color coding represents the available Parking Spots in that Hall,\n \nGreen = 3 or more parking spots available, \nYellow = 2 parking spots available, \nRed = 0 parking spot available or fully occupied'),
            FAQItem(
                'Color Coding of Parking spot availability inside the View Page',
                'Green = a parking spot is available, \nRed = a parking spot is occupied, is represented by a car inside'),
            FAQItem(' Does the application reflects real time data?',
                'Yes, the application reflects real time data as long as you are connected into the internet'),
          ],
        ),
      ),
    );
  }
}

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  FAQItem(this.question, this.answer);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ExpansionTile(
        title: Text(question),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(answer),
          ),
        ],
      ),
    );
  }
}
