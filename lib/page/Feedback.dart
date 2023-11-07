import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//cjjjjj
final db = FirebaseFirestore.instance;

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({Key? key}) : super(key: key);
  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class FeedBack extends StatelessWidget {
  const FeedBack({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Feedback',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: content(),
    );
  }

  Widget content() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(132, 1, 0, 1),
          Color.fromRGBO(204, 179, 59, 1)
        ], begin: Alignment.bottomLeft, end: Alignment.topRight),
        image: DecorationImage(
          image: AssetImage('assets/images/Eagle_2.png'),
        ),
      ),
      child: const Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FeedbackForm(),
        ),
      ),
    );
  }
}

class _FeedbackFormState extends State<FeedbackForm> {
  double rating = 0;
  String feedbackText = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RatingBar.builder(
          initialRating: 0,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: false,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            // Handle the selected rating here
            setState(() {
              this.rating = rating;
            });
          },
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            hintText: 'Enter your feedback here',
            fillColor: Colors.white,
            filled: true,
          ),
          maxLines: 4,
          onChanged: (value) {
            // Handle the text changes here
            setState(() {
              feedbackText = value;
            });
          },
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () async => await submitFeedback(),
          child: Text('Submit Feedback'),
        ),
      ],
    );
  }

  Future<void> submitFeedback() async {
    if (rating == 0 || feedbackText.isEmpty) {
      // Handle error: Rating and feedback text are required.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Rating and feedback text are required.'),
        ),
      );
      return;
    }

    final feedback = {
      'rating': rating,
      'feedbackText': feedbackText,
      'timestamp': FieldValue.serverTimestamp(),
    };

    try {
      db.collection('feedback').add(feedback);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Feedback submitted successfully.'),
      ));
    } catch (e) {
      // Handle any errors while submitting feedback.
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to submit feedback. Please try again later.'),
        ),
      );
    }

    /* try {
      await FirebaseFirestore.instance.collection('feedback').add(feedback);
      // Successfully submitted feedback to Firestore.
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Feedback submitted successfully.'),
      ));
    } catch (e) {
      // Handle any errors while submitting feedback.
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to submit feedback. Please try again later.'),
        ),
      );
    } */
  }
}
