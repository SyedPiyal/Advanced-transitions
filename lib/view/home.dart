import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transitions/view/slidingCardView.dart';
import 'package:transitions/view/tabs.dart';
import 'package:transitions/view/widgets/exhibitionBottomSheet.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: 15, bottom: 30, left: 32, right: 32),
                  child: Text(
                    'Shenzhen',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Tabs(),
                SizedBox(
                  height: 8,
                ),
                SlidingCardView()
              ],
            ),
          ),
          ExhibitionBottomSheet()
        ],
      ),
    );
  }
}
