import 'package:flutter/material.dart';

class WholeMap extends StatelessWidget {
  const WholeMap({super.key});

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      maxScale: 5.0,
      minScale: 0.1,
      child: Image.asset('assets/parking_places/map/whole.png'),
    );
  }
}
