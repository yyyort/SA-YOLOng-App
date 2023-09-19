import 'package:flutter/material.dart';

class CarOccupiedHorizontal extends StatelessWidget {
  final int number;
  const CarOccupiedHorizontal({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 60,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(1.0, 0.0),
            end: Alignment(-1.0, 0.0),
            colors: [
              Colors.red,
              Colors.redAccent,
              Colors.white,
            ],
          ),
          borderRadius: BorderRadius.horizontal(right: Radius.circular(10))),
      child: Container(
        padding: const EdgeInsets.only(right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$number',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              width: 90,
              height: 90,
              child: RotatedBox(
                quarterTurns: 1,
                child: Image.asset(
                  'assets/images/car-icon-vertical.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CarEmptyHorizontal extends StatelessWidget {
  final int number;
  const CarEmptyHorizontal({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 50,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment(1.0, 0.0),
        end: Alignment(-1.0, 0.0),
        colors: [
          Colors.green,
          Colors.greenAccent,
          Colors.white,
        ],
      )),
      child: Row(
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

class CarOccupancyHorizontalRight extends StatelessWidget {
  final int number;
  final int spot;

  const CarOccupancyHorizontalRight({
    super.key,
    required this.number,
    required this.spot,
  });

  @override
  Widget build(BuildContext context) {
    if (spot >= 1) {
      return Container(
        margin: const EdgeInsets.all(5),
        child: CarOccupiedHorizontal(
          number: number,
        ),
      );
    } else {
      return Container(
        margin: const EdgeInsets.all(5),
        child: CarEmptyHorizontal(
          number: number,
        ),
      );
    }
  }
}
