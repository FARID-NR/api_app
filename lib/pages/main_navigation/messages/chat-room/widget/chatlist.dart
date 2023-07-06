import 'package:api_app/pages/main_navigation/messages/chat-room/controller.dart';
import 'package:api_app/pages/main_navigation/messages/chat-room/widget/chat_left_list.dart';
import 'package:api_app/pages/main_navigation/messages/chat-room/widget/chat_right_list.dart';
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
                    var item = controller.state.msgcontentList[index];
                    if(controller.token == item.token){
                      return ChatRightList(item);
                    }
                    return ChatLeftList(item);
                  },
                  childCount: controller.state.msgcontentList.length,
                ),
              ),
            ),

            SliverPadding(
              padding: EdgeInsets.symmetric(
                vertical: 0.w,
                horizontal: 0.w
              ),
              sliver: SliverToBoxAdapter(
                child: controller.state.isloading.value ? const Align(
                  alignment: Alignment.center,
                  child: Text('loading...'),
                ) : Container()
              ),
            )
          ],
        ),
        onTap: () {
          
        },
      ),
    );
  }
}