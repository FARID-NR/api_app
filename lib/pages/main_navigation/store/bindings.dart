import 'package:get/get.dart';

import 'index.dart';

class StoreBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<StoreController>(() => StoreController());
  }
}