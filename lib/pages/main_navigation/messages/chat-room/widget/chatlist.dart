import 'package:api_app/pages/main_navigation/messages/chat-room/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChatList extends GetView<ChatRoomController> {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 90.h),
      child: GestureDetector(
        child: CustomScrollView(
          controller: controller.myScrollController,
          reverse: true,
          slivers: [
            SliverToBoxAdapter(
              child: Container(),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(
                vertical: 0.w,
                horizontal: 0.w
              ),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    var item = controller.state.
                  }
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}