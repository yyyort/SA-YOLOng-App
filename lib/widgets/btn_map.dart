import 'package:flutter/material.dart';
import 'package:sa_yolo_ng/page/ref/map_images.dart';

class ToMapWidget extends StatelessWidget {
  final String location;
  const ToMapWidget({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(74, 0, 0, 0),
            blurRadius: 5,
            offset: Offset(-6, 6),
          )
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
        color: Colors.white,
      ),
      width: 110,
      height: 40,
      child: FloatingActionButton(
        heroTag: null,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ImageCaro(
                      location: location,
                    )),
          );
        },
        backgroundColor: Colors.black,
        child: const Text(
          'Map',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
