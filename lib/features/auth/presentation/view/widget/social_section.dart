import 'package:flutter/material.dart';
import 'package:qlinic/core/shared/custom_button.dart';
import 'package:qlinic/core/utils/app_colors.dart';
import 'package:qlinic/core/utils/size_config.dart';

class SocialSection extends StatelessWidget {
  const SocialSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Material(
            elevation: 3,
            borderRadius: BorderRadius.circular(10.sp),

            child: CustomButton(
              onTap: () {},
              fontSizeText: 12.sp,
              fontWeightText: FontWeight.w300,
              color: AppColors.wihteColor,
              text: "Facebook",
              textColor: AppColors.greyColor,
              gap: 5.w,
              widget: Image.asset(
                "assets/icons/facebook.png",
                width: 20.w,
                height: 20.h,
              ),
            ),
          ),
        ),
        SizedBox(width: 20.w),
        Expanded(
          child: Material(
            elevation: 3,
            borderRadius: BorderRadius.circular(10.sp),

            child: CustomButton(
              onTap: () {},
              fontSizeText: 12.sp,
              fontWeightText: FontWeight.w300,
              color: AppColors.wihteColor,
              text: "Google",
              textColor: AppColors.greyColor,
              gap: 5.w,
              widget: Image.asset(
                "assets/icons/google.png",
                width: 20.w,
                height: 20.h,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
