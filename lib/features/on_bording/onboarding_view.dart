import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qlinic/core/shared/custom_button.dart';
import 'package:qlinic/core/shared/custom_text.dart';
import 'package:qlinic/core/shared/splash_background.dart';
import 'package:qlinic/core/utils/app_colors.dart';
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
            top: -40,
            left: -130,
            child: CircleAvatar(
              radius: 180,
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
                padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
                child: Column(
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 150,
                        backgroundImage: AssetImage(_pages[index]['image']!),
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomText(
                      _pages[index]['title']!,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    CustomText(
                      _pages[index]['desc']!,
                      fontSize: 16,
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
                      height: 50,
                      radius: 10,
                    ),
                    const SizedBox(height: 15),
                    if (_current < _pages.length - 1)
                      TextButton(
                        onPressed: () {
                          _controller.jumpToPage(_pages.length - 1);
                        },
                        child: CustomText(
                          'تخطي',
                          color: AppColors.greyColor,
                          fontSize: 16,
                        ),
                      ),
                    Gap(30),
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
