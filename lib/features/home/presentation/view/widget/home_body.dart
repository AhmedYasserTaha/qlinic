import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qlinic/core/shared/custom_text.dart';
import 'package:qlinic/core/shared/splash_background.dart';
import 'package:qlinic/features/home/presentation/view/widget/live_doctor_card.dart';
import 'package:qlinic/features/home/presentation/view/widget/popular_doctor_card.dart';
import 'package:qlinic/features/home/presentation/view/widget/service_card.dart';
import 'package:qlinic/features/home/presentation/view/widget/speciale_doctor_card.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
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
                    height: 170,
                    width: double.infinity,
                    padding: const EdgeInsets.only(
                      top: 50,
                      left: 20,
                      right: 20,
                    ),
                    decoration: const BoxDecoration(
                      color: Color(0xff1E88E5),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  "Hi Handwerker!",
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                ),
                                SizedBox(height: 6),
                                CustomText(
                                  "Find Your Doctor",
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ],
                            ),
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(
                                "assets/images/onboardin1.png",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Transform.translate(
                      offset: const Offset(0, -25),
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(15),
                        child: TextField(
                          decoration: InputDecoration(
                            hintStyle: GoogleFonts.rubik(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                            hintText: "Search...",
                            prefixIcon: Icon(
                              CupertinoIcons.search,
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Gap(10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: CustomText(
                      "Live Doctors",
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),

                  Gap(10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: List.generate(5, (index) {
                        return LiveDoctorCard();
                      }),
                    ),
                  ),

                  const Gap(20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ServiceCard(
                          startColor: Color(0xFF3A7BFF),
                          endColor: Color(0xFF6A5BFF),
                          svgIcon: "assets/icons/Tooths.svg",
                        ),
                        ServiceCard(
                          startColor: Color(0xFF00D18C),
                          endColor: Color(0xFF00BFA5),
                          svgIcon: "assets/icons/heart.svg",
                        ),
                        ServiceCard(
                          startColor: Color(0xFFFFA44C),
                          endColor: Color(0xFFFF7043),
                          svgIcon: "assets/icons/aye.svg",
                        ),
                        ServiceCard(
                          startColor: Color(0xFFFF5C5C),
                          endColor: Color(0xFFFF4A4A),
                          svgIcon: "assets/icons/body.svg",
                        ),
                      ],
                    ),
                  ),
                  const Gap(20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        CustomText(
                          "Popular Doctors",
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        Spacer(),
                        CustomText(
                          "See All>",
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),

                  const Gap(10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: List.generate(5, (index) {
                        return PopularDoctorCard();
                      }),
                    ),
                  ),

                  const Gap(20),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        CustomText(
                          "Speciale Doctors",
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        Spacer(),
                        CustomText(
                          "See All>",
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),

                  const Gap(10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: List.generate(5, (index) {
                        return SpecialeDoctorCard();
                      }),
                    ),
                  ),

                  const Gap(100),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
