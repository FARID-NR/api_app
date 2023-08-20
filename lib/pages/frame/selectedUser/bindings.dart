import 'package:api_app/pages/frame/selectedUser/controller.dart';
import 'package:get/get.dart';

import 'index.dart';

class SelectUserBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<SelectUserController>(() => SelectUserController());
  }
}