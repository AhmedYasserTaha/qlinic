import 'package:flutter/material.dart';
import 'package:qlinic/core/shared/custom_text.dart';
import 'package:qlinic/core/utils/size_config.dart';

class SpecialeDoctorCard extends StatelessWidget {
  const SpecialeDoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cardWidth = 130.w;
    final profileSize = cardWidth * 0.6;

    return SizedBox(
      width: cardWidth,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.sp)),
        elevation: 4.0,
        child: Padding(
          padding: EdgeInsets.all(8.0.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // --- Header Row ---
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.favorite, color: Colors.red, size: 16.sp),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16.sp),
                        SizedBox(width: 4.w),
                        CustomText(
                          "4.9",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: profileSize * 0.1),

              // --- Profile Image ---
              Container(
                width: profileSize,
                height: profileSize,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("assets/images/doc2.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(height: profileSize * 0.15),

              // --- Doctor Name ---
              CustomText(
                "Dr. Strain",
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                textAlign: TextAlign.center,
              ),

              // --- Rate/Price ---
              CustomText(
                '\$ 22.00 / hours',
                fontSize: 11.sp,
                fontWeight: FontWeight.w300,
                color: Colors.grey,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
