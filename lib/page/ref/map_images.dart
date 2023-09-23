import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
          children: [
            const Text('test'),
            const ImageCaro(),
            const SizedBox(
              height: 600,
            ),
            Image.asset(
              'assets/parking_places/map/alumni1.png',
              fit: BoxFit.fill,
            )
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
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: SizedBox(
            width: 400,
            height: 700,
            child: CarouselSlider.builder(
              itemCount: images.length,
              options: CarouselOptions(
                height: 700,
                onPageChanged: (index, reason) =>
                    setState(() => activeIndex = index),
              ),
              itemBuilder: (context, index, realIndex) {
                final image = images[index];
                return buildImage(image, index);
              },
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        buildIndicator(),
      ],
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

/* 
needed bigger images
 */
