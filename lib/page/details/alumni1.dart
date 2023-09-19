import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sa_yolo_ng/model/parking_area.dart';
import 'package:sa_yolo_ng/widgets/car_occupancy.dart';

class AlumniHall1 extends ConsumerWidget {
  const AlumniHall1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stream = ref.watch(alumniStream1);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Alumni Hall 1'),
      ),
      body: Column(
        children: [
          stream.when(
            data: (data) {
              return Column(
                children: [
                  Text('Available: ${data.availableSpots}'),
                  Row(
                    children: [
                      for (var i = 0; i < data.spots.length; i++)
                        CarContainer(
                          number: i + 1,
                          spot: data.spots[i],
                        )
                    ],
                  ),
                ],
              );
              /* return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      childAspectRatio: 1,
                      mainAxisSpacing: 1,
                      crossAxisSpacing: 1),
                  itemCount: data.spots.length,
                  itemBuilder: (context, index) {
                    return CarContainer(
                      number: index + 1,
                      spot: data.spots[index],
                    );
                  }); */
            },
            loading: () => const CircularProgressIndicator(),
            error: (error, stackTrace) => Text('Error: $error'),
          )
        ],
      ),
    );
  }
}
