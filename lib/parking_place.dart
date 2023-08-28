/* import 'package:cloud_firestore/cloud_firestore.dart';
 */
/* 
build a parking class that represent the parking place
data
  location
  total_available
  spots []
  orientation
  img []
  id // for routing
*/

//q: how to make a class
//a: https://dart.dev/guides/language/language-tour#classes
class ParkingPlace {
  final String location;
  final int totalAvailable;
  final List<num> spots;
  final String orientation;
  final List<String> img;
  final String id;

  ParkingPlace(this.location, this.totalAvailable, this.spots, this.orientation,
      this.img, this.id);
}

/* 
https://firebase.flutter.dev/docs/firestore/usage#realtime-changes
FirebaseFirestore.instance
    .collection('users')
    .get()
    .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
            print(doc["first_name"]);
        });
    });

 */

/* final dolse = FirebaseFirestore.instance
    .collection('parking_places')
    .get()
    .then((QuerySnapshot querySnapshot) {
  for (var doc in querySnapshot.docs) {
    print(doc["location"]);
  }
});
 */