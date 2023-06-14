import 'package:api_app/common/values/colors.dart';
import 'package:api_app/pages/main_navigation/feed/widget/dataFeeds.dart';
import 'package:api_app/pages/main_navigation/feed/widget/itemFeed.dart';
import 'package:api_app/pages/main_navigation/home/widget/appBanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'index.dart';

class FeedPage extends GetView<FeedController> {

  const FeedPage({Key? key});

  Widget _buildSearchLon() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 33,
            padding: EdgeInsets.symmetric(horizontal: 11),
            decoration: BoxDecoration(
              color: AppColors.primarySecondaryElementSearch,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration.collapsed(
                      hintText: 'Cari yang anda butuhkan',
                      hintStyle: GoogleFonts.inter(
                        color: AppColors.textcolor3,
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.search),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 12),
        Icon(
          Icons.notifications_active_outlined,
          size: 35,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 25, right: 21, left: 21, bottom: 2),
              child: Column(
                children: [
                  _buildSearchLon(),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: appFeedList.length,
                    itemBuilder: (context, index) {
                      return FeedUserItem(appFeedItems: appFeedList[index]);
                    },
                  ),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

