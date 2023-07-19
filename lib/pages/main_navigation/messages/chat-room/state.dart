import 'package:api_app/common/entities/msgcontent.dart';
import 'package:get/get.dart';

class ChatRoomState {
  RxList<Msgcontent> msgcontentList = <Msgcontent>[].obs;
  
  RxBool isloading = false.obs;
}