import 'dart:io';

import 'package:api_app/common/entities/entities.dart';
import 'package:api_app/common/routes/routes.dart';
import 'package:api_app/common/store/store.dart';
import 'package:api_app/common/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common/apis/user.dart';
import 'index.dart';

class ProfileController extends GetxController{
  final state = ProfileState();
  TextEditingController? NameEditingController = TextEditingController();
  TextEditingController? DescriptionEditingController = TextEditingController();
  File? _photo;
  final ImagePicker _picker = ImagePicker();
  ProfileController();

  goSave() async {
    if(state.profile_detail.value.name==null || state.profile_detail.value.name!.isEmpty){
      toastInfo(msg: "name not empty!");
      return;
    }
    if(state.profile_detail.value.description==null || state.profile_detail.value.description!.isEmpty){
      toastInfo(msg: "description not empty!");
      return;
    }
    if(state.profile_detail.value.avatar==null || state.profile_detail.value.avatar!.isEmpty){
      toastInfo(msg: "avatar not empty!");
      return;
    }

    LoginRequestEntity updateProfileRequestEntity = new LoginRequestEntity();
    var userItem = state.profile_detail.value;
    updateProfileRequestEntity.avatar = userItem.avatar;
    updateProfileRequestEntity.name = userItem.name;
    updateProfileRequestEntity.description = userItem.description;
    updateProfileRequestEntity.online = userItem.online;

    var result = await UserAPI.UpdateProfile(params: updateProfileRequestEntity);
    print(result.code);
    print(result.msg);
    if(result.code==0) {
      UserItem userItem = state.profile_detail.value;
      await UserStore.to.saveProfile(userItem);
      Get.back(result:"finish");
    }
  }

  goLogout() async {

    await GoogleSignIn().signOut();
    await UserStore.to.onLogout();
  }

}