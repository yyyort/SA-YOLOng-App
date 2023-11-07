import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class WholeMap extends StatelessWidget {
  const WholeMap({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zoomable and Rotatable Image'),
      ),
      body: Container(
        color: Colors.black, // Set a background color if desired
        child: Center(
          child: PhotoView(
            imageProvider: AssetImage('assets/parking_places/map/whole.png'),
            backgroundDecoration: BoxDecoration(
              color: Colors.black, // Set the background color
            ),
          ),
        ),
      ),
    );
  }
}
