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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Eagle_2.png'),
          ),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(132, 1, 0, 1),
            Color.fromRGBO(204, 179, 59, 1)
          ], begin: Alignment.bottomLeft, end: Alignment.topRight),
        ),
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            FAQItem('Question 1', 'Answer to Question 1'),
            FAQItem('Question 2', 'Answer to Question 2'),
            // Add more FAQ items as needed
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
