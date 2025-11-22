import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qlinic/core/utils/size_config.dart';

class ServiceCard extends StatelessWidget {
  final Color startColor;
  final Color endColor;
  final String svgIcon;

  const ServiceCard({
    super.key,
    required this.startColor,
    required this.endColor,
    required this.svgIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15.w),
      width: 75.w,
      height: 82.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.sp),
        gradient: LinearGradient(
          colors: [startColor, endColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: -20.w,
            child: Container(
              width: 55.w,
              height: 55.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.18),
              ),
            ),
          ),
          Positioned(
            bottom: -15.h,
            left: 0,
            right: 0,
            child: Container(
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.12),
              ),
            ),
          ),
          Center(
            child: SvgPicture.asset(
              svgIcon,
              width: 30.w,
              height: 30.h,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
