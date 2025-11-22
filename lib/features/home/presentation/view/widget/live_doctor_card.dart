import 'package:flutter/material.dart';
import 'package:qlinic/core/utils/size_config.dart';

class LiveDoctorCard extends StatelessWidget {
  const LiveDoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.h,
      width: 130.w,
      margin: EdgeInsets.only(right: 15.w),
      decoration: BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.circular(20.sp),
        image: const DecorationImage(
          image: AssetImage("assets/images/onboardin1.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // 🔴 LIVE Badge
          Positioned(
            top: 10.h,
            right: 10.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(6.sp),
              ),
              child: Text(
                "LIVE",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                ),
              ),
            ),
          ),

          // ▶️ Play button in center
          Center(
            child: Container(
              padding: EdgeInsets.all(10.w),
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Icon(
                Icons.play_circle_outline_rounded,
                color: Colors.white,
                size: 40.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
