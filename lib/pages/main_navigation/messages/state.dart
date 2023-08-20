import 'package:api_app/common/entities/entities.dart';
import 'package:api_app/common/entities/message.dart';
import 'package:get/get.dart';

class MessageState {
  var head_detail = UserItem().obs;
  var pesan = Message().obs;
  RxBool tabStatus = true.obs;
  RxList<Message> msgList = <Message>[].obs;
  RxList<CallMessage> callList = <CallMessage>[].obs;
}