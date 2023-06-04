import 'package:api_app/common/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class SignUpController extends GetxController{
  SignUpController();
  final state = SignUpState();
  var obscureText = true.obs;
  var obscureText1 = true.obs;

   // Tambahkan TextEditingController untuk mengontrol nilai teks password
  final passwordController = TextEditingController();

  void passwordVisibility(){
      obscureText.value = !obscureText.value; 
  }

  void newPasswordVisibility(){
      obscureText1.value = !obscureText1.value; 
  }

  IconData getIconPassword(){
    return obscureText.value ? Icons.visibility_off : Icons.visibility;
  }

  IconData getIconNewPassword(){
    return obscureText1.value ? Icons.visibility_off : Icons.visibility;
  }

  


  @override
  void onClose() {
    // Hapus kontroler saat tidak diperlukan lagi
    passwordController.dispose();
    super.onClose();
  }

  
}