import 'dart:ui';
import 'package:flutter/material.dart';

class SplashBackground extends StatelessWidget {
  const SplashBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -150,
          left: -150,
          child: ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
              child: Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Colors.teal.withOpacity(0.35),
                      const Color.fromARGB(0, 255, 255, 255),
                    ],
                    stops: const [0.15, 0.7],
                    radius: 0.8,
                    center: Alignment.center,
                  ),
                ),
              ),
            ),
          ),
        ),

        Positioned(
          bottom: -160,
          right: -160,
          child: ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
              child: Container(
                width: 450,
                height: 450,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Colors.teal.withOpacity(0.35),
                      const Color.fromARGB(0, 255, 255, 255),
                    ],
                    stops: const [0.15, 0.7],
                    radius: 0.8,
                    center: Alignment.center,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
