import 'package:api_app/common/store/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class ChatRoomController extends GetxController with GetSingleTickerProviderStateMixin{
  ChatRoomController();
  final state = ChatRoomState();
  final token = UserStore.to.profile.token;

  ScrollController myScrollController = ScrollController();
}