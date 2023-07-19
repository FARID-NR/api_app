import 'package:api_app/common/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class HomeController extends GetxController{
  HomeController();
  final state = HomeState();

  final selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // Inisialisasi nilai selectedIndex di sini
    selectedIndex.value = 0;
  }

  void navigationDetailKonsult(){
    Get.toNamed(AppRoutes.DetailKonsult);
  }

}