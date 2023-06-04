import 'package:api_app/common/routes/names.dart';
import 'package:api_app/common/values/colors.dart';
import 'package:api_app/pages/main_navigation/feed/index.dart';
import 'package:api_app/pages/main_navigation/home/index.dart';
import 'package:api_app/pages/main_navigation/messages/index.dart';
import 'package:api_app/pages/main_navigation/profile/index.dart';
import 'package:api_app/pages/main_navigation/store/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'index.dart';

class MainNavbarPage extends StatefulWidget {
  const MainNavbarPage({super.key});

  @override
  State<MainNavbarPage> createState() => _MainNavbarPageState();
}


class _MainNavbarPageState extends State<MainNavbarPage> {
  final controller = Get.find<MainNavbarController>();

  @override
  Widget build(BuildContext context) {

    Widget bottomNav(){
      return BottomAppBar(
        shape: CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          backgroundColor: AppColors.primarySecondaryElement,
          currentIndex: controller.currentIndex,
          onTap: (value) {
            setState(() {
              print(value);
              controller.currentIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          // selectedItemColor: AppColors.primaryElement,
          items: [
            BottomNavigationBarItem(
              icon: InkWell(
                child: Container(
                  width: 68.w,
                  height: 68.w,
                  color: controller.currentIndex == 0 ? AppColors.primaryElement : Colors.transparent,
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/icon_home.png',
                      width: 40.w,
                    ),
                  ),
                ),
              ),
              label: '',
            ),

            BottomNavigationBarItem(
              icon: InkWell(
                child: Container(
                  width: 68.w,
                  height: 68.w,
                  color: controller.currentIndex == 1 ? AppColors.primaryElement : Colors.transparent,
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/iocn_feed.png',
                      width: 40.w,
                    ),
                  ),
                ),
              ),
              label: '',
            ),

            BottomNavigationBarItem(
              icon: InkWell(
                child: Container(
                  width: 68.w,
                  height: 68.w,
                  color: controller.currentIndex == 2 ? AppColors.primaryElement : Colors.transparent,
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/icon_store.png',
                      width: 40.w,
                    ),
                  ),
                ),
              ),
              label: '',
            ),

            BottomNavigationBarItem(
              icon: InkWell(
                child: Container(
                  width: 68.w,
                  height: 68.w,
                  color: controller.currentIndex == 3 ? AppColors.primaryElement : Colors.transparent,
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/icon_chat.png',
                      width: 40.w,
                    ),
                  ),
                ),
              ),
              label: '',
            ),

            BottomNavigationBarItem(
              icon: InkWell(
                child: Container(
                  width: 68.w,
                  height: 68.w,
                  color: controller.currentIndex == 4 ? AppColors.primaryElement : Colors.transparent,
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/icon_profile.png',
                      width: 40.w,
                    ),
                  ),
                ),
              ),
              label: '',
            ),
          ],
          
        ),
      );
    }

    Widget body(){
      switch (controller.currentIndex){
        case 0 :
          return HomePage();
        
        case 1 : 
          return FeedPage();

        case 2 : 
          return StorePage();

        case 3 :
          return MessagePage();

        case 4 :
          return ProfilePage(); 

        default :
        return HomePage();
      }
    }

    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      bottomNavigationBar: bottomNav(),
      body: body(),
    );
  }
}