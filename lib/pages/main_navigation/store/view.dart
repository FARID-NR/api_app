import 'package:api_app/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'index.dart';

class StorePage extends GetView<StoreController> {
  const StorePage({super.key});

  Widget _buildSearchLon() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 33,
            padding: EdgeInsets.symmetric(horizontal: 11),
            decoration: BoxDecoration(
              color: AppColors.primarySecondaryElementSearch,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration.collapsed(
                      hintText: 'Cari yang anda butuhkan',
                      hintStyle: GoogleFonts.inter(
                        color: AppColors.textcolor3,
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.search),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 12),
        Icon(
          Icons.shopping_cart_outlined,
          size: 30,
        ),
        SizedBox(width: 13),
        Icon(
          FontAwesome.comments_o
        )
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25, right: 21, left: 21, bottom: 2),
              child: Column(
                children: [
                  _buildSearchLon(),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}