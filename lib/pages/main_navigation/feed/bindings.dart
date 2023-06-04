import 'package:get/get.dart';

import 'index.dart';

class FeedBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<FeedController>(() => FeedController());
  }
}