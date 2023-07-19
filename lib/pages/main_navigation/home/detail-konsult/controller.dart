import 'package:api_app/common/routes/routes.dart';
import 'package:api_app/pages/main_navigation/messages/chat-room/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class KonsultasiController extends GetxController{
  KonsultasiController();
  final state = KonsultasiState();

  void navigationChat(){
    Get.toNamed(AppRoutes.Chat);
  }

}