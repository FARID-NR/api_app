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

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  Widget _buildSearchLon() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 33,
            padding: EdgeInsets.symmetric(horizontal: 11),
            decoration: BoxDecoration(
                color: AppColors.primarySecondaryElementSearch,
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration.collapsed(
                        hintText: 'Cari yang anda butuhkan',
                        hintStyle: GoogleFonts.inter(
                            color: AppColors.textcolor3,
                            fontSize: 10,
                            fontWeight: FontWeight.w400)),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.search),
                )
              ],
            ),
          ),
        ),
        SizedBox(width: 12),
        Icon(
          Icons.notifications_active_outlined,
          size: 35,
        )
      ],
    );
  }

  Widget _buildSlider() {
    final PageController pageController =
        PageController(initialPage: controller.selectedIndex.value);
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16.0),
          height: 138,
          decoration: BoxDecoration(color: Colors.white),
          child: PageView.builder(
            controller: pageController,
            onPageChanged: (index) {
              controller.selectedIndex.value = index;
            },
            itemCount: appBannerList.length,
            itemBuilder: (context, index) {
              return TweenAnimationBuilder(
                duration: const Duration(milliseconds: 350),
                tween: Tween(begin: 0, end: 0),
                curve: Curves.ease,
                child: BannerItem(
                  appBanner: appBannerList[index],
                  ),
                  builder:  (context, value, child) {
                    return Transform.scale(
                      scale: 1,
                      child: child,
                    );
                  },
              );
            },
          ),
        ),
        Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    appBannerList.length,
                    (index) => Indicator(
                          isActive: controller.selectedIndex.value == index
                              ? true
                              : false,
                        ))
              ],
            ))
      ],
    );
  }

  Widget _buildItemBuilder(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
          child: Container(
            margin: EdgeInsets.only(top: 31),
            padding: EdgeInsets.symmetric(horizontal: 5),
            height: 26,
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15)
              )
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'INFORMASI KONSULTAN',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 9,
                  fontWeight: FontWeight.w900
                ),
              ),
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            return ListInfoWalet(appBanner: appBannerList[index]);
          },
        )

      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 25, right: 21, left: 21, bottom: 2),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSearchLon(), 
                _buildSlider(),  
                _buildItemBuilder()
               ],
              ),
             ),
            )
          ),
    );
  }
}