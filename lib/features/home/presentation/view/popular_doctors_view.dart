import 'package:flutter/material.dart';
import 'package:qlinic/core/models/doctor_model.dart';
import 'package:qlinic/core/shared/custom_text.dart';
import 'package:qlinic/core/utils/app_colors.dart';
import 'package:qlinic/core/utils/size_config.dart';
import 'package:qlinic/features/home/presentation/view/widget/popular_doctor_card.dart';

class PopularDoctorsView extends StatelessWidget {
  const PopularDoctorsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: CustomText(
          "Popular Doctors",
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: GridView.builder(
            itemCount: DoctorModel.popularDoctors.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5.h,
              crossAxisSpacing: 5.w,
              childAspectRatio: 0.53, // Tuned for PopularDoctorCard
            ),
            itemBuilder: (context, index) {
              return PopularDoctorCard(
                doctor: DoctorModel.popularDoctors[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
