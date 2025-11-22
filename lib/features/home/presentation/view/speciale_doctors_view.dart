import 'package:flutter/material.dart';
import 'package:qlinic/core/shared/custom_text.dart';
import 'package:qlinic/core/utils/app_colors.dart';
import 'package:qlinic/core/utils/size_config.dart';
import 'package:qlinic/features/home/presentation/view/widget/speciale_doctor_card.dart';

class SpecialeDoctorsView extends StatelessWidget {
  const SpecialeDoctorsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        title: CustomText(
          "Speciale Doctors",
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: GridView.builder(
          itemCount: 10, // Mock count
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15.h,
            crossAxisSpacing: 15.w,
            childAspectRatio: 0.7, // Tuned for SpecialeDoctorCard
          ),
          itemBuilder: (context, index) {
            return const SpecialeDoctorCard();
          },
        ),
      ),
    );
  }
}
