import 'package:api_app/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'index.dart';

class SignInPage extends GetView<SignInController> {
  final String type;
  const SignInPage({super.key, required this.type});

  Widget _buildHead(){
    return Container(
      child: Text(
        'MASUK Peternak',
        style: GoogleFonts.inter(
          color: AppColors.primaryText,
          fontWeight: FontWeight.w800,
          fontSize: 28.sp,
        ),
      ),
    );
  }

  Widget _buildHeadK(){
    return Container(
      child: Text(
        'MASUK Konsultan',
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



  Widget _buildInput({String hintText = 'Email', bool obscureText = true, bool showIcon = false, required Function(String) onChangedCallback,}){
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
                onChanged: onChangedCallback
              ),
            ),
          ),
          // if (showIcon)
          // IconButton(
          //   icon: Icon(controller.obscureText.value 
          //   ? Icons.visibility_off 
          //   : Icons.visibility),
          //   onPressed: () {
          //     controller.passwordVisibility();
          //   },
          // )
        ],
      ),
    ); 
  }

  // Widget _buildEmailInput(){
  //     return _buildInput(
  //       hintText: 'Email',
  //       obscureText: false,
  //       showIcon: false,
  //       onChangedCallback: (value){
  //         controller.state.email.value = value;
  //       }
  //     );
  // }

  Widget _buildEmailInput(BuildContext context){
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
          scrollPadding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 100,
          ),
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

  // Widget _buildPassInput(){
  //   return Obx((){
  //     return _buildInput(
  //       hintText: 'Password',
  //       obscureText: controller.obscureText.value,
  //       showIcon: true,
  //       onChangedCallback: (value) {
  //         controller.state.password.value = value;
  //       }
  //     );
  //   });
  // }

  Widget _buildPassInput(BuildContext context, {bool showIcon = false, bool isPassword = false}){
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
                scrollPadding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom + 100,
                ),
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
          // if (showIcon && isPassword)
          // IconButton(
          //   icon: Icon(
              // isPassword ? controller.getIconPassword() :controller.getIconPassword()
          //   ),
          //   onPressed: () {
          //     if (isPassword) {
          //       controller.passwordVisibility();
          //     } else {
          //       controller.newPasswordVisibility();
          //     }
          //   },
          // ),
          // if (showIcon && !isPassword)
          // IconButton(
          //   icon: Icon(
          //     controller.getIconNewPassword(),
          //   ),
          //   onPressed: () {
          //     controller.newPasswordVisibility();
          //   },
          // ),
        ],
      ),
    );
  }

  Widget _buildLupaPass(){
    return Container(
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
        'Lupa Kata Sandi ?',
        style: GoogleFonts.inter(
          fontSize: 9.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.secondaryText
        ),
       ),
      ),
    );
  }

  Widget _buildButtonLogin(){
    return Container(
      height: 45.h,
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          controller.handleEmailLogin();
        },
        style: TextButton.styleFrom(
          backgroundColor: AppColors.primaryElement,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
          'MASUK',
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
            'Belum Punya Akun ? ',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              color: AppColors.secondaryText
            ),
          ),
          GestureDetector(
            onTap: () {
              controller.navigationRegist();
            },
            child: Text(
              'Daftar',
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
    final controller = Get.put(SignInController());
    controller.typeC = type;

    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryBackground,
        resizeToAvoidBottomInset: false,
        body: 
        // CustomScrollView(
        //   slivers: [
        //     SliverPadding(
        //       padding: EdgeInsets.only(
        //         // vertical: 37.w,
        //         // horizontal: 62.w
        //         bottom: MediaQuery.of(context).viewInsets.bottom + 100,
        //         right: 62,
        //         left: 62,
        //         top: 37
        //       ),
        //       sliver: SliverList(
        //         delegate: SliverChildListDelegate(
        //           [
        //           Container(
        //           padding: EdgeInsets.only(top: 0.h, bottom: keyboardHeight),
        //           // height: MediaQuery.of(context).viewInsets.bottom,
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             mainAxisSize: MainAxisSize.min,
        //             children: [
        //               type == "peternak" ?  _buildHead() : _buildHeadK(),
        //               SizedBox(height: 86),
        //               Column(
        //                 mainAxisAlignment: MainAxisAlignment.start,
        //                 crossAxisAlignment: CrossAxisAlignment.center,
        //                 mainAxisSize: MainAxisSize.min,
        //                 children: [
        //                   _buildLogo(),
        //                   SizedBox(height: 72),
        //                   _buildEmailInput(context),
        //                   SizedBox(height: 23),
        //                   _buildPassInput(context),
        //                   SizedBox(height: 8),
        //                   _buildLupaPass(),
        //                   SizedBox(height: 15),
        //                   _buildButtonLogin(),
        //                   SizedBox(height: 18),
        //                   _buildFooter()
        //                 ],
        //               )
                      
        //             ],
        //           ),
        //         ),
        //           ]
        //         ),
        //       ),
        //     )
        //   ],
        // )
        
        
        
        SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
          physics: AlwaysScrollableScrollPhysics(),
          child: Container(
            padding: EdgeInsets.symmetric(
            vertical: 37,
            horizontal: 62
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                type == "peternak" ?  _buildHead() : _buildHeadK(), 
                SizedBox(height: 86),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildLogo(),
                      SizedBox(height: 72),
                      _buildEmailInput(context),
                      SizedBox(height: 23),
                      _buildPassInput(context),
                      SizedBox(height: 8),
                      _buildLupaPass(),
                      SizedBox(height: 15),
                      _buildButtonLogin(),
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