import 'package:api_app/common/entities/entities.dart';
import 'package:api_app/common/style/color.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget ChatRightList(Msgcontent item) {

  var imagePath = null;

  // if(item.type == "image"){
  //   imagePath = item.content?.replaceAll("http://localhost/", SERVER_API_URL);
  // }

  return Container(
    padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 20.w),
    child: Row(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 250.w,
            minHeight: 40.w 
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColor.warningColor,
                  borderRadius: BorderRadius.all(Radius.circular(5.w))
                ),
                padding: EdgeInsets.only(
                  top: 10.w, bottom: 10.w, left: 10.w, right: 10.w
                ),
                child: item.type == "text" ? Text("${item.content}",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColor.primaryText
                  ),
                ) : ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 90.w
                  ),
                  child: GestureDetector(
                    child: CachedNetworkImage(
                      imageUrl: imagePath!,
                    ),
                    onTap: () {
                      
                    },
                  ),
                )
              )
            ],
          ),
        )
      ],
    ),
  );
}