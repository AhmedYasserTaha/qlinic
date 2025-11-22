import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qlinic/core/shared/custom_text.dart';
import 'package:qlinic/core/shared/custom_button.dart';
import 'package:qlinic/core/shared/custom_textformfield.dart';
import 'package:qlinic/core/shared/splash_background.dart';
import 'package:qlinic/core/utils/app_colors.dart';
import 'package:qlinic/core/utils/size_config.dart';
import 'package:qlinic/features/auth/presentation/view/login_view.dart';
import 'package:qlinic/features/auth/presentation/view/widget/sign_up_body/header_section_signup.dart';
import 'package:qlinic/features/auth/presentation/view/widget/social_section.dart';
import 'package:qlinic/root.dart';

class SingUpBody extends StatefulWidget {
  const SingUpBody({super.key});

  @override
  State<SingUpBody> createState() => _SingUpBodyState();
}

class _SingUpBodyState extends State<SingUpBody> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SplashBackground(),
        SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Column(
                children: [
                  Gap(120.h),
                  HeaderSectionSignup(),
                  SizedBox(height: 30.h),
                  SocialSection(),
                  SizedBox(height: 30.h),
                  CustomTextFormField(
                    labelText: "Name",
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  Gap(20.h),
                  CustomTextFormField(
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
                  Gap(20.h),
                  CustomTextFormField(
                    labelText: "Password",
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  Gap(20.h),
                  Row(
                    children: [
                      Radio<bool>(
                        value: true,
                        groupValue: _isSelected,
                        onChanged: (value) {
                          setState(() {
                            _isSelected = value ?? false;
                          });
                        },
                        activeColor: Colors.blue,
                      ),
                      Expanded(
                        child: CustomText(
                          "I agree to the Terms of Service and Privacy Policy",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.greyColor,
                        ),
                      ),
                    ],
                  ),
                  Gap(30.h),
                  CustomButton(
                    text: "Sign Up",
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Root()),
                      );
                    },
                    width: double.infinity,
                    color: AppColors.secondaryColor,
                    textColor: AppColors.wihteColor,
                    height: 55.h,
                    radius: 10.sp,
                  ),
                  CustomButton(
                    fontSizeText: 14.sp,
                    fontWeightText: FontWeight.w400,
                    text: "Have an account? Log in",
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginView()),
                      );
                    },
                    width: double.infinity,
                    color: Colors.transparent,
                    textColor: AppColors.secondaryColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
