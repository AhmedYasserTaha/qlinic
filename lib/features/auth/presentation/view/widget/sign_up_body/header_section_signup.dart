import 'package:flutter/material.dart';
import 'package:qlinic/core/shared/custom_text.dart';
import 'package:qlinic/core/utils/app_colors.dart';

class HeaderSectionSignup extends StatelessWidget {
  const HeaderSectionSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          "Join us to start searching",
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: AppColors.balckColor,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        CustomText(
          "You can search courses, apply course and find\nscholarship for abroad studies",
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.greyColor,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
