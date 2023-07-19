import 'package:api_app/common/routes/names.dart';
import 'package:api_app/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'index.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({super.key});

  Widget _buildHead(){
    return Container(
      child: Text(
        'DAFTAR',
        style: GoogleFonts.inter(
          color: AppColors.primaryText,
          fontWeight: FontWeight.w800,
          fontSize: 28.sp,
        ),
      ),
    );
  }

  Widget _buildLogo(){
    return Container(
      child: Image.asset(
        'assets/images/logo.png',
        width: 117,
        height: 129,
      ),
    );
  }


  Widget _buildInput({String hintText = 'Email', bool obscureText = true, bool showIcon = false, bool isPassword = false, required Function(String) onChangedCallback}){
    return Container(
      height: 40.h,
      padding: EdgeInsets.symmetric(
        horizontal: 21,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.primarySecondaryElement,
          width: 2
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextFormField(
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryText
                ),
                obscureText: obscureText,
                decoration: InputDecoration.collapsed(
                  hintText: hintText,
                  hintStyle: GoogleFonts.inter(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.hintText
                   ), 
                ),
                onChanged: (value) {
                  controller.state.username.value = value;
                },
              ),
            ),
          ),
          if (showIcon && isPassword)
          IconButton(
            icon: Icon(
              isPassword ? controller.getIconPassword() :controller.getIconPassword()
            ),
            onPressed: () {
              if (isPassword) {
                controller.passwordVisibility();
              } else {
                controller.newPasswordVisibility();
              }
            },
          ),
          if (showIcon && !isPassword)
          IconButton(
            icon: Icon(
              controller.getIconNewPassword(),
            ),
            onPressed: () {
              controller.newPasswordVisibility();
            },
          ),
        ],
      ),
    ); 
  }

  // Widget _buildNameInput(){
  //     return _buildInput(
  //       hintText: 'Nama Lengkap',
  //       obscureText: false,
  //       showIcon: false,
  //       onChangedCallback: (value) {
  //         controller.state.username.value = value;
  //       },
  //     );
  // }

  Widget _buildNama(){
    return Container(
      height: 40.h,
      padding: EdgeInsets.symmetric(
        horizontal: 21,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.primarySecondaryElement,
          width: 2
        ),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: TextFormField(
          style: GoogleFonts.inter(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryText
          ),
          decoration: InputDecoration.collapsed(
            hintText: 'Username',
            hintStyle: GoogleFonts.inter(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.hintText
            ), 
          ),
          onChanged: (value) {
            controller.state.username.value = value;
          },
        ),
      ),
    );
  }


  // Widget _buildEmailInput(){
  //     return _buildInput(
  //       hintText: 'Email',
  //       obscureText: false,
  //       showIcon: false,
  //       onChangedCallback: (value) {
  //         controller.setEmail(value);
  //       },
  //     );
  // }

  Widget _buildEmailInput(){
    return Container(
      height: 40.h,
      padding: EdgeInsets.symmetric(
        horizontal: 21,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.primarySecondaryElement,
          width: 2
        ),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: TextFormField(
          style: GoogleFonts.inter(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryText
          ),
          decoration: InputDecoration.collapsed(
            hintText: 'Email',
            hintStyle: GoogleFonts.inter(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.hintText
            ), 
          ),
          onChanged: (value) {
            controller.state.email.value = value;
          },
        ),
      ),
    );
  }


  // Widget _buildHpInput(){
  //     return _buildInput(
  //       hintText: 'No. HP',
  //       obscureText: false,
  //       showIcon: false,
  //       onChangedCallback: (value) {
  //         controller.state.phone_number.value = value;
  //       },
  //     );
  // }

  Widget _buildHpInput(){
    return Container(
      height: 40.h,
      padding: EdgeInsets.symmetric(
        horizontal: 21,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.primarySecondaryElement,
          width: 2
        ),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: TextFormField(
          style: GoogleFonts.inter(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryText
          ),
          decoration: InputDecoration.collapsed(
            hintText: 'No. HP',
            hintStyle: GoogleFonts.inter(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.hintText
            ), 
          ),
          onChanged: (value) {
            controller.state.phone_number.value = value;
          },
        ),
      ),
    );
  }


  // Widget _buildPassInput(){
  //   return Obx((){
  //     return _buildInput(
  //       hintText: 'Password',
  //       obscureText: controller.obscureText.value,
  //       showIcon: true,
  //       isPassword: true,
  //       onChangedCallback: (value) {
  //         controller.state.password.value = value;
  //       },
  //     );
  //   });
  // }

  Widget _buildPassInput({bool showIcon = false, bool isPassword = false}){
    return Container(
      height: 40.h,
      padding: EdgeInsets.symmetric(
        horizontal: 21,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.primarySecondaryElement,
          width: 2
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextFormField(
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryText
                ),
                obscureText: true,
                decoration: InputDecoration.collapsed(
                  hintText: 'Password',
                  hintStyle: GoogleFonts.inter(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.hintText
                   ), 
                ),
                onChanged: (value) {
                  controller.state.password.value = value;
                },
              ),
            ),
          ),
          if (showIcon && isPassword)
          IconButton(
            icon: Icon(
              isPassword ? controller.getIconPassword() :controller.getIconPassword()
            ),
            onPressed: () {
              if (isPassword) {
                controller.passwordVisibility();
              } else {
                controller.newPasswordVisibility();
              }
            },
          ),
          if (showIcon && !isPassword)
          IconButton(
            icon: Icon(
              controller.getIconNewPassword(),
            ),
            onPressed: () {
              controller.newPasswordVisibility();
            },
          ),
        ],
      ),
    );
  }

  // Widget _buildNewPassInput(){
  //   return Obx((){
  //     return _buildInput(
  //       hintText: 'Konfirmasi Password',
  //       obscureText: controller.obscureText1.value,
  //       showIcon: true,
  //       isPassword: false,
  //       onChangedCallback: (value) {
  //         controller.state.checkpassword.value = value;
  //       },
  //     );
  //   });
  // }

  Widget _buildNewPassInput({bool showIcon = true, bool isPassword = false}){
    return Container(
      height: 40.h,
      padding: EdgeInsets.symmetric(
        horizontal: 21,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.primarySecondaryElement,
          width: 2
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextFormField(
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryText
                ),
                obscureText: true,
                decoration: InputDecoration.collapsed(
                  hintText: 'Password',
                  hintStyle: GoogleFonts.inter(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.hintText
                   ), 
                ),
                onChanged: (value) {
                  controller.state.checkpassword.value = value;
                },
              ),
            ),
          ),
          if (showIcon && isPassword)
          IconButton(
            icon: Icon(
              isPassword ? controller.getIconPassword() :controller.getIconPassword()
            ),
            onPressed: () {
              if (isPassword) {
                controller.passwordVisibility();
              } else {
                controller.newPasswordVisibility();
              }
            },
          ),
          if (showIcon && !isPassword)
          IconButton(
            icon: Icon(
              controller.getIconNewPassword(),
            ),
            onPressed: () {
              controller.newPasswordVisibility();
            },
          ),
        ],
      ),
    );
  }


  Widget _buildButtonDaftar(){
    return Container(
      height: 45.h,
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          controller.handleEmailRegister();
        },
        style: TextButton.styleFrom(
          backgroundColor: AppColors.primaryElement,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
          'DAFTAR',
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildFooter(){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sudah Punya Akun ? ',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              color: AppColors.secondaryText
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Text(
              'Masuk',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w700,
                color: AppColors.secondaryText
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryBackground,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
            vertical: 37.h,
            horizontal: 62.w
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHead(),
                SizedBox(height: 31),
                Center(
                  child: Column(
                    children: [
                      _buildLogo(),
                      SizedBox(height: 71),
                      _buildNama(),
                      SizedBox(height: 23),
                      _buildEmailInput(),
                      SizedBox(height: 23),
                      _buildHpInput(),
                      SizedBox(height: 23),
                      _buildPassInput(),
                      SizedBox(height: 23),
                      _buildNewPassInput(),
                      SizedBox(height: 40),
                      _buildButtonDaftar(),
                      SizedBox(height: 18),
                      _buildFooter()
                    ],
                  ),
                )
                
              ],
            ),
          ),
        ),
        
      ),
    );
  }
}