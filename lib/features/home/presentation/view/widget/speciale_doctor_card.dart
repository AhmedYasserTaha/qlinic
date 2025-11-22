import 'package:flutter/material.dart';
import 'package:qlinic/core/shared/custom_text.dart';

class SpecialeDoctorCard extends StatelessWidget {
  const SpecialeDoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cardWidth = MediaQuery.of(context).size.width * 0.35;
    final profileSize = cardWidth * 0.6;

    return SizedBox(
      width: cardWidth,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // --- Header Row ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(Icons.favorite, color: Colors.red, size: 16),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        SizedBox(width: 4),
                        CustomText(
                          "4.9",
                          fontSize: 12,
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
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("assets/images/doc2.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(height: profileSize * 0.15),

              // --- Doctor Name ---
              const CustomText(
                "Dr. Strain",
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                textAlign: TextAlign.center,
              ),

              // --- Rate/Price ---
              const CustomText(
                '\$ 22.00 / hours',
                fontSize: 11,
                fontWeight: FontWeight.w300,
                color: Colors.grey,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
