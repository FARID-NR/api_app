import 'package:api_app/common/style/color.dart';
import 'package:api_app/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemKategori extends StatelessWidget {
  const ItemKategori({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
      },
      child: Card(
        elevation: 2,
        color: Color(0xFFE7E7E7),
        child: Column(
          children: [
            Image.asset(
              'assets/images/sarang.png'
            ),
            SizedBox(height: 5),
            Text(
              'Sarang Burung Walet 1kg',
              style: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 7),
            Text(
              'Rp 25.000.000',
              style: GoogleFonts.inter(
                color: AppColors.primaryElement,
                fontSize: 15,
                fontWeight: FontWeight.w600
              ),
            )
          ],
        ),
      ),
      
    );
  }
}