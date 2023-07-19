import 'package:api_app/common/values/colors.dart';
import 'package:api_app/pages/main_navigation/messages/widget/tabChat.dart';
import 'package:api_app/pages/main_navigation/messages/widget/tabKonsult.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'index.dart';

class MessagePage extends GetView<MessageController> {
  const MessagePage({super.key});

  Widget _buildSearchLon() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 33,
            padding: EdgeInsets.symmetric(horizontal: 11),
            decoration: BoxDecoration(
                color: AppColors.primarySecondaryElementSearch,
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration.collapsed(
                        hintText: 'Cari Konsultan',
                        hintStyle: GoogleFonts.inter(
                            color: AppColors.textcolor3,
                            fontSize: 10,
                            fontWeight: FontWeight.w400)),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.search),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildChatList(BuildContext context){
    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.77,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context,'/chat');
              },
              child: Container(
                height: 80,
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.5),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(7),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/images/slider.png',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'ChouNR',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Assalamuaikum kak, Apakah produknya tersedia?',
                            style: GoogleFonts.inter(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColor4,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '25/05/2023',
                          style: GoogleFonts.inter(
                            fontSize: 8,
                            color: AppColors.textColor4,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.primaryElement,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Text(
                            "5",
                            maxLines: 1,
                            softWrap: false,
                            style: TextStyle(
                              fontFamily: "Avenir",
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 25, right: 21, left: 21, bottom: 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchLon(),
              SizedBox(height: 15),
              Text(
                'Chat',
                style: GoogleFonts.inter(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryElement
                ),
              ),
              SizedBox(height: 10,),
              _buildChatList(context)
            ],
          ),
        )
    );
  }
}