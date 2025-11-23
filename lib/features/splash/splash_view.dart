import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qlinic/core/shared/splash_background.dart';
import 'package:qlinic/core/utils/size_config.dart';
import 'package:qlinic/features/on_bording/onboarding_view.dart';
import 'package:qlinic/root.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (context) => Root()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context); // Initialize SizeConfig
    return Scaffold(
      body: Stack(
        children: [
          SplashBackground(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  "assets/logo.png",
                  width: 150.w,
                  height: 150.h,
                ),
              ),
              Text(
                "Qlinic",
                style: GoogleFonts.rubik(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
