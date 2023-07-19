import 'package:api_app/common/routes/names.dart';
import 'package:api_app/common/values/colors.dart';
import 'package:api_app/pages/main_navigation/feed/index.dart';
import 'package:api_app/pages/main_navigation/home/index.dart';
import 'package:api_app/pages/main_navigation/messages/index.dart';
import 'package:api_app/pages/main_navigation/profile/index.dart';
import 'package:api_app/pages/main_navigation/store/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'index.dart';

class MainNavbarPage extends StatefulWidget {
  const MainNavbarPage({Key? key});

  @override
  State<MainNavbarPage> createState() => _MainNavbarPageState();
}

class _MainNavbarPageState extends State<MainNavbarPage> {
  MainNavbarController controller = Get.find<MainNavbarController>();

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(top: 5),
        height: displayWidth * .2,
        decoration: BoxDecoration(
          color: AppColors.primarySecondaryElement,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          children: [
            for (int index = 0; index < 5; index++)
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      controller.currentIndex.value = index;
                      HapticFeedback.lightImpact();
                    });
                    controller.changePage(index);
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Stack(
                    children: [
                      AnimatedContainer(
                        duration: Duration(seconds: 1),
                        curve: Curves.fastLinearToSlowEaseIn,
                        width: index == controller.currentIndex.value
                            ? displayWidth * .32
                            : displayWidth * .18,
                        alignment: Alignment.center,
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          height: index == controller.currentIndex.value
                              ? displayWidth * .18
                              : 0,
                          width: index == controller.currentIndex.value
                              ? displayWidth * .32
                              : displayWidth * .18,
                          decoration: BoxDecoration(
                            color: index == controller.currentIndex.value
                                ? AppColors.primaryElement
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      AnimatedContainer(
                        duration: Duration(seconds: 1),
                        curve: Curves.fastLinearToSlowEaseIn,
                        width: index == controller.currentIndex.value
                            ? displayWidth * .31
                            : displayWidth * .18,
                        // alignment: Alignment.center,
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  controller.listOfIcons[index],
                                  width: 40,
                                  color: index == controller.currentIndex.value
                                      ? Colors.black
                                      : Colors.black26,
                                  colorBlendMode: index == controller.currentIndex.value
                                      ? BlendMode.srcIn
                                      : BlendMode.dst,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
      body: IndexedStack(
        index: controller.currentIndex.value,
        children: controller.pages,
      ),
    );
  }

}
