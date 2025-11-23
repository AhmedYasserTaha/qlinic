import 'package:flutter/material.dart';
import 'package:qlinic/core/shared/custom_text.dart';
import 'package:qlinic/core/shared/splash_background.dart';
import 'package:qlinic/core/utils/app_colors.dart';
import 'package:qlinic/core/utils/size_config.dart';
import 'package:qlinic/features/favourite/controller/favorites_controller.dart';
import 'package:qlinic/features/home/presentation/view/widget/speciale_doctor_card.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesController = FavoritesController();

    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        backgroundColor: Colors.white.withOpacity(0.0),
        // automaticallyImplyLeading: false,
        elevation: 0,
        title: CustomText(
          "Favourite Doctors",
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          SplashBackground(),
          ListenableBuilder(
            listenable: favoritesController,
            builder: (context, child) {
              final favorites = favoritesController.favorites;

              if (favorites.isEmpty) {
                return Center(
                  child: CustomText(
                    "No favorites yet",
                    fontSize: 16.sp,
                    color: Colors.grey,
                  ),
                );
              }

              return Padding(
                padding: EdgeInsets.all(20.w),
                child: GridView.builder(
                  itemCount: favorites.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15.h,
                    crossAxisSpacing: 15.w,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    return SpecialeDoctorCard(doctor: favorites[index]);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
