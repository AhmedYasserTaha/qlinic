import 'package:flutter/material.dart';
import 'package:qlinic/core/shared/splash_background.dart';
import 'package:qlinic/core/utils/size_config.dart';
import 'package:qlinic/features/splash/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        scaffoldBackgroundColor: Colors.transparent,
      ),
      builder: (context, child) {
        SizeConfig.init(context);
        return Stack(
          children: [
            Container(color: Colors.white),
            const SplashBackground(),
            child!,
          ],
        );
      },
      home: SplashView(),
    );
  }
}
