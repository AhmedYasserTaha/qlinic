import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qlinic/core/models/doctor_model.dart';
import 'package:qlinic/core/shared/custom_button.dart';
import 'package:qlinic/core/shared/custom_text.dart';
import 'package:qlinic/core/shared/custom_textformfield.dart';
import 'package:qlinic/core/utils/app_colors.dart';
import 'package:qlinic/core/utils/size_config.dart';
import 'package:qlinic/features/home/presentation/view/widget/doctor_info_card.dart';

class BookingView extends StatelessWidget {
  final DoctorModel doctor;

  const BookingView({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: CustomText(
          "Appointment",
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DoctorInfoCard(doctor: doctor),
            Gap(30.h),
            CustomText(
              "Appointment For",
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            Gap(20.h),
            CustomTextFormField(labelText: "Full Name"),
            Gap(20.h),
            CustomTextFormField(labelText: "Phone Number"),
            Gap(30.h),
            CustomText(
              "Who is this patient?",
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            ProfileSelector(),
            Gap(20.h),
            const Spacer(),
            CustomButton(
              text: "Next",
              onTap: () {
                // TODO: Implement next step logic
              },
              width: double.infinity,
              color: AppColors.secondaryColor,
              textColor: Colors.white,
              height: 50.h,
              radius: 10.sp,
            ),
            Gap(20.h),
          ],
        ),
      ),
    );
  }
}

class ProfileSelector extends StatelessWidget {
  const ProfileSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          // -------------------- ADD CARD --------------------
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 100.w,
              height: 100.h,
              margin: EdgeInsets.only(right: 12.w),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15.sp),
                border: Border.all(color: Colors.green.withOpacity(0.3)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, color: Colors.green, size: 35.sp),
                  CustomText(
                    "Add",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.green,
                  ),
                ],
              ),
            ),
          ),

          // -------------------- USER CARD --------------------
          _profileCard(image: "assets/images/my_self.png", name: "My Self"),
          _profileCard(image: "assets/images/child.png", name: "My child"),
          _profileCard(image: "assets/images/wife.jpg", name: "My wife"),
        ],
      ),
    );
  }

  Widget _profileCard({required String image, required String name}) {
    return Container(
      width: 100.w,
      margin: EdgeInsets.only(right: 12.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.sp),
            child: Image.asset(
              image,
              height: 120.h,
              width: 110.w,
              fit: BoxFit.cover,
            ),
          ),
          Gap(8.h),
          CustomText(
            name,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
