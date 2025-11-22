import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:qlinic/core/utils/size_config.dart';

class SplashBackground extends StatelessWidget {
  const SplashBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -150.h,
          left: -150.w,
          child: ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
              child: Container(
                width: 400.w,
                height: 400.h,
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
          bottom: -160.h,
          right: -160.w,
          child: ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
              child: Container(
                width: 450.w,
                height: 450.h,
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
