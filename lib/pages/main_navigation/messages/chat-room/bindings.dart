import 'package:get/get.dart';

import 'index.dart';

class ChatRoomBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<ChatRoomController>(() => ChatRoomController());
  }
}