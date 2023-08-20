import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/routes.dart';
import '../store/store.dart';

/// Halaman selamat datang pertama
class RouteWelcomeMiddleware extends GetMiddleware {
  // priority Jumlah kecil memiliki prioritas tinggi
  @override
  int? priority = 0;

  RouteWelcomeMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route){
    print(ConfigStore.to.isFirstOpen);
    if (ConfigStore.to.isFirstOpen == false) {
      return null;
    } else if (UserStore.to.isLogin == true) {
      return RouteSettings(name: AppRoutes.BtnNav);
    } else {
      return RouteSettings(name: AppRoutes.INITIAL);
    }
  }
}