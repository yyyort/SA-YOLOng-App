import 'package:flutter/material.dart';

class CarContainerOccupied extends StatelessWidget {
  final num number;

  const CarContainerOccupied({
    super.key,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 110,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment(0.0, -1.0),
        end: Alignment(0.0, 1.0),
        colors: [
          Colors.red,
          Colors.redAccent,
          Colors.white,
        ],
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$number',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 80,
            height: 80,
            child: Image.asset(
              'assets/images/car-icon-vertical.png',
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}

class CarContainerEmpty extends StatelessWidget {
  final num number;

  const CarContainerEmpty({
    super.key,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 110,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment(0.0, -1.0),
        end: Alignment(0.0, 1.0),
        colors: [
          Colors.green,
          Colors.greenAccent,
          Colors.white,
        ],
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$number',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class CarContainer extends StatelessWidget {
  final num number;
  final num spot;

  const CarContainer({
    super.key,
    required this.number,
    required this.spot,
  });

  @override
  Widget build(BuildContext context) {
    if (spot >= 1) {
      return Container(
        margin: const EdgeInsets.all(5),
        child: CarContainerOccupied(
          number: number,
        ),
      );
    } else {
      return Container(
        margin: const EdgeInsets.all(5),
        child: CarContainerEmpty(
          number: number,
        ),
      );
    }
  }
}
