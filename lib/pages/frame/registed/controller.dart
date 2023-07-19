import 'package:api_app/common/routes/routes.dart';
import 'package:api_app/common/values/server.dart';
import 'package:api_app/common/widgets/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class SignUpController extends GetxController{
  final state = SignUpState();
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController? UserNameEditingController = TextEditingController();
  TextEditingController? EmailEditingController = TextEditingController();
  TextEditingController? PhoneEditingController = TextEditingController();
  TextEditingController? PasswordEditingController = TextEditingController();
  SignUpController();
  var obscureText = true.obs;
  var obscureText1 = true.obs;

  handleEmailRegister() async {
    String UserName = state.username.value;
    String emailAddress = state.email.value;
    String phone = state.phone_number.value;
    String password = state.password.value;
    String checkPass = state.checkpassword.value;

    if(UserName.isEmpty){
      toastInfo(msg: "Nama masih kosong");
      return;
    }
    if(emailAddress.isEmpty){
      toastInfo(msg: "Email masih kosong");
      return;
    }
    if(phone.isEmpty){
      toastInfo(msg: "No. HP masih kosong");
      return;
    }
    if(password.isEmpty){
      toastInfo(msg: "password masih kosong");
      return;
    }
    if(checkPass.isEmpty){
      toastInfo(msg: "password masih kosong");
      return;
    }
    Get.focusScope?.unfocus();
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress, 
        password: password
      );
      print(credential);
      if(credential != null){
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(UserName);
        String photoURL = "${SERVER_API_URL}uploads/default.png";
        await credential.user?.updatePhotoURL(photoURL);
        toastInfo(msg: "Sebuah email telah dikirimkan ke email Anda yang terdaftar. Untuk mengaktifkan akun Anda, silahkan buka link dari email tersebut.");
        Get.back();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'kata kunci lemah') {
        print('Sandi yang diberikan terlalu lemah.');
        toastInfo(msg: 'Sandi yang diberikan terlalu lemah.');
      } else if (e.code == 'email-sudah-di-gunakan'){
        print('Akun sudah ada untuk email itu.');
        toastInfo(msg: 'Akun sudah ada untuk email itu.');
      }
    }catch (e) {
      print(e);
    }
  }

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
  void onReady(){
    super.onReady();
  }

  @override
  void dispose(){
    super.dispose();
  } 
}