import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class ParkingArea {
  final String location;
  final int availableSpots;
  final List<dynamic> spots;
  final List<dynamic>? spots1;
  final String img;

  ParkingArea({
    required this.location,
    required this.availableSpots,
    required this.spots,
    required this.spots1,
    required this.img,
  });

  factory ParkingArea.fromFirestore(Map<String, dynamic> json) {
    return ParkingArea(
        location: json['location']! as String,
        availableSpots: json['available_spots']! as int,
        img: json['img']! as String,
        spots: json['spots']! as List<dynamic>,
        spots1: json['spots1']! as List<dynamic>? ?? []);
  }

  Map<String, dynamic> toFirestore() {
    return {
      'location': location,
      'available_spots': availableSpots,
      'spots': spots,
      'spots1': spots1
    };
  }
}

/* 
init firestore call into a ParkingArea type
 */

/* all parking place */
final parkingHalls = StreamProvider<List<ParkingArea>>((ref) {
  return FirebaseFirestore.instance
      .collection('parking_area')
      .orderBy('available_spots', descending: true)
      .snapshots()
      .map((event) =>
          event.docs.map((e) => ParkingArea.fromFirestore(e.data())).toList());
});

/* alumni */

StreamProvider<ParkingArea> getParkingAreasStream(String location) {
  return StreamProvider<ParkingArea>((ref) {
    return firestore
        .collection('parking_area')
        .doc(location)
        .snapshots()
        .map((snapshot) => ParkingArea.fromFirestore(snapshot.data()!));
  });
}

final alumniStream1 = StreamProvider<ParkingArea>((ref) {
  return FirebaseFirestore.instance
      .collection('parking_area')
      .doc('alumni_hall_1')
      .snapshots()
      .map((event) => ParkingArea.fromFirestore(event.data()!));
});

/* final AlumniStream1 = getParkingAreasStream('alumni_hall_1'); */



/* 
final parkingModel = FirebaseFirestore.instance
    .collection('parking_area')
    .withConverter<ParkingArea>(
      fromFirestore: (snapshot, _) =>
          ParkingArea.fromFirestore(snapshot.data()!),
      toFirestore: (parkingArea, _) => parkingArea.toFirestore(),
    );

final parkingModelStream = FirebaseFirestore.instance
    .collection('parking_area')
    .doc('alumni_hall')
    .withConverter<ParkingArea>(
      fromFirestore: (snapshot, _) =>
          ParkingArea.fromFirestore(snapshot.data()!),
      toFirestore: (parkingArea, _) => parkingArea.toFirestore(),
    )
    .snapshots();
 */