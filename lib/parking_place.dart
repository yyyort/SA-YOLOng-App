import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class ParkingArea extends ChangeNotifier {
  final String location;
  final int availableSpots;
  final List<dynamic> spots;

  ParkingArea(
      {required this.location,
      required this.availableSpots,
      required this.spots});

  factory ParkingArea.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    Map<String, dynamic> data = doc.data()!;
    return ParkingArea(
        location: data['location']! as String,
        availableSpots: data['available_spots']! as int,
        spots: data['spots']! as List<dynamic>);
  }

  Map<String, dynamic> toFirestore() {
    return {
      'location': location,
      'available_spots': availableSpots,
      'spots': spots,
    };
  }
}
