import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qlinic/core/shared/custom_text.dart';
import 'package:qlinic/core/utils/app_colors.dart';

class PopularDoctorCard extends StatelessWidget {
  const PopularDoctorCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.wihteColor,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SizedBox(
        width: 150,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.asset(
                "assets/images/doc.png",
                width: double.infinity,

                fit: BoxFit.cover,
              ),
            ),

            const Gap(10),

            const CustomText(
              "Dr. Stella Kane",
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),

            const Gap(5),

            const CustomText(
              "Heart Surgeon",
              fontSize: 12,
              fontWeight: FontWeight.w300,
              color: Colors.grey,
            ),

            const Gap(10),

            const Icon(Icons.star, color: Colors.amber, size: 16),
          ],
        ),
      ),
    );
  }
}
