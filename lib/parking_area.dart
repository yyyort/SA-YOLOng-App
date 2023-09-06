import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class ParkingArea {
  final String location;
  final int availableSpots;
  final List<int> spots;

  ParkingArea(
      {required this.location,
      required this.availableSpots,
      required this.spots});

  ParkingArea.fromJson(Map<String, Object?> json)
      : this(
          location: json['location']! as String,
          availableSpots: json['availableSpots']! as int,
          spots: json['spots']! as List<int>,
        );

  Map<String, Object?> toJson() {
    return {
      'location': location,
      'availableSpots': availableSpots,
      'spots': spots,
    };
  }
}

final parkingAreasRef = FirebaseFirestore.instance
    .collection('parkingAreas')
    .withConverter<ParkingArea>(
      fromFirestore: (snapshot, _) => ParkingArea.fromJson(snapshot.data()!),
      toFirestore: (parkingArea, _) => parkingArea.toJson(),
    );




/* Movie movie42 = await moviesRef.doc('42').get().then((snapshot) => snapshot.data()!); */

/* 
final moviesRef = FirebaseFirestore.instance.collection('movies').withConverter<Movie>(
      fromFirestore: (snapshot, _) => Movie.fromJson(snapshot.data()!),
      toFirestore: (movie, _) => movie.toJson(),
    );
 */