import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class DetailPages extends StatelessWidget {
  final String loc;
  final String position;
  const DetailPages({
    super.key,
    required this.loc,
    required this.position,
  });

  final _image = 'assets/images/dolce_parking.png';

  parkingBuild(loc) {
    Stream<QuerySnapshot> parkingStream =
        FirebaseFirestore.instance.collection(loc).snapshots();

    return parkingStream;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: parkingBuild(loc),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Text('no data');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }

          return Scaffold(
            appBar: AppBar(
              title: Text(loc),
            ),
            body: ListView(
              children: [
                Column(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;

                    //variables
                    final int availableSpots = data['available_spots'];
                    final listSpot = data['spots'];

                    return Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          width: 300,
                          height: 150,
                          child: Image.asset(_image),
                        ),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              data['location'],
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Available: $availableSpots',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),

                        /* GridView.count(
                          // Create a grid with 2 columns. If you change the scrollDirection to
                          // horizontal, this produces 2 rows.
                          crossAxisCount: 2,
                          // Generate 100 widgets that display their index in the List.
                          children: List.generate(listSpot.length, (index) {
                            return Row(
                              children: [
                                CarContainer(
                                    number: index + 1, spot: listSpot[index])
                              ],
                            );
                          }),
                        ),
 */
                        GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 1,
                            crossAxisSpacing: 1,
                            /* childAspectRatio: 1, */
                          ),
                          shrinkWrap: true,
                          itemCount: listSpot.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                CarContainer(
                                    number: index + 1, spot: listSpot[index]),
                              ],
                            );
                          },
                        ),

                        //spot occupancy ui
                        /* OrientationBuilder(builder: (context, orientation) {
                          if (orientation == Orientation.portrait) {
                            return GridView.count(
                              crossAxisCount:
                                  Orientation.portrait == orientation &&
                                          position == 'horizontal'
                                      ? 5
                                      : 2,
                              children: List.generate(listSpot.length, (index) {
                                return CarContainer(
                                    number: index, spot: listSpot[index]);
                              }),
                            );
                          } else {
                            return GridView.count(
                              crossAxisCount:
                                  Orientation.portrait == orientation &&
                                          position == 'horizontal'
                                      ? 2
                                      : 5,
                              children: List.generate(listSpot.length, (index) {
                                return CarContainer(
                                    number: index, spot: listSpot[index]);
                              }),
                            );
                          }
                        }), */
                      ],
                    );
                  }).toList(),
                ),
              ],
            ),
          );
        });
  }
}

class CarContainerOccupied extends StatelessWidget {
  final num number;

  const CarContainerOccupied({
    super.key,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 110,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment(0.0, -1.0),
        end: Alignment(0.0, 1.0),
        colors: [
          Colors.red,
          Colors.redAccent,
          Colors.white,
        ],
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$number',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 80,
            height: 80,
            child: Image.asset(
              'assets/images/car-icon-vertical.png',
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}

class CarContainerEmpty extends StatelessWidget {
  final num number;

  const CarContainerEmpty({
    super.key,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 110,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment(0.0, -1.0),
        end: Alignment(0.0, 1.0),
        colors: [
          Colors.green,
          Colors.greenAccent,
          Colors.white,
        ],
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$number',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class CarContainer extends StatelessWidget {
  final num number;
  final num spot;

  const CarContainer({
    super.key,
    required this.number,
    required this.spot,
  });

  @override
  Widget build(BuildContext context) {
    if (spot >= 1) {
      return Container(
        margin: const EdgeInsets.all(5),
        child: CarContainerOccupied(
          number: number,
        ),
      );
    } else {
      return Container(
        margin: const EdgeInsets.all(5),
        child: CarContainerEmpty(
          number: number,
        ),
      );
    }
  }
}
