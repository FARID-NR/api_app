import 'package:api_app/common/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class SplashController extends GetxController{
  SplashController();
  final title = Image.asset('assets/images/splash.png');
  final state = SplashState();

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 3), () => Get.offAllNamed(AppRoutes.SIGN_IN),);
  }
}