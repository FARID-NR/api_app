import 'package:api_app/common/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class ChatRoomController extends GetxController with GetSingleTickerProviderStateMixin{
  ChatRoomController();
  final state = ChatRoomState();

  ScrollController myScrollController = ScrollController();
}