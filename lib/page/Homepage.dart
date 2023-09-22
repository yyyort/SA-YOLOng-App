import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sa_yolo_ng/model/parking_area.dart';
import 'package:sa_yolo_ng/page/details/alumni1.dart';
import 'package:sa_yolo_ng/page/details/alumni2.dart';
import 'package:sa_yolo_ng/page/details/alumni3.dart';
import 'package:sa_yolo_ng/page/details/blanco1.dart';
import 'package:sa_yolo_ng/page/details/blanco2.dart';
import 'package:sa_yolo_ng/page/details/dolce_garcia1.dart';
import 'package:sa_yolo_ng/page/details/dolce_garcia2.dart';
import 'package:sa_yolo_ng/page/details/gamboa.dart';

class Homepage extends ConsumerStatefulWidget {
  const Homepage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomepageState();
}

class _HomepageState extends ConsumerState<Homepage> {
  String search = '';
  String input = '';

  //default state
  @override
  void initState() {
    super.initState();
    // "ref" can be used in all life-cycles of a StatefulWidget.
    /* ref.read(counterProvider); */
    input = search;
  }

  //changing state
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
          //search bar
          Container(
            padding: const EdgeInsets.only(left: 30, right: 30),
            margin: const EdgeInsets.only(top: 20, bottom: 10),
            height: 35,
            child: TextField(
              onChanged: ((value) => _runInput(value)),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(5),
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
              ),
            ),
          ),

          //list of parking areas
          ParkingPlaces(
            input: input,
          ),
        ],
      ),
    );
  }
}

//Parking Places widget
class ParkingPlaces extends ConsumerWidget {
  final String input;
  const ParkingPlaces({super.key, required this.input});

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
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Eagle_1.png'),
                opacity: 0.4,
              ),
            ),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 400,
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
                    spots: area[index].spots,
                  ),
                );
              },
            ),
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
  final List<dynamic> spots;

  const ParkingAreaWidget({
    super.key,
    required this.location,
    required this.availableSpots,
    required this.img,
    required this.spots,
  });

  //for changing color of parking area card
  colorPicker<Color>(int availableSpots) {
    if (availableSpots >= 5) {
      return Colors.green[400];
    } else if (availableSpots >= 1) {
      return Colors.yellowAccent;
    } else {
      return Colors.redAccent;
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
                  color: Color.fromARGB(74, 0, 0, 0),
                  blurRadius: 5,
                  offset: Offset(-6, 6),
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
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(74, 0, 0, 0),
                          blurRadius: 5,
                          offset: Offset(-6, 6),
                        )
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    width: 80,
                    height: 30,
                    child: FloatingActionButton(
                      heroTag: null,
                      onPressed: () {
                        /* Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPage(
                                    location: id,
                                  )),
                        ); */

                        /* 
                          routing to different pages depending on the location
                         */
                        switch (location) {
                          case 'Alumni 1':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AlumniHall1()),
                            );
                            break;
                          case 'Alumni 2':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AlumniHall2()),
                            );
                            break;
                          case 'Alumni 3':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AlumniHall3()),
                            );
                            break;
                          case 'Blanco 1':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BlancoHall1()),
                            );
                            break;
                          case 'Blanco 2':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BlancoHall2()),
                            );
                            break;
                          case 'Dolse Garcia 1':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const DolseGarciaHall1()),
                            );
                            break;
                          case 'Dolse Garcia 2':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const DolseGarciaHall2()),
                            );
                            break;
                          case 'Gamboa Hall':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const GamboaHall()),
                            );
                            break;

                          default:
                            {}
                        }
                      },
                      backgroundColor: Colors.black,
                      child: const Text(
                        'view',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
