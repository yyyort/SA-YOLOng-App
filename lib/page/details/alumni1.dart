// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sa_yolo_ng/model/parking_area.dart';
import 'package:sa_yolo_ng/page/Homepage.dart';
import 'package:sa_yolo_ng/page/ref/map_images.dart';
import 'package:sa_yolo_ng/widgets/btn_map.dart';
import 'package:sa_yolo_ng/widgets/car_occupancy.dart';
import 'package:sa_yolo_ng/widgets/car_occupancy_horizontal.dart';

class AlumniHall1 extends ConsumerWidget {
  const AlumniHall1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stream = ref.watch(alumniStream1);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/images/usa_logo.png', height: 40, width: 40),
            const Text(
              'Alumni Hall 1',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 40,
          ),
          stream.when(
            data: (data) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Text(
                      'Available: ${data.availableSpots}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 30),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var i = 0; i < data.spots.length; i++)
                        CarContainer(
                          number: i + 1,
                          spot: data.spots[i],
                        )
                    ],
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var i = 0; i < data.spots1.length; i++)
                        CarOccupancyHorizontal(
                            number: i + 6, spot: data.spots1[i])
                    ],
                  )
                ],
              );
            },
            loading: () => const CircularProgressIndicator(),
            error: (error, stackTrace) => Text('Error: $error'),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            'Map',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Image.asset('assets/parking_places/map/alumni1.png'),
          const SizedBox(
            height: 10,
          ),
          const ImageCaro(location: 'Alumni Hall 1'),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
