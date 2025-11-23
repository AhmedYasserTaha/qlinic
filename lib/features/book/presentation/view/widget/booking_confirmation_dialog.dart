import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:qlinic/core/models/doctor_model.dart';
import 'package:qlinic/core/shared/custom_button.dart';
import 'package:qlinic/core/shared/custom_text.dart';
import 'package:qlinic/core/utils/app_colors.dart';
import 'package:qlinic/core/utils/size_config.dart';

class BookingConfirmationDialog extends StatelessWidget {
  final DoctorModel doctor;
  final DateTime date;
  final String time;

  const BookingConfirmationDialog({
    super.key,
    required this.doctor,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.sp)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: AppColors.secondaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.thumb_up,
                color: AppColors.secondaryColor,
                size: 40.sp,
              ),
            ),
            Gap(20.h),
            CustomText(
              "Thank You !",
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            Gap(10.h),
            CustomText(
              "Your Appointment Successful",
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
            Gap(20.h),
            CustomText(
              "You booked an appointment with Dr. ${doctor.name} on ${DateFormat('MMMM d').format(date)},\nat $time",
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
              textAlign: TextAlign.center,
              maxLines: 3,
            ),
            Gap(30.h),
            CustomButton(
              text: "Done",
              onTap: () {
                // Navigate to home or close
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              width: double.infinity,
              color: AppColors.secondaryColor,
              textColor: Colors.white,
              height: 50.h,
              radius: 10.sp,
            ),
            Gap(10.h),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: CustomText(
                "Edit your appointment",
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
