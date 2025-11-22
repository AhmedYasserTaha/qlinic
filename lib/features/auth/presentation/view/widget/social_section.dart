import 'package:flutter/material.dart';
import 'package:qlinic/core/shared/custom_button.dart';
import 'package:qlinic/core/utils/app_colors.dart';

class SocialSection extends StatelessWidget {
  const SocialSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Material(
            elevation: 3,
            borderRadius: BorderRadius.circular(10),

            child: CustomButton(
              onTap: () {},
              fontSizeText: 12,
              fontWeightText: FontWeight.w300,
              color: AppColors.wihteColor,
              text: "Facebook",
              textColor: AppColors.greyColor,
              gap: 5,
              widget: Image.asset(
                "assets/icons/facebook.png",
                width: 20,
                height: 20,
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Material(
            elevation: 3,
            borderRadius: BorderRadius.circular(10),

            child: CustomButton(
              onTap: () {},
              fontSizeText: 12,
              fontWeightText: FontWeight.w300,
              color: AppColors.wihteColor,
              text: "Google",
              textColor: AppColors.greyColor,
              gap: 5,
              widget: Image.asset(
                "assets/icons/google.png",
                width: 20,
                height: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
