import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class DetailPage extends StatelessWidget {
  final String title;
  final int availableSpots;
  const DetailPage(
      {super.key, required this.title, required this.availableSpots});

  final _image = 'assets/images/dolce_parking.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
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
                const Text(
                  'Parking Area',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Available: $availableSpots',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),

            const SpotsVertical(), //spot occupancy ui
          ],
        ));
  }
}

class SpotsVertical extends StatefulWidget {
  const SpotsVertical({super.key});

  @override
  State<SpotsVertical> createState() => _SpotsVerticalState();
}

class _SpotsVerticalState extends State<SpotsVertical> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarContainer(
              number: 1,
              parkingArea: 'alumni_hall',
            ),
            CarContainer(
              number: 2,
              parkingArea: 'alumni_hall',
            ),
            CarContainer(
              number: 3,
              parkingArea: 'alumni_hall',
            ),
            CarContainer(
              number: 4,
              parkingArea: 'alumni_hall',
            ),
            CarContainer(
              number: 5,
              parkingArea: 'alumni_hall',
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarContainer(
              number: 6,
              parkingArea: 'alumni_hall',
            ),
            CarContainer(
              number: 7,
              parkingArea: 'alumni_hall',
            )
          ],
        ),
      ],
    );
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
      width: 60,
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
      width: 60,
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
  final String parkingArea;

  const CarContainer({
    super.key,
    required this.number,
    required this.parkingArea,
  });

  parkingBuild(parkingArea) {
    Stream<QuerySnapshot> parkingStream =
        FirebaseFirestore.instance.collection(parkingArea).snapshots();

    return parkingStream;
  }

  /* final Stream<QuerySnapshot> _parkingStream =
      FirebaseFirestore.instance.collection(parkingArea).snapshots(); */

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: parkingBuild(parkingArea),
        /* stream: _parkingStream, */
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Text('no data');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }

          return Container(
            margin: const EdgeInsets.all(10),
            child: Row(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                if (data['spots'][number - 1] >= 1) {
                  return CarContainerOccupied(
                    number: number,
                  );
                } else {
                  return CarContainerEmpty(
                    number: number,
                  );
                }
              }).toList(),
            ),
          );
        });
  }
}
