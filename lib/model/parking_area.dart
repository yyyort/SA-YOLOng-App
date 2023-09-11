import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class ParkingArea {
  final String location;
  final int availableSpots;
  final List<dynamic> spots;
  final String img;

  ParkingArea({
    required this.location,
    required this.availableSpots,
    required this.spots,
    required this.img,
  });

  factory ParkingArea.fromFirestore(Map<String, dynamic> json) {
    return ParkingArea(
        location: json['location']! as String,
        availableSpots: json['available_spots']! as int,
        img: json['img']! as String,
        spots: json['spots']! as List<dynamic>);
  }

  Map<String, dynamic> toFirestore() {
    return {
      'location': location,
      'available_spots': availableSpots,
      'spots': spots,
    };
  }
}

/* 
init firestore call into a ParkingArea type
 */
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

final parkingAreaProvider = StreamProvider<ParkingArea>(
  (ref) {
    return FirebaseFirestore.instance
        .collection('parking_area')
        .doc('alumni_hall')
        .snapshots()
        .map((snapshot) => ParkingArea.fromFirestore(snapshot.data()!));
  },
);

final parkingHalls = StreamProvider<List<ParkingArea>>((ref) {
  return FirebaseFirestore.instance
      .collection('parking_area')
      .orderBy('available_spots', descending: true)
      .snapshots()
      .map((event) =>
          event.docs.map((e) => ParkingArea.fromFirestore(e.data())).toList());
});

/* Stream<QuerySnapshot<ParkingArea>> getParkingAreas() {
  final reference = firestore.collection('parking_area').withConverter(
        fromFirestore: (snapshot, _) =>
            ParkingArea.fromFirestore(snapshot.data()!),
        toFirestore: (parkingArea, _) => parkingArea.toFirestore(),
      );

  return reference.snapshots();
} */



/* Stream<QuerySnapshot<User>> getUsers() {
  final reference = db.collection('user').withConverter(
    fromFirestore: User.fromFirestore,
    toFirestore: (User user, _) => user.toFirestore(),
  );

  return reference.snapshots();
} */

/* final moviesRef = FirebaseFirestore.instance.collection('movies').withConverter<Movie>(
      fromFirestore: (snapshot, _) => Movie.fromJson(snapshot.data()!),
      toFirestore: (movie, _) => movie.toJson(),
    ); */
/* final model = firebasefirestore.instance
      .collection('movies')
      .doc()
      .withconverter<movie>(
    fromfirestore: (snapshot, _) => movie.fromjson(snapshot.data()!),
    tofirestore: (movie, _) => movie.tojson(),
  ); */

/* class Movie {
  Movie({required this.title, required this.genre});

  Movie.fromJson(Map<String, Object?> json)
    : this(
        title: json['title']! as String,
        genre: json['genre']! as String,
      );

  final String title;
  final String genre;

  Map<String, Object?> toJson() {
    return {
      'title': title,
      'genre': genre,
    };
  }
}
 */


/* ParkingArea parkingArea =
    ParkingArea(location: 'asdfsdf', availableSpots: 1, spots: [1, 2, 3]);

final querySnapshot = FirebaseFirestore.instance
    .collection('testdata')
    .get()
    .then((QuerySnapshot snapshot) {
  return snapshot.docs.map((e) => e.data()).toList();
});

final parkingSnapshot = FirebaseFirestore.instance
    .collection('parking_area')
    .doc('alumni_hall')
    .snapshots()
    .map((event) => 
      data = event */
    /* print(event.data()) */
/* Movie movie42 = await moviesRef.doc('42').get().then((snapshot) => snapshot.data()!); */

/* 
final moviesRef = FirebaseFirestore.instance.collection('movies').withConverter<Movie>(
      fromFirestore: (snapshot, _) => Movie.fromJson(snapshot.data()!),
      toFirestore: (movie, _) => movie.toJson(),
    );
 */