import 'package:api_app/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'index.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  Widget _buildAvatar(){
    return Container(
      margin: EdgeInsets.only(top: 114),
      child: Column(
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.primaryElement,
                width: 2,
              ),
            ),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/slider.png'),
            ),
          ),
          SizedBox(height: 6),
          Text(
            'Nur Farid Mufid NR',
            style: GoogleFonts.inter(
              fontSize: 24,
              fontWeight: FontWeight.w800
            ),
          ),
          SizedBox(height: 7),
          Container(
            height: 29,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.primarySecondaryElement1
            ),
            child: Text(
              'Content Creator',
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w500
              ),
            ),
          )

        ],
      ),
    );
  }


  Widget _buildPengaturan(){
    return Container(
      height: 240,
      width: double.infinity,
      margin: EdgeInsets.only(top: 50),
      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.primarySecondaryElement1
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/profile.png',
                width: 25.w,
              ),
              SizedBox(width: 11),
              Text(
                'PROFIL SAYA',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: AppColors.primaryElement
                ),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios_sharp,
                color: AppColors.primaryElement,
              )
            ],
          ),
          SizedBox(height: 13),
           Row(
            children: [
              Image.asset(
                'assets/images/pengaturan.png',
                width: 25.w,
              ),
              SizedBox(width: 11),
              Text(
                'PENGATURAN',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: AppColors.primaryElement
                ),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios_sharp,
                color: AppColors.primaryElement,
              )
            ],
          ),
          SizedBox(height: 13),
           Row(
            children: [
              Image.asset(
                'assets/images/konsult.png',
                width: 25.w,
              ),
              SizedBox(width: 11),
              Text(
                'KONSULTASI',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: AppColors.primaryElement
                ),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios_sharp,
                color: AppColors.primaryElement,
              ),
            ],
          ),
          Divider(
            color: AppColors.primaryElement,
            thickness: 1,
            height: 20,
          ),
          Row(
            children: [
              Image.asset(
                'assets/images/info.png',
                width: 25.w,
              ),
              SizedBox(width: 11),
              Text(
                'INFORMASI',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: AppColors.primaryElement
                ),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios_sharp,
                color: AppColors.primaryElement,
              )
            ],
          ),
          SizedBox(height: 13),
          GestureDetector(
            onTap: () {
              Get.defaultDialog(
                title: 'Apakah kamu yakin untuk keluar',
                content: Container(),
                onConfirm: () {
                  controller.goLogout();
                },
                onCancel: () {
                  
                },
                textConfirm: 'Confirm',
                confirmTextColor: Colors.white,
                textCancel: 'Cancel'
              );
            },
            child: Row(
              children: [
                Image.asset(
                  'assets/images/logout.png',
                  width: 25.w,
                ),
                SizedBox(width: 11),
                Text(
                  'KELUAR',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primaryElement
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: AppColors.primaryElement,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 42),
          child: Center(
            child: Column(
              children: [
                _buildAvatar(),
                _buildPengaturan()
              ],
            ),
          ),
        )
      ),
    );
  }
}