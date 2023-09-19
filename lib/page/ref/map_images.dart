import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final al1 = [
  'parking_places/alumni/al1-1.png',
  'parking_places/alumni/al1-2.png',
  'parking_places/alumni/al1-3.png',
];

class MapReference extends StatelessWidget {
  const MapReference({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Map Reference'),
        ),
        body: ListView(
          children: const [
            Text('test'),
            ImageCaro(),
          ],
        ));
  }
}

class ImageCaro extends StatefulWidget {
  const ImageCaro({super.key});

  @override
  State<ImageCaro> createState() => _ImageCaroState();
}

class _ImageCaroState extends State<ImageCaro> {
  final images = al1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CarouselSlider.builder(
          itemCount: images.length,
          options: CarouselOptions(
            reverse: true,
          ),
          itemBuilder: (context, index, realIndex) {
            final image = images[index];

            return buildImage(image, index);
          }),
    );
  }

  Widget buildImage(String image, int index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        color: Colors.blueGrey,
        child: Image.asset(
          image,
          fit: BoxFit.fill,
          height: 600,
          width: 200,
        ),
      );
}

/* 
needed bigger images
 */
