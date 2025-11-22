import 'package:flutter/material.dart';
import 'package:qlinic/core/shared/custom_text.dart';
import 'package:qlinic/core/utils/app_colors.dart';

class HeaderSectionLogin extends StatelessWidget {
  const HeaderSectionLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomText(
          "Welcome Back",
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: AppColors.balckColor,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        const CustomText(
          "You can search c ourse, apply course and find\nscholarship for abroad studies",
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.greyColor,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
