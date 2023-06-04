import 'package:api_app/pages/frame/splashscreen/controller.dart';
import 'package:get/get.dart';

class SplashBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}