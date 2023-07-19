import 'package:api_app/common/values/colors.dart';
import 'package:api_app/pages/main_navigation/store/widget/itemKategori.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'index.dart';

class PostFeedPage extends GetView<PostFeedController> {
  const PostFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Buat Postingan',
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
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 21),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 47.w,
                        height: 47.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.h),
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/slider.png',
                            ),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'ChouNR',
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w800
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 19),
                  Text(
                    'Apa yang anda pikirkan ?',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: AppColors.textColor4
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
                        child: Image.asset(
                          'assets/icons/camera.png',
                          width: 30.w,
                          height: 30.h,
                        )
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
                        child: Image.asset(
                          'assets/icons/video.png',
                          width: 30.w,
                          height: 30.h,
                        )
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        width: 207.w,
                        height: double.infinity,
                        // padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          color: AppColors.primaryElement,
                          borderRadius: BorderRadius.circular(44.w),
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
                            'Kirim Postingan',
                            style: GoogleFonts.inter(
                              color: AppColors.primaryBackground,
                              fontSize: 16,
                              fontWeight: FontWeight.w800
                            ),
                          ),
                        )
                      ),
                      onTap: () {
                        controller.navigationbackFeed();
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