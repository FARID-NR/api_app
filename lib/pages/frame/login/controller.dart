import 'package:api_app/common/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class SignInController extends GetxController{
  SignInController();
  final state = SignInState();
  var obscureText = true.obs;

   // Tambahkan TextEditingController untuk mengontrol nilai teks password
  final passwordController = TextEditingController();

  void passwordVisibility(){
    obscureText.value = !obscureText.value;
  }

  void navigationHome(){
    Get.offAllNamed(AppRoutes.BtnNav);
  }

  void navigationRegist(){
    Get.toNamed(AppRoutes.Register);
  }

  @override
  void onClose() {
    // Hapus kontroler saat tidak diperlukan lagi
    passwordController.dispose();
    super.onClose();
  }

  
}