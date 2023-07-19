import 'package:api_app/common/values/colors.dart';
import 'package:api_app/pages/main_navigation/home/widget/appBanner.dart';
import 'package:api_app/pages/main_navigation/home/widget/bannerItem.dart';
import 'package:api_app/pages/main_navigation/home/widget/indicator.dart';
import 'package:api_app/pages/main_navigation/home/widget/listInfoWalet.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'index.dart';

class DetailKonsultPage extends GetView<KonsultasiController> {
  const DetailKonsultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFB1A274),
        appBar: AppBar(
          backgroundColor: AppColors.primaryBackground,
          title: Row(
            children: [
              Text(
                'KONSULTASI',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w800
                ),
              )
            ],
          ),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.only(top: 28),
            child: Column(
              children: [
                Container(
                  width: 195,
                  height: 195,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.primaryElement,
                      width: 2,
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/slider.png'),
                  ),
                ),
                SizedBox(height: 28,),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 41),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBackground,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0)
                      )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'NUR FARID MUFID NR',
                          style: GoogleFonts.inter(
                            color: AppColors.primaryText,
                            fontSize: 24,
                            fontWeight: FontWeight.w800
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'KONSULTAN SARANG WALET',
                          style: GoogleFonts.inter(
                            color: AppColors.primaryText,
                            fontSize: 10,
                            fontWeight: FontWeight.w800
                          ),
                        ),
                        SizedBox(height: 43),
                        Text(
                          'Deskripsi Konsultan',
                          style: GoogleFonts.inter(
                            color: AppColors.primaryText,
                            fontSize: 16,
                            fontWeight: FontWeight.w800
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(                          
                          'Saya adalah seorang konsultan burung walet yang berasal dari Polewali Mandar. Saya sekarang memiliki 50 kandang walet diberbagai kota di Sulawesi Selatan. Saya akan berbagi ilmu tentang bagaimana cara membuat dan merawat sarang walet sehingga bisa mendapatkan untung yang banyak. \n Saya sekarang ini sebagai konsultan budidaya walet, telah banyak menerbitkan buku teknik budidaya walet, berisi ilmu empirik hasil penelitian dan solusi atas problem walet dan bermacam kasus budidaya walet. Suara pemanggil walet juga telah banyak saya ciptakan. Saya juga telah menerbitkan buku 18 desain gedung walet paket hemat, buku 88 strategi sukses walet, dan buku solusi permasalahan budididaya walet. Tidak sedikit member saya di seluruh Nusantara ini yang telah sukses budidaya burung walet.',
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 45.h,
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () {
                              controller.navigationChat();
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: AppColors.primaryElement,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: Text(
                              'KONSULTASI',
                              style: GoogleFonts.inter(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}