import 'package:flutter/material.dart';
import 'package:qlinic/core/shared/custom_text.dart';
import 'package:qlinic/core/utils/app_colors.dart';
import 'package:qlinic/core/utils/size_config.dart';

class HeaderSectionSignup extends StatelessWidget {
  const HeaderSectionSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          "Join us to start searching",
          fontSize: 24.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.balckColor,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10.h),
        CustomText(
          "You can search courses, apply course and find\nscholarship for abroad studies",
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.greyColor,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
