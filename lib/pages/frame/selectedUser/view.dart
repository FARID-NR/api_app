import 'package:api_app/common/style/color.dart';
import 'package:api_app/pages/frame/login/index.dart';
import 'package:api_app/pages/frame/selectedUser/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectUser extends GetView<SelectUserController> {
  const SelectUser({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool konfitExit = await showDialog(
          context: context, 
          builder: (context) => AlertDialog(
            title: Text("Apakah Kamu mau Keluar"),
            content: Text('Apakah kamu yakin ingin keluar dari aplikasi ?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false), 
                child: Text('Tidak')
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true), 
                child: Text('Ya')
              )
            ],
          )
        );
        return konfitExit;
      },

      child: Scaffold(
        backgroundColor: AppColor.accentColor,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'MASUK SEBAGAI',
                  style: GoogleFonts.inter(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColor.secondaryText
                  ),
                ),

                SizedBox(height: 26),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const SignInPage(type: "peternak"));
                      },

                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            padding: EdgeInsets.all(25),
                            decoration: BoxDecoration(
                              color: AppColor.accent1Color,
                              borderRadius: BorderRadius.circular(15)
                            ),
                            child: Image.asset(
                              'assets/icons/peternak.png',
                              width: 50,
                              height: 50,
                            ),
                          ),
                          SizedBox(height: 8,),
                          Text(
                            'PETERNAK',
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColor.secondaryText
                            ),
                          )
                        ],
                      ),
                    ),

                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => SignInPage(type: "konsultant"));
                      },

                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            padding: EdgeInsets.all(25),
                            decoration: BoxDecoration(
                              color: AppColor.accent1Color,
                              borderRadius: BorderRadius.circular(15)
                            ),
                            child: Image.asset(
                              'assets/icons/konsultan.png'
                            ),
                          ),
                          SizedBox(height: 8,),
                          Text(
                            'KONSULTAN',
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColor.secondaryText
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ), 
    );
  }
}