import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sa_yolo_ng/model/parking_area.dart';
import 'package:sa_yolo_ng/widgets/car_occupancy_horizontal.dart';
import 'package:sa_yolo_ng/widgets/car_occupancy_horizontal_right.dart';

class BlancoHall1 extends ConsumerWidget {
  const BlancoHall1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stream = ref.watch(blancoStream1);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/images/usa_logo.png'),
            const Text(
              'Blanco Hall 1',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          stream.when(
            data: (data) {
              return Column(
                children: [
                  Text(
                    'Available: ${data.availableSpots}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          for (var i = 0; i < data.spots.length; i++)
                            CarOccupancyHorizontalRight(
                                number: i + 1, spot: data.spots[i])
                        ],
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Column(
                        children: [
                          for (var i = 0; i < data.spots1.length; i++)
                            CarOccupancyHorizontal(
                                number: i + 8, spot: data.spots1[i])
                        ],
                      ),
                    ],
                  ),
                ],
              );
            },
            loading: () => const CircularProgressIndicator(),
            error: (error, stackTrace) => Text('Error: $error'),
          )
        ],
      ),
    );
  }
}
