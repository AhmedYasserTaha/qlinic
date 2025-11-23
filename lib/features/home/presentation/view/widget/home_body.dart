import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qlinic/core/models/doctor_model.dart';
import 'package:qlinic/core/shared/custom_text.dart';
import 'package:qlinic/core/shared/splash_background.dart';
import 'package:qlinic/core/utils/size_config.dart';
import 'package:qlinic/features/home/presentation/view/popular_doctors_view.dart';
import 'package:qlinic/features/home/presentation/view/speciale_doctors_view.dart';
import 'package:qlinic/features/home/presentation/view/widget/live_doctor_card.dart';
import 'package:qlinic/features/home/presentation/view/widget/popular_doctor_card.dart';
import 'package:qlinic/features/home/presentation/view/widget/service_card.dart';
import 'package:qlinic/features/home/presentation/view/widget/speciale_doctor_card.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

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
    ];

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Stack(
          children: [
            const SplashBackground(),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 170.h,
                    width: double.infinity,
                    padding: EdgeInsets.only(
                      top: 50.h,
                      left: 20.w,
                      right: 20.w,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xff1E88E5),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.sp),
                        bottomRight: Radius.circular(20.sp),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  "Hi Handwerker!",
                                  fontSize: 20.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                ),
                                SizedBox(height: 6.h),
                                CustomText(
                                  "Find Your Doctor",
                                  fontSize: 25.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ],
                            ),
                            CircleAvatar(
                              radius: 30.w,
                              backgroundImage: const AssetImage(
                                "assets/images/onboardin1.png",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Transform.translate(
                      offset: Offset(0, -25.h),
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(15.sp),
                        child: TextField(
                          decoration: InputDecoration(
                            hintStyle: GoogleFonts.rubik(
                              color: Colors.grey,
                              fontSize: 16.sp,
                            ),
                            hintText: "Search...",
                            prefixIcon: const Icon(
                              CupertinoIcons.search,
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.sp),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Gap(10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: CustomText(
                      "Live Doctors",
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),

                  Gap(10.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: List.generate(5, (index) {
                        return const LiveDoctorCard();
                      }),
                    ),
                  ),

                  Gap(20.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const ServiceCard(
                          startColor: Color(0xFF3A7BFF),
                          endColor: Color(0xFF6A5BFF),
                          svgIcon: "assets/icons/Tooths.svg",
                        ),
                        const ServiceCard(
                          startColor: Color(0xFF00D18C),
                          endColor: Color(0xFF00BFA5),
                          svgIcon: "assets/icons/heart.svg",
                        ),
                        const ServiceCard(
                          startColor: Color(0xFFFFA44C),
                          endColor: Color(0xFFFF7043),
                          svgIcon: "assets/icons/aye.svg",
                        ),
                        const ServiceCard(
                          startColor: Color(0xFFFF5C5C),
                          endColor: Color(0xFFFF4A4A),
                          svgIcon: "assets/icons/body.svg",
                        ),
                      ],
                    ),
                  ),
                  Gap(20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: Row(
                      children: [
                        CustomText(
                          "Popular Doctors",
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const PopularDoctorsView(),
                              ),
                            );
                          },
                          child: CustomText(
                            "See All>",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Gap(10.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: List.generate(5, (index) {
                        return const PopularDoctorCard();
                      }),
                    ),
                  ),

                  Gap(20.h),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: Row(
                      children: [
                        CustomText(
                          "Speciale Doctors",
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const SpecialeDoctorsView(),
                              ),
                            );
                          },
                          child: CustomText(
                            "See All>",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Gap(10.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: List.generate(specialeDoctors.length, (index) {
                        return SpecialeDoctorCard(
                          doctor: specialeDoctors[index],
                        );
                      }),
                    ),
                  ),

                  Gap(100.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
