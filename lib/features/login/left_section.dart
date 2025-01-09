import 'package:flutter/material.dart';

class LeftSection extends StatelessWidget {
  const LeftSection({super.key});

  @override
  Widget build(BuildContext context) {
    double imageWidth = (496 / 212.52) * 354.5;

    // Preload images
    precacheImage(const AssetImage('images/top_right_login.png'), context);
    precacheImage(const AssetImage('images/bottom_login.png'), context);
    precacheImage(const AssetImage('images/ado-dad.png'), context);

    return SizedBox(
      width: imageWidth,
      child: Stack(
        children: [
          // Background color
          Container(
            color: const Color(0xFFF05555),
          ),
          // Top right corner image
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              'images/top_right_login.png',
              width: 354.5,
              height: 212.52,
              filterQuality: FilterQuality.high, // Optimize quality
            ),
          ),
          // Bottom left corner image
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'images/bottom_login.png',
              height: 496,
              filterQuality: FilterQuality.high,
            ),
          ),
          // Positioned Container with Image and Text
          Positioned(
            top: 275,
            left: 175,
            child: Container(
              width: 900,
              height: 300,
              padding: const EdgeInsets.all(0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'images/ado-dad.png',
                    filterQuality: FilterQuality.high,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Where Buyers & Sellers',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 52,
                      fontWeight: FontWeight.w100,
                      color: Colors.white,
                      height: 1.3,
                    ),
                  ),
                  const Text(
                    'Connect!',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 52,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Making it easy to find deals or sell items quickly!',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
