import 'package:api_app/common/values/colors.dart';
import 'package:api_app/pages/main_navigation/messages/chat-room/widget/chatlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'index.dart';

class ChatRoomPage extends GetView<ChatRoomController> {
  const ChatRoomPage({super.key});

  AppBar _buildAppBar(){
    return AppBar(
      title: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 44.w,
                  height: 44.h,
                  child: Image.asset(
                    'assets/images/profile.png'
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22.w),
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/profile.png'
                      )
                    )
                  ),
                ),
                Positioned(
                  bottom: 5.w,
                  right: 0.w,
                  height: 14.w,
                  child: Container(
                    width: 14.w,
                    height: 14.w,
                    decoration: BoxDecoration(
                      color: AppColors.primaryElementStatus,
                      borderRadius: BorderRadius.circular(12.w),
                      border: Border.all(
                        width: 2,
                        color: AppColors.primaryBackground
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(width: 13),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ChouNR',
                style: GoogleFonts.inter(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600
                ),
              ),
              Text(
                'aktif 20 mmenit lalu',
                style: GoogleFonts.inter(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColor4
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Stack(
          children: [
            // ChatList(),
            Positioned(
              bottom: 0.h,
              child: Container(
                // color: Colors.red,
                width: 360.w,
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 270.w,
                      padding: EdgeInsets.symmetric(vertical: 1.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.w),
                        color: AppColors.primaryBackground,
                        border: Border.all(color: AppColors.primaryElement),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 220.w,
                            constraints: BoxConstraints(
                              maxHeight: 170.h,
                              minHeight: 30.h
                            ),
                            child: TextField(
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                hintText: 'Message....',
                                contentPadding: EdgeInsets.only(
                                  left: 15.w, top: 0, bottom: 0
                                ),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent
                                  )
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent
                                  )
                                ),
                                disabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent
                                  )
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent
                                  )
                                ),
                                hintStyle: const TextStyle(
                                  color: AppColors.textColor4
                                )
                              ),
                            )
                          ),
                          GestureDetector(
                            child: Container(
                              width: 40.w,
                              height: 40.w,
                              child: Image.asset(
                                'assets/icons/send.png',
                              ),
                            ),
                            onTap: () {
                              
                            },
                          ),

                        ],
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        width: 40.w,
                        height: 40.w,
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          color: AppColors.primaryElement,
                          borderRadius: BorderRadius.circular(44.w),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(1, 1)
                            )
                          ]
                        ),
                        child: Image.asset(
                          'assets/icons/add.png'
                        ),
                      ),
                      onTap: () {
                        
                      },
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              right: 20.w,
              bottom: 65.h,
              height: 90.h,
              width: 40.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Container(
                      height: 40.h,
                      width: 40.h,
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.w),
                        color: AppColors.primaryBackground,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(1, 1)
                          ),
                        ]
                      ),
                      child: Image.asset(
                        'assets/icons/file.png'
                      ),
                    ),
                    onTap: () {
                      
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      height: 40.h,
                      width: 40.h,
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.w),
                        color: AppColors.primaryBackground,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(1, 1)
                          ),
                        ]
                      ),
                      child: Image.asset(
                        'assets/icons/photo.png'
                      ),
                    ),
                    onTap: () {
                      
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}