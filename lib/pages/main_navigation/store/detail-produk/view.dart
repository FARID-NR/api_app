import 'package:api_app/common/values/colors.dart';
import 'package:api_app/pages/main_navigation/store/widget/itemKategori.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'index.dart';

class DetailProdukPage extends GetView<DetailProdukController> {
  const DetailProdukPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text(
                'Produk',
                style: GoogleFonts.inter(
                  color: AppColors.primaryText,
                  fontSize: 16,
                  fontWeight: FontWeight.w800
                ),
              )
            ],
          ),
        ),
        body: Stack(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/slider.png',
                  ),
                  Container(
                    width: double.infinity,
                    color: Color(0xFFD9D9D9),
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 21),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ampli Wallet ACT LD 3131T 3 player 6 chanel',
                          overflow: TextOverflow.clip,
                          style: GoogleFonts.inter(
                            color: AppColors.primaryText,
                            fontSize: 18,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text(
                          'Rp. 1.375.000',
                          style: GoogleFonts.inter(
                            color: AppColors.primaryElement,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 19),
                        Text(
                          '0 Terjual',
                          style: GoogleFonts.inter(
                            color: AppColors.primaryText,
                            fontSize: 10,
                            fontWeight: FontWeight.w600
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      color: Color(0xFFECECEC),
                      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 21),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Deskripsi',
                            style: GoogleFonts.inter(
                              color: AppColors.primaryText,
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Ampli walet merk Achitech type LD3131-T \nSpesifikasi : \n3 \nplayer Masing-masing Player ada 2 Chanel dilengkapi setelan middle dan treble\n1 Timer untuk masing-masing Player, total ada 3 timer \nDilengkapi konektor aki/dc sebagai backup dan charger\nDilengkapi kipas pendingin',
                            style: GoogleFonts.inter(
                              color: AppColors.primaryText,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 0.h,
              child: Container(
                color: AppColors.primaryBackground,
                width: 360.w,
                height: 62.h,
                padding: EdgeInsets.only(left: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: Container(
                        child: Icon(
                          FontAwesome.comments_o,
                          size: 40,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: VerticalDivider(
                        width: 1,
                        thickness: 2,
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          size: 40,
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        width: 207.w,
                        height: double.infinity,
                        // padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          color: AppColors.primaryElement,
                          // borderRadius: BorderRadius.circular(44.w),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(1, 1)
                            )
                          ]
                        ),
                        child: Center(
                          child: Text(
                            'Beli Sekarang',
                            style: GoogleFonts.inter(
                              color: AppColors.primaryBackground,
                              fontSize: 16,
                              fontWeight: FontWeight.w800
                            ),
                          ),
                        )
                      ),
                      onTap: () {
                        
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}