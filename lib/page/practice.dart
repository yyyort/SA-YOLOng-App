import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sa_yolo_ng/model/parking_area.dart';

class Practice extends ConsumerWidget {
  const Practice({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /* final AsyncValue<ParkingArea> parking = ref.watch(parkingAreaProvider); */
    final parkingAreas = ref.watch(parkingHalls);

    return Scaffold(
      body: Column(
        children: [
          const Text('hello'),
          parkingAreas.when(
            data: (data) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      ParkingAreaWidget(
                          location: data[0].location,
                          availableSpots: data[0].availableSpots,
                          img: data[0].img),
                      const SizedBox(
                        height: 20,
                      ),
                      ParkingAreaWidget(
                          location: data[2].location,
                          availableSpots: data[2].availableSpots,
                          img: data[2].img),
                    ],
                  ),
                  Column(
                    children: [
                      ParkingAreaWidget(
                          location: data[1].location,
                          availableSpots: data[1].availableSpots,
                          img: data[1].img),
                    ],
                  )
                ],
              );
            },
            loading: () => const CircularProgressIndicator(),
            error: (error, stackTrace) => Text('Error: $error'),
          ),
        ],
      ),
    );
  }

  /* Scaffold(
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
                      padding: const EdgeInsets.symmetric(horizontal: 30),
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
  } */
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
    return Column(
      children: [
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
              Image.asset(img),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                                            loc: parkingArea, position: position)),
                                  ); */
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
        ),
      ],
    );
  }
}
