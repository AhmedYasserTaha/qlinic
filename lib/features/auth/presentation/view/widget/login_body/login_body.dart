import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qlinic/core/shared/custom_button.dart';
import 'package:qlinic/core/shared/custom_textformfield.dart';
import 'package:qlinic/core/shared/splash_background.dart';
import 'package:qlinic/core/utils/app_colors.dart';
import 'package:qlinic/features/auth/presentation/view/sign_up_view.dart';
import 'package:qlinic/features/auth/presentation/view/widget/login_body/forget_password.dart';
import 'package:qlinic/features/auth/presentation/view/widget/login_body/header_section_login.dart';
import 'package:qlinic/features/auth/presentation/view/widget/social_section.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SplashBackground(),
        SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 120,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Gap(50),
                  HeaderSectionLogin(),
                  const SizedBox(height: 30),
                  SocialSection(),
                  const Gap(30),

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
                  const Gap(20),
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
                  const Gap(30),
                  CustomButton(
                    text: "Login ",
                    onTap: () {
                      // Sign in action
                    },
                    width: double.infinity,
                    color: AppColors.secondaryColor,
                    textColor: AppColors.wihteColor,
                    height: 55,
                    radius: 10,
                  ),
                  const Gap(15),
                  ForgetPassword(),
                  CustomButton(
                    fontSizeText: 14,
                    fontWeightText: FontWeight.w400,
                    text: "Don’t have an account? Join us",
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SignUpView()),
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
