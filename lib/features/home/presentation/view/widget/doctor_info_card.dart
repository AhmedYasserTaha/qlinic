import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qlinic/core/models/doctor_model.dart';
import 'package:qlinic/core/shared/custom_text.dart';
import 'package:qlinic/core/utils/app_colors.dart';
import 'package:qlinic/core/utils/size_config.dart';

class DoctorInfoCard extends StatelessWidget {
  final DoctorModel doctor;
  final bool showBookButton;
  final VoidCallback? onBookPressed;

  const DoctorInfoCard({
    super.key,
    required this.doctor,
    this.showBookButton = false,
    this.onBookPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.sp)),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    image: DecorationImage(
                      image: AssetImage(doctor.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Gap(15.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomText(
                            doctor.name,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                          const Spacer(),
                          const Icon(Icons.favorite, color: Colors.red),
                        ],
                      ),
                      Gap(5.h),
                      CustomText(
                        doctor.specialty,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                      Gap(8.h),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 16.sp),
                          Gap(5.w),
                          CustomText(
                            doctor.rating.toString(),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          const Spacer(),
                          CustomText(
                            "\$${doctor.price} / hour",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (showBookButton) ...[
              Gap(20.h),
              // Note: The button itself is not part of this widget in the original design,
              // but if we wanted to include it here we could.
              // However, for flexibility, I will leave the button outside or optional.
              // Based on the user request, the booking view has the card WITHOUT the button.
              // So this widget is perfect as is (just the info).
            ],
          ],
        ),
      ),
    );
  }
}
