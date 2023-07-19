import 'package:api_app/common/routes/names.dart';
import 'package:api_app/common/store/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Periksa apakah Anda sudah Login
class RouteAuthMiddleware extends GetMiddleware{
  // priority Jumlah kecil memiliki prioritas tinggi
  @override
  int? priority = 0;

  RouteAuthMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    if (UserStore.to.isLogin || route == AppRoutes.Login || route == AppRoutes.INITIAL){
      return null;
    } else {
      Future.delayed(
        Duration(seconds: 2), () => Get.snackbar("Tips", "Login expired, please login again!"));
      return RouteSettings(name: AppRoutes.Login);
    }
  }
}