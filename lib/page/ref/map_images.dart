import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sa_yolo_ng/page/ref/whole_map.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

/* 
alumni
 */
final al1 = [
  'parking_places/alumni/al1-1.png',
  'parking_places/alumni/al1-2.png',
  'parking_places/alumni/al1-3.png',
];

final al2 = [
  'parking_places/alumni/al2-1.png',
  'parking_places/alumni/al2-2.png',
];

final al3 = [
  'parking_places/alumni/al3-1.png',
  'parking_places/alumni/al3-2.png',
];

/* 
blanco
*/
final b1 = [
  'parking_places/blanco/b1-1.png',
  'parking_places/blanco/b1-2.png',
  'parking_places/blanco/b1-3.png',
];

final b2 = [
  'parking_places/blanco/b2-1.png',
];

/* 
dolse garcia
 */
final d1 = [
  'parking_places/dolse/d1-1.png',
  'parking_places/dolse/d1-2.png',
  'parking_places/dolse/d1-3.png',
];

final d2 = [
  'parking_places/dolse/d2-1.png',
  'parking_places/dolse/d2-2.png',
  'parking_places/dolse/d2-3.png',
];

/* 
gamboa
 */
final g1 = [
  'parking_places/gamboa/g1-1.png',
  'parking_places/gamboa/g1-2.png',
  'parking_places/gamboa/g1-3.png',
];

class ImageCaro extends StatefulWidget {
  final String location;

  const ImageCaro({Key? key, required this.location}) : super(key: key);

  @override
  State<ImageCaro> createState() => _ImageCaroState();
}

class _ImageCaroState extends State<ImageCaro> {
  imagePicker<String>(String location) {
    switch (location) {
      case 'Alumni Hall 1':
        return al1;
      case 'Alumni Hall 2':
        return al2;
      case 'Alumni Hall 3':
        return al3;
      case 'Blanco Hall 1':
        return b1;
      case 'Blanco Hall 2':
        return b2;
      case 'Dolse Garcia Hall 1':
        return d1;
      case 'Dolse Garcia Hall 2':
        return d2;
      case 'Gamboa Hall':
        return g1;
      default:
        return al1;
    }
  }

  mapPicker<String>(String location) {
    switch (location) {
      case 'Alumni Hall 1':
        return 'assets/parking_places/map/alumni1.png';
      case 'Alumni Hall 2':
        return 'assets/parking_places/map/alumni2.png';
      case 'Alumni Hall 3':
        return 'assets/parking_places/map/alumni3.png';
      case 'Blanco Hall 1':
        return 'assets/parking_places/map/blanco.png';
      case 'Blanco Hall 2':
        return 'assets/parking_places/map/blanco.png';
      case 'Dolse Garcia Hall 1':
        return 'assets/parking_places/map/dolse.png';
      case 'Dolse Garcia Hall 2':
        return 'assets/parking_places/map/dolse.png';
      case 'Gamboa Hall':
        return 'assets/parking_places/map/gamboa.png';
      default:
        return 'assets/parking_places/map/alumni1.png';
    }
  }

  final images = al1;
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.location} Map'),
      ),
      body: ListView(
        children: [
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  width: 400,
                  height: 700,
                  child: CarouselSlider.builder(
                    itemCount: imagePicker(widget.location).length,
                    options: CarouselOptions(
                      height: 700,
                      onPageChanged: (index, reason) =>
                          setState(() => activeIndex = index),
                    ),
                    itemBuilder: (context, index, realIndex) {
                      final image = imagePicker(widget.location)[index];
                      return buildImage(image, index);
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                buildIndicator(),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Image.asset(
            mapPicker(widget.location),
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 20,
          ),
          const WholeMap()
        ],
      ),
    );
  }

  Widget buildImage(String image, int index) => Flexible(
        child: Container(
          color: Colors.blueGrey,
          child: Image.asset(
            image,
            fit: BoxFit.cover,
            scale: 1, //dnt scale
            width: 300,
            height: 700,
          ),
        ),
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: images.length,
      );
}
