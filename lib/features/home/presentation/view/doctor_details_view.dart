import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qlinic/core/models/doctor_model.dart';
import 'package:qlinic/core/shared/custom_button.dart';
import 'package:qlinic/core/shared/custom_text.dart';
import 'package:qlinic/core/utils/app_colors.dart';
import 'package:qlinic/core/utils/size_config.dart';

class DoctorDetailsView extends StatelessWidget {
  final DoctorModel doctor;

  const DoctorDetailsView({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: CustomText(
          "Doctor Details",
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.sp),
                ),
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
                                    const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    ),
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
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 16.sp,
                                    ),
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
                      Gap(20.h),
                      CustomButton(
                        text: "Book Now",
                        onTap: () {
                          // TODO: Implement booking logic
                        },
                        width: 200.w,
                        color: AppColors.secondaryColor,
                        textColor: Colors.white,
                        height: 50.h,
                        radius: 10.sp,
                      ),
                    ],
                  ),
                ),
              ),
              Gap(20.h),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.sp),
                ),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    CardDetails(title: "Running", number: "100"),
                    CardDetails(title: "Ongoing", number: "500"),
                    CardDetails(title: "Patient", number: "700"),
                  ],
                ),
              ),
              Gap(20.h),
              CustomText(
                "Services",
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              Gap(10.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    "1.",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.secondaryColor,
                  ),
                  Gap(10.w),
                  Expanded(
                    child: CustomText(
                      "Patient care should be the number one priority.",
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w300,
                      color: AppColors.greyColor,
                    ),
                  ),
                ],
              ),
              const Divider(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    "2.",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.secondaryColor,
                  ),
                  Gap(10.w),
                  Expanded(
                    child: CustomText(
                      "If you run your practice you know how frustrating.",
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w300,
                      color: AppColors.greyColor,
                    ),
                  ),
                ],
              ),
              const Divider(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    "3.",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.secondaryColor,
                  ),
                  Gap(10.w),
                  Expanded(
                    child: CustomText(
                      "That’s why some of appointment reminder system.",
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w300,
                      color: AppColors.greyColor,
                    ),
                  ),
                ],
              ),
              Gap(20.h),
              CustomText(
                "Location",
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              Gap(10.h),
              Container(
                height: 200.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12.sp),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.map_outlined,
                        size: 40.sp,
                        color: AppColors.primaryColor,
                      ),
                      Gap(10.h),
                      CustomText(
                        "Map View",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[600],
                      ),
                    ],
                  ),
                ),
              ),
              Gap(20.h),
            ],
          ),
        ),
      ),
    );
  }
}

class CardDetails extends StatelessWidget {
  const CardDetails({super.key, required this.title, required this.number});

  final String title;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      margin: EdgeInsets.symmetric(vertical: 12.w),
      decoration: BoxDecoration(
        color: const Color.fromARGB(122, 203, 203, 203),
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            number,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          CustomText(
            title,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.greyColor,
          ),
        ],
      ),
    );
  }
}
