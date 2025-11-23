import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qlinic/core/shared/custom_button.dart';
import 'package:qlinic/core/shared/custom_textformfield.dart';
import 'package:qlinic/core/shared/splash_background.dart';
import 'package:qlinic/core/utils/app_colors.dart';
import 'package:qlinic/core/utils/size_config.dart';
import 'package:qlinic/features/auth/presentation/view/sign_up_view.dart';
import 'package:qlinic/features/auth/presentation/view/widget/login_body/forget_password.dart';
import 'package:qlinic/features/auth/presentation/view/widget/login_body/header_section_login.dart';
import 'package:qlinic/features/auth/presentation/view/widget/social_section.dart';
import 'package:qlinic/root.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            top: 120.h,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Gap(50.h),
              HeaderSectionLogin(),
              SizedBox(height: 30.h),
              SocialSection(),
              Gap(30.h),

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
              Gap(30.h),
              CustomButton(
                text: "Login ",
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Root()),
                  );
                },
                width: double.infinity,
                color: AppColors.secondaryColor,
                textColor: AppColors.wihteColor,
                height: 55.h,
                radius: 10.sp,
              ),
              Gap(15.h),
              ForgetPassword(),
              CustomButton(
                fontSizeText: 14.sp,
                fontWeightText: FontWeight.w400,
                text: "Don’t have an account? Join us",
                onTap: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => SignUpView()));
                },
                width: double.infinity,
                color: Colors.transparent,
                textColor: AppColors.secondaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
