import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qlinic/core/models/doctor_model.dart';
import 'package:qlinic/core/shared/custom_text.dart';
import 'package:qlinic/core/utils/app_colors.dart';
import 'package:qlinic/core/utils/size_config.dart';
import 'package:qlinic/features/home/presentation/view/doctor_details_view.dart';

class PopularDoctorCard extends StatelessWidget {
  final DoctorModel doctor;

  const PopularDoctorCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DoctorDetailsView(doctor: doctor),
          ),
        );
      },
      child: Card(
        color: AppColors.wihteColor,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.sp),
        ),
        child: SizedBox(
          width: 180.w,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.sp),
                  topRight: Radius.circular(12.sp),
                ),
                child: Image.asset(
                  doctor.image,
                  width: double.infinity,
                  height: 230.h,
                  fit: BoxFit.cover,
                ),
              ),

              Gap(10.h),

              CustomText(
                doctor.name,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),

              Gap(5.h),

              CustomText(
                doctor.specialty,
                fontSize: 12.sp,
                fontWeight: FontWeight.w300,
                color: Colors.grey,
              ),

              Gap(10.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 16.sp),
                  Gap(5.w),
                  CustomText(
                    doctor.rating.toString(),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ],
              ),
              Gap(10.h),
            ],
          ),
        ),
      ),
    );
  }
}
