import 'package:api_app/common/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class FeedController extends GetxController{
  FeedController();
  final state = FeedState();

  void postfeed() {
    Get.toNamed(AppRoutes.PostFeed);
  }

}