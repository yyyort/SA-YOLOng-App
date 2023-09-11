import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sa_yolo_ng/model/parking_area.dart';

class ParkingAreas extends ConsumerStatefulWidget {
  const ParkingAreas({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ParkingAreasState();
}

class _ParkingAreasState extends ConsumerState<ParkingAreas> {
  String search = '';
  String input = '';

  @override
  void initState() {
    super.initState();
    // "ref" can be used in all life-cycles of a StatefulWidget.
    /* ref.read(counterProvider); */
    input = search;
  }

  void _runInput(String searchInput) {
    setState(() {
      input = searchInput;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            onChanged: ((value) => _runInput(value)),
            decoration: const InputDecoration(
              hintText: 'Search',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
            ),
          ),
          Text(input),
          Practice(
            input: input,
          ),
        ],
      ),
    );
  }
}

class Practice extends ConsumerWidget {
  final String input;
  const Practice({super.key, required this.input});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /* final AsyncValue<ParkingArea> parking = ref.watch(parkingAreaProvider); */
    final parkingAreas = ref.watch(parkingHalls);

    return parkingAreas.when(
      data: (data) {
        final List<ParkingArea> area = data.where((element) {
          return element.location.toLowerCase().contains(input.toLowerCase());
        }).toList();
        return Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 350,
                mainAxisSpacing: 1,
                childAspectRatio: 2 / 2),
            itemCount: area.length,
            itemBuilder: (
              context,
              index,
            ) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ParkingAreaWidget(
                  location: area[index].location,
                  availableSpots: area[index].availableSpots,
                  img: area[index].img,
                ),
              );

              /*  ParkingAreaWidget(
                    location: data[index].location,
                    availableSpots: data[index].availableSpots,
                    img: data[index].img,
                  ); */
            },
          ),
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (error, stackTrace) => Text('Error: $error'),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(img),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    location,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        overflow: TextOverflow.ellipsis),
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
