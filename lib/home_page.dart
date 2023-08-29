import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sa_yolo_ng/detail_page.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          StackSearch(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  HallContainer(parkingArea: 'ParkingPlace'),
                  SizedBox(
                    height: 30,
                  ),
                  //HallContainer(),
                ],
              ),
              Column(
                children: [
                  //HallContainer(),
                  SizedBox(
                    height: 30,
                  ),
                  HallContainer(
                    parkingArea: 'alumni_hall',
                  ),
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
      margin: const EdgeInsets.only(top: 20, bottom: 0, left: 20, right: 20),
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
          Positioned(
            left: 10,
            top: 30,
            child: Container(
              alignment: Alignment.center,
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

class HallContainer extends StatelessWidget {
  final String parkingArea;

  const HallContainer({super.key, required this.parkingArea});

  parkingBuild(parkingArea) {
    Stream<QuerySnapshot> parkingStream =
        FirebaseFirestore.instance.collection(parkingArea).snapshots();

    return parkingStream;
  }

/*   final Stream<QuerySnapshot> _parkingStream =
      FirebaseFirestore.instance.collection('ParkingPlace').snapshots(); */

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: parkingBuild(parkingArea),
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
              String location = data['location'];
              int availableSpots = data['available_spots'];

              return Container(
                padding: const EdgeInsets.only(bottom: 15),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  color: Color(0xFF9EEC83),
                ),
                child: Column(
                  children: [
                    Image.asset('assets/images/dolce_hall.png'),
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                          title: location,
                                          availableSpots: availableSpots,
                                        )),
                              );
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
                ),
              );
            }).toList(),
          );
        });
  }
}
