import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class WholeMap extends StatelessWidget {
  const WholeMap({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/usa_logo.png', height: 40, width: 40),
            const Text(
              'Whole Map',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.black, // Set a background color if desired
        child: Center(
          child: PhotoView(
            imageProvider:
                const AssetImage('assets/parking_places/map/whole.png'),
            backgroundDecoration: const BoxDecoration(
              color: Colors.black, // Set the background color
            ),
          ),
        ),
      ),
    );
  }
}
