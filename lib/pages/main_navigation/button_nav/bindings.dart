import 'package:get/get.dart';

import 'index.dart';

class MainNavbarBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<MainNavbarController>(() => MainNavbarController());
  }
}