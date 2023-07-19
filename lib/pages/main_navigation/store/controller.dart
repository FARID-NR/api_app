import 'package:api_app/common/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class StoreController extends GetxController{
  StoreController();
  final state = StoreState();

  void navigationDetailProduk(){
    Get.toNamed(AppRoutes.DetailProduk);
  }
}