import 'package:get/get.dart';
import 'package:api_app/common/entities/entities.dart';

class UserStore extends GetxController{
  static UserStore get to => Get.find();

  final _profile = UserItem().obs;

  UserItem get profile => _profile.value;
}