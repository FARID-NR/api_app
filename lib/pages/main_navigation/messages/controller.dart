import 'package:api_app/common/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class MessageController extends GetxController with GetSingleTickerProviderStateMixin{
  MessageController();
  final state = MessageState();

  
  late TabController tab;

  @override
  void onInit() {
    tab = TabController(length: 2, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    tab.dispose();
    super.onClose();
  }
}