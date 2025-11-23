import 'package:flutter/material.dart';
import 'package:qlinic/core/models/doctor_model.dart';
import 'package:qlinic/core/shared/custom_text.dart';
import 'package:qlinic/core/utils/app_colors.dart';
import 'package:qlinic/core/utils/size_config.dart';
import 'package:qlinic/features/home/presentation/view/widget/speciale_doctor_card.dart';

class SpecialeDoctorsView extends StatelessWidget {
  const SpecialeDoctorsView({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data for Speciale Doctors
    final List<DoctorModel> specialeDoctors = [
      DoctorModel(
        id: 1,
        name: "Dr. Strain",
        specialty: "Dental",
        rating: 4.9,
        price: 22.00,
        image: "assets/images/doc2.jpg",
      ),
      DoctorModel(
        id: 2,
        name: "Dr. Strange",
        specialty: "Surgeon",
        rating: 4.8,
        price: 25.00,
        image: "assets/images/doc2.jpg",
      ),
      DoctorModel(
        id: 3,
        name: "Dr. Who",
        specialty: "General",
        rating: 4.7,
        price: 20.00,
        image: "assets/images/doc2.jpg",
      ),
      DoctorModel(
        id: 4,
        name: "Dr. House",
        specialty: "Diagnostic",
        rating: 4.6,
        price: 30.00,
        image: "assets/images/doc2.jpg",
      ),
      DoctorModel(
        id: 5,
        name: "Dr. Grey",
        specialty: "Surgeon",
        rating: 4.5,
        price: 28.00,
        image: "assets/images/doc2.jpg",
      ),
      DoctorModel(
        id: 6,
        name: "Dr. Watson",
        specialty: "General",
        rating: 4.4,
        price: 18.00,
        image: "assets/images/doc2.jpg",
      ),
    ];

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
          itemCount: specialeDoctors.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15.h,
            crossAxisSpacing: 15.w,
            childAspectRatio: 0.7, // Tuned for SpecialeDoctorCard
          ),
          itemBuilder: (context, index) {
            return SpecialeDoctorCard(doctor: specialeDoctors[index]);
          },
        ),
      ),
    );
  }
}
