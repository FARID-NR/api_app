import 'package:api_app/common/routes/routes.dart';
import 'package:api_app/pages/main_navigation/feed/view.dart';
import 'package:api_app/pages/main_navigation/home/view.dart';
import 'package:api_app/pages/main_navigation/messages/view.dart';
import 'package:api_app/pages/main_navigation/profile/view.dart';
import 'package:api_app/pages/main_navigation/store/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class MainNavbarController extends GetxController{
  MainNavbarController();
  final state = MainNavbarState();

  var currentIndex = 0.obs;

  List<String> listOfIcons = [
    'assets/images/icon_home.png',
    'assets/images/iocn_feed.png',
    'assets/images/icon_store.png',
    'assets/icons/consult.png',
    'assets/images/icon_profile.png',
  ];

  List<String> listOfStrings = [
    'Home',
    'Feed',
    'Store',
    'Message',
    'Profile'
  ];

  final List<Widget> pages = [
    HomePage(),
    FeedPage(),
    StorePage(),
    MessagePage(),
    ProfilePage()
  ];

  void changePage(int index) {
    currentIndex.value = index;
  }
  
  
}