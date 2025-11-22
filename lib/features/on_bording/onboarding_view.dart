import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qlinic/core/shared/custom_button.dart';
import 'package:qlinic/core/shared/custom_text.dart';
import 'package:qlinic/core/shared/splash_background.dart';
import 'package:qlinic/core/utils/app_colors.dart';
import 'package:qlinic/core/utils/size_config.dart';
import 'package:qlinic/features/auth/presentation/view/sign_up_view.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _controller = PageController();
  int _current = 0;

  final List<Map<String, String>> _pages = [
    {
      'image': 'assets/images/onboardin1.png',
      'title': 'ابحث عن أطباء موثوق بهم',
      'desc':
          'استعرض ملفات الأطباء التفصيلية واتخذ قرارك بناءً على خبراتهم وتقييماتهم.',
    },
    {
      'image': 'assets/images/onboardin2.png',
      'title': 'اختر أفضل الأطباء',
      'desc':
          'ابحث عن الطبيب حسب التخصص أو الموقع أو المواعيد المتاحة للعلاج الذي تحتاجه.',
    },
    {
      'image': 'assets/images/onboardin3.png',
      'title': 'مواعيد سهلة',
      'desc':
          'ابحث عن الطبيب حسب التخصص أو الموقع أو المواعيد المتاحة للعلاج الذي تحتاجه.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SplashBackground(),
          Positioned(
            top: -40.h,
            left: -130.w,
            child: CircleAvatar(
              radius: 180.w,
              backgroundColor: const Color(0xff0E83FC),
            ),
          ),
          PageView.builder(
            controller: _controller,
            itemCount: _pages.length,
            onPageChanged: (index) {
              setState(() => _current = index);
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(top: 100.h, left: 20.w, right: 20.w),
                child: Column(
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 150.w,
                        backgroundImage: AssetImage(_pages[index]['image']!),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    CustomText(
                      _pages[index]['title']!,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10.h),
                    CustomText(
                      _pages[index]['desc']!,
                      fontSize: 16.sp,
                      color: Colors.grey,
                      textAlign: TextAlign.center,
                    ),

                    const Spacer(),
                    CustomButton(
                      text: _current == _pages.length - 1
                          ? 'ابدأ الآن'
                          : 'التالي',
                      width: double.infinity,
                      onTap: () {
                        if (_current < _pages.length - 1) {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpView(),
                            ),
                          );
                        }
                      },
                      color: const Color(0xff0E83FC),
                      textColor: AppColors.wihteColor,
                      height: 50.h,
                      radius: 10.sp,
                    ),
                    SizedBox(height: 15.h),
                    if (_current < _pages.length - 1)
                      TextButton(
                        onPressed: () {
                          _controller.jumpToPage(_pages.length - 1);
                        },
                        child: CustomText(
                          'تخطي',
                          color: AppColors.greyColor,
                          fontSize: 16.sp,
                        ),
                      ),
                    Gap(30.h),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
