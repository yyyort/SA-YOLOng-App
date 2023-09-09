import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sa_yolo_ng/model/parking_area.dart';

class Practice extends ConsumerWidget {
  const Practice({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /* final AsyncValue<ParkingArea> parking = ref.watch(parkingAreaProvider); */
    final parkingAreas = ref.watch(parkingHalls);

    return /* const Scaffold(
      body: Column(
        children: [
          ParkingAreaWidget(
              location: 'dolse garcia',
              availableSpots: 10,
              img: 'assets/images/dolce_hall.png'),
        ],
      ),
    ); */

        Scaffold(
      body: parkingAreas.when(
        data: (data) {
          return ListView(
            children: [
              GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 230,
                      mainAxisExtent: 350,
                      crossAxisSpacing: 50,
                      mainAxisSpacing: 10,
                      childAspectRatio: 2 / 2),
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(0),
                  itemCount: data.length,
                  itemBuilder: (
                    context,
                    index,
                  ) {
                    return Container(
                      color: Colors.black,
                      child: ParkingAreaWidget(
                        location: data[index].location,
                        availableSpots: data[index].availableSpots,
                        img: data[index].img,
                      ),
                    );

                    /*  ParkingAreaWidget(
                      location: data[index].location,
                      availableSpots: data[index].availableSpots,
                      img: data[index].img,
                    ); */
                  }),
            ],
          );
        },
        loading: () => const CircularProgressIndicator(),
        error: (error, stackTrace) => Text('Error: $error'),
      ),
    );
  }
}

/* 
widget for displaying parking area
contains img of parking area, location, available spots, and a button to view more details
 */
class ParkingAreaWidget extends StatelessWidget {
  final String location;
  final int availableSpots;
  final String img;

  const ParkingAreaWidget({
    super.key,
    required this.location,
    required this.availableSpots,
    required this.img,
  });

  colorPicker<Color>(int availableSpots) {
    if (availableSpots >= 5) {
      return Colors.green;
    } else if (availableSpots >= 2) {
      return Colors.yellow;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330,
      child: Card(
          elevation: 5,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          margin: const EdgeInsets.all(10),
          color: colorPicker(availableSpots),
          child: Column(
            children: [
              SizedBox(
                child: Image.asset(img),
              ),
              Text(
                location,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                'Available: $availableSpots',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  height: 30,
                  width: 60,
                  child: FloatingActionButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    backgroundColor: Colors.black,
                    splashColor: Colors.white,
                    onPressed: () {},
                    child: const Text(
                      'view',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ))
            ],
          )),
    );
  }
}
