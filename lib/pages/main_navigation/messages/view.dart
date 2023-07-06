import 'package:api_app/common/values/colors.dart';
import 'package:api_app/pages/main_navigation/messages/widget/tabChat.dart';
import 'package:api_app/pages/main_navigation/messages/widget/tabKonsult.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'index.dart';

class MessagePage extends GetView<MessageController> {
  const MessagePage({super.key});

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
                        hintText: 'Cari Konsultan',
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
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: controller.tab.length,
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.only(top: 25, right: 21, left: 21, bottom: 2),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildSearchLon(),
                TabBar(
                  controller: controller.tab,
                  indicatorColor: AppColors.primaryElement,
                  labelColor: AppColors.primaryElement,
                  unselectedLabelColor: Colors.black,
                  indicator: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(
                        color: AppColors.primaryElement,
                        width: 3,
                      ),
                    ),
                  ),
                  labelStyle: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  tabs: <Widget>[
                    Tab(text: 'Konsultan'),
                    Tab(text: 'Chat'),
                  ],
                ),
                SizedBox(height: 10),
                Expanded(
                  child: Container(
                     height: MediaQuery.of(context).size.height * 0.7,
                    child: TabBarView(
                      controller: controller.tab,
                      children: [
                        TapKonsultan(),
                        TabChat(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}