import 'package:get/get.dart';

import 'index.dart';

class PostFeedBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<PostFeedController>(() => PostFeedController());
  }
}