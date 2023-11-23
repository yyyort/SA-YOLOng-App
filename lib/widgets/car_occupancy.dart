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
      width: 60,
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
          ),
          borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$number',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 60,
            height: 90,
            child: Image.asset(
              'assets/images/car-icon-vertical.png',
              fit: BoxFit.cover,
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
      width: 60,
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
          ),
          borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
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
