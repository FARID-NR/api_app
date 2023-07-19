import 'package:api_app/common/values/colors.dart';
import 'package:api_app/pages/main_navigation/home/controller.dart';
import 'package:api_app/pages/main_navigation/home/widget/appBanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ListInfoWalet extends GetView<HomeController> {

  final AppBanner appBanner;
  const ListInfoWalet({
    super.key, required this.appBanner,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.navigationDetailKonsult();
      },
      child: Container(
        margin: EdgeInsets.only(top: 5, bottom: 5),
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 6,
          itemBuilder: (context, index) {
            return Container(
              height: 180,
              width: double.infinity,
               margin: EdgeInsets.only(top: 15),
               padding: EdgeInsets.all(10),
               decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey.withOpacity(0.5),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(7),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/slider.png',
                        ),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                  SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Prof. Nur Farid',
                          style: GoogleFonts.inter(
                            fontSize: 17,
                            fontWeight: FontWeight.bold
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Deskripsi : saya telah lama berkecimpung dalam dunia Walet',
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            fontWeight: FontWeight.w500
                          ),
                          textAlign: TextAlign.justify,
                          overflow: TextOverflow.clip,
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Biaya : Rp. 1.000.000',
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryElement
                          ),
                        ),
                        SizedBox(height: 30),
                        Align(
                          alignment: AlignmentDirectional.bottomEnd,
                          child: Container(
                            height: 30.h,
                            child: TextButton(
                              onPressed: () {
                                controller.navigationDetailKonsult();
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: AppColors.primaryElement,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              child: Text(
                                'Mulai Konsult',
                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}