import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class HomePages extends StatelessWidget {
  const HomePages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const StackSearch(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  ParkingAreasSection(),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class StackSearch extends StatelessWidget {
  const StackSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
      width: 300,
      height: 100,
      child: Stack(
        children: [
          Positioned(
              child: SizedBox(
            width: 80,
            height: 80,
            child: Image.asset(
              'assets/images/usa_logo.png',
              height: 80,
              width: 80,
            ),
          )),
          Center(
            child: Container(
              margin: const EdgeInsets.all(10.0),
              height: 30,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black,
                  )),
              child: const TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Find available parking spot',
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 112, 107, 107),
                  ),
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/* 
Parking Area Widget
 */

class ParkingAreaWidget extends StatelessWidget {
  final String location;
  final int availableSpots;
  final String position;
  final String image;

  const ParkingAreaWidget(
      {super.key,
      required this.location,
      required this.availableSpots,
      required this.position,
      required this.image});

  colorPicker(availableSpots) {
    switch (availableSpots) {
      case > 5:
        return Colors.lightGreen;
      case >= 2:
        return Colors.yellowAccent;

      default:
        return Colors.redAccent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          padding: const EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 5,
                  offset: Offset(-4, 6),
                )
              ],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              color: colorPicker(availableSpots) //Colors.green),
              ),
          child: Column(
            children: [
              Image.asset(image),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    location,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    'Available: $availableSpots',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: 80,
                    height: 30,
                    child: FloatingActionButton(
                      onPressed: () {
                        /* Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPages(
                                    loc: location, position: position))); */
                      },
                      backgroundColor: Colors.black,
                      child: const Text('view',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              )
            ],
          ))
    ]);
  }
}

/* 
Parking Areas Widget
*/

class ParkingAreasSection extends StatelessWidget {
  ParkingAreasSection({super.key});

  final Stream<QuerySnapshot> parkingStream =
      FirebaseFirestore.instance.collection('parking_area').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: parkingStream,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Text('no data');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }

          return Column(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;

              //variables
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                  /* childAspectRatio: 1, */
                ),
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return const Row(
                    children: [
                      ParkingAreaWidget(
                        location: 'Dolce Parking',
                        availableSpots: 1,
                        position: 'hori',
                        image: 'assets/images/dolce_parking.png',
                      ),
                    ],
                  );
                },
              );
            }).toList(),
          );
        });
  }
}
