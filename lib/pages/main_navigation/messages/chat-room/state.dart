import 'package:api_app/common/entities/msgcontent.dart';
import 'package:get/get.dart';

class ChatRoomState {
  RxList<Msgcontent> msgcontentList = <Msgcontent>[].obs;

  var to_token = "".obs;
  var to_name = "".obs;
  var to_avatar = "".obs;
  var to_online = "".obs;

  RxBool more_status = false.obs;
  RxBool isloading = false.obs;

}