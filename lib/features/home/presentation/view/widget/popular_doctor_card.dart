import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qlinic/core/shared/custom_text.dart';
import 'package:qlinic/core/utils/app_colors.dart';
import 'package:qlinic/core/utils/size_config.dart';

class PopularDoctorCard extends StatelessWidget {
  const PopularDoctorCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.wihteColor,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.sp)),
      child: SizedBox(
        width: 150.w,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.sp),
                topRight: Radius.circular(12.sp),
              ),
              child: Image.asset(
                "assets/images/doc.png",
                width: double.infinity,

                fit: BoxFit.cover,
              ),
            ),

            Gap(10.h),

            CustomText(
              "Dr. Stella Kane",
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),

            Gap(5.h),

            CustomText(
              "Heart Surgeon",
              fontSize: 12.sp,
              fontWeight: FontWeight.w300,
              color: Colors.grey,
            ),

            Gap(10.h),

            Icon(Icons.star, color: Colors.amber, size: 16.sp),
          ],
        ),
      ),
    );
  }
}
