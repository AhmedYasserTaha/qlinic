import 'package:flutter/material.dart';
import 'package:qlinic/core/models/doctor_model.dart';
import 'package:qlinic/core/shared/custom_text.dart';
import 'package:qlinic/core/utils/size_config.dart';
import 'package:qlinic/features/favourite/controller/favorites_controller.dart';
import 'package:qlinic/features/home/presentation/view/doctor_details_view.dart';

class SpecialeDoctorCard extends StatelessWidget {
  final DoctorModel doctor;

  const SpecialeDoctorCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    final cardWidth = 130.w;
    final profileSize = cardWidth * 0.6;
    final favoritesController = FavoritesController();

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DoctorDetailsView(doctor: doctor),
          ),
        );
      },
      child: SizedBox(
        width: cardWidth,
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.sp),
          ),
          elevation: 4.0,
          child: Padding(
            padding: EdgeInsets.all(8.0.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // --- Header Row ---
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ListenableBuilder(
                        listenable: favoritesController,
                        builder: (context, child) {
                          final isFav = favoritesController.isFavorite(doctor);
                          return GestureDetector(
                            onTap: () {
                              favoritesController.toggleFavorite(doctor);
                            },
                            child: Icon(
                              isFav ? Icons.favorite : Icons.favorite_border,
                              color: isFav ? Colors.red : Colors.grey,
                              size: 16.sp,
                            ),
                          );
                        },
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 16.sp),
                          SizedBox(width: 4.w),
                          CustomText(
                            doctor.rating.toString(),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: profileSize * 0.1),

                // --- Profile Image ---
                Container(
                  width: profileSize,
                  height: profileSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(doctor.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                SizedBox(height: profileSize * 0.15),

                // --- Doctor Name ---
                CustomText(
                  doctor.name,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  textAlign: TextAlign.center,
                ),

                // --- Rate/Price ---
                CustomText(
                  '\$ ${doctor.price} / hours',
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
