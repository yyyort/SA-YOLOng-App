import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sa_yolo_ng/model/parking_area.dart';
import 'package:sa_yolo_ng/widgets/car_occupancy.dart';
// ignore: unused_import
import 'package:sa_yolo_ng/widgets/car_occupancy_horizontal.dart';

class GamboaHall extends ConsumerWidget {
  const GamboaHall({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stream = ref.watch(gamboaStream1);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/images/usa_logo.png'),
            const Text(
              'Gamboa Hall 1',
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
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          for (var i = 0; i < data.spots.length; i++)
                            CarContainer(number: i + 1, spot: data.spots[i])
                        ],
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          for (var i = 0; i < data.spots1.length; i++)
                            CarContainer(number: i + 4, spot: data.spots1[i])
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
