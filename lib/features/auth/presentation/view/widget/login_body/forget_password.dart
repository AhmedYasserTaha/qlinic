import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qlinic/core/shared/custom_button.dart';
import 'package:qlinic/core/shared/custom_text.dart';
import 'package:qlinic/core/shared/custom_textformfield.dart';
import 'package:qlinic/core/utils/app_colors.dart';
import 'package:qlinic/core/utils/size_config.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: "Forgot Password?",
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) {
            final emailController = TextEditingController();

            return DraggableScrollableSheet(
              initialChildSize: 0.45,
              minChildSize: 0.4,
              maxChildSize: 0.6,
              builder: (context, scrollController) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 20.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.sp),
                    ),
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomText(
                          "Forgot password",
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        Gap(10.h),

                        CustomText(
                          "Enter your email for the verification process,we will send 4 digits code to your email.",
                          fontSize: 15.sp,
                          color: AppColors.greyColor,
                          textAlign: TextAlign.center,
                        ),

                        Gap(30.h),

                        CustomTextFormField(
                          controller: emailController,
                          labelText: "Email",
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(
                              r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                            ).hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),

                        Gap(30.h),

                        CustomButton(
                          text: "Continue",
                          onTap: () {
                            Navigator.pop(context);
                          },
                          width: double.infinity,
                          color: AppColors.secondaryColor,
                          textColor: AppColors.wihteColor,
                          height: 55.h,
                          radius: 12.sp,
                        ),

                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
      width: double.infinity,
      color: Colors.transparent,
      textColor: AppColors.secondaryColor,
      fontSizeText: 14.sp,
      fontWeightText: FontWeight.w400,
    );
  }
}
