import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qlinic/core/shared/custom_button.dart';
import 'package:qlinic/core/shared/custom_text.dart';
import 'package:qlinic/core/shared/custom_textformfield.dart';
import 'package:qlinic/core/utils/app_colors.dart';

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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25),
                    ),
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const CustomText(
                          "Forgot password",
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        const Gap(10),

                        const CustomText(
                          "Enter your email for the verification process,we will send 4 digits code to your email.",
                          fontSize: 15,
                          color: AppColors.greyColor,
                          textAlign: TextAlign.center,
                        ),

                        const Gap(30),

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

                        const Gap(30),

                        CustomButton(
                          text: "Continue",
                          onTap: () {
                            Navigator.pop(context);
                          },
                          width: double.infinity,
                          color: AppColors.secondaryColor,
                          textColor: AppColors.wihteColor,
                          height: 55,
                          radius: 12,
                        ),

                        const SizedBox(height: 20),
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
      fontSizeText: 14,
      fontWeightText: FontWeight.w400,
    );
  }
}
