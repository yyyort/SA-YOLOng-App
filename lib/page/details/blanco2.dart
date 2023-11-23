import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sa_yolo_ng/model/parking_area.dart';
import 'package:sa_yolo_ng/page/ref/map_images.dart';
import 'package:sa_yolo_ng/widgets/car_occupancy.dart';

class BlancoHall2 extends ConsumerWidget {
  const BlancoHall2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stream = ref.watch(blancoStream2);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/images/usa_logo.png', height: 40, width: 40),
            const Text(
              'Blanco Hall 2',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          stream.when(
            data: (data) {
              return Column(
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
                        CarContainer(number: i + 1, spot: data.spots[i])
                    ],
                  ),
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
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Image.asset('assets/parking_places/map/blanco.png'),
          const SizedBox(
            height: 10,
          ),
          const ImageCaro(location: 'Blanco Hall 2'),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
