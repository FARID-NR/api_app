import 'package:api_app/common/apis/user.dart';
import 'package:api_app/common/entities/entities.dart';
import 'package:api_app/common/routes/routes.dart';
import 'package:api_app/common/store/user.dart';
import 'package:api_app/common/widgets/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'index.dart';

class SignInController extends GetxController{
  final state = SignInState();
  TextEditingController? EmailEditingController = TextEditingController();
  TextEditingController? PasswordEditingController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  SignInController();

  // login
  handleEmailLogin() async {
     String emailAddress = state.email.value;
     String password = state.password.value;

     if(emailAddress.isEmpty){
       toastInfo(msg: "Email masih kosong!");
       return;
     }
     if(password.isEmpty){
       toastInfo(msg: "Password masih kosong!");
       return;
     }
     Get.focusScope?.unfocus();
     try {
       final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
           email: emailAddress,
           password: password
       );

       if(credential.user==null) {
         toastInfo(msg: "pengguna tidak masuk.");
         return;
       }
       if(!credential.user!.emailVerified){
         toastInfo(msg: "silakan masuk untuk memverifikasi alamat email Anda");
         return;
       }
       var user = credential.user;
       if(user!=null){

         String? displayName = user.displayName;
         String? email = user.email;
         String? id = user.uid;
         String? photoUrl = user.photoURL;

         LoginRequestEntity loginPageListRequestEntity = new LoginRequestEntity();
         loginPageListRequestEntity.avatar = photoUrl;
         loginPageListRequestEntity.name = displayName;
         loginPageListRequestEntity.email = email;
         loginPageListRequestEntity.open_id = id;
         loginPageListRequestEntity.type = 1;
         asyncPostAllData(loginPageListRequestEntity);

       }else{
         toastInfo(msg: 'login error');
       }

     } on FirebaseAuthException catch (e) {
       if (e.code == 'pengguna tidak ditemukan') {
         print('Tidak ada pengguna yang ditemukan untuk email tersebut.');
         toastInfo(msg: "Tidak ada pengguna yang ditemukan untuk email tersebut.");
       } else if (e.code == 'kata sandi salah') {
         print('Kata sandi salah disediakan untuk pengguna itu.');
         toastInfo(msg: "Kata sandi salah disediakan untuk pengguna itu.");
       }
     }
  }
  asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
    EasyLoading.show(indicator: CircularProgressIndicator(),maskType: EasyLoadingMaskType.clear,dismissOnTap: true);
    var result = await UserAPI.Login(params: loginRequestEntity);
    print(result);
    if(result.code==0){
      await UserStore.to.saveProfile(result.data!);
      Get.offAllNamed(AppRoutes.BtnNav);
    }else{
      toastInfo(msg: 'internet error');
    }
    EasyLoading.dismiss();
  }

  @override
  void onReady() {
    super.onReady();

  }

  @override
  void dispose() {
    super.dispose();
  }
}