import 'package:flutter/cupertino.dart';
import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'cardContent.dart';

class SlidingCard extends StatelessWidget {
  final String name;
  final String date;
  final String assetName;
  final double offset;

  const SlidingCard(
      {super.key,
      required this.name,
      required this.date,
      required this.assetName,
      required this.offset});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 2) / 0.08));
    return Transform.translate(
      offset: Offset(-32 * gauss * offset.sign, 0),
      child: Card(
        margin: const EdgeInsets.only(left: 8, right: 8, bottom: 24),
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(32),
              ),
              child: Image.asset(
                'assets/$assetName',
                height: screenSize.height * 0.3,
                alignment: Alignment(-offset.abs(), 0),
                fit: BoxFit.none,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: CardContent(
                name: name,
                date: date,
                offset: gauss,
              ),
            )
          ],
        ),
      ),
    );
  }
}
