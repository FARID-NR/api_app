import 'package:api_app/common/values/colors.dart';
import 'package:api_app/pages/main_navigation/store/widget/itemKategori.dart';
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

  Widget _buildKategori(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          child: Text(
            'KATEGORI',
            style: GoogleFonts.inter(
              color: AppColors.primaryElement,
              fontSize: 12,
              fontWeight: FontWeight.w800
            ),
          ),
        ),
        SizedBox(height: 3),
        Container(
          height: 86.h,
          // width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 34, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey.withOpacity(0.5),
              width: 1
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3)
              )
            ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1
                        ),
                        borderRadius: BorderRadius.circular(4),
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/nest.png',
                          )
                        )
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Sarang Walet',
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1
                        ),
                        borderRadius: BorderRadius.circular(4),
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/perlengkapan.png',
                          )
                        )
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Perlengkapan',
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1
                        ),
                        borderRadius: BorderRadius.circular(4),
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/makanan.png',
                          )
                        )
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Pakan',
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1
                        ),
                        borderRadius: BorderRadius.circular(4),
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/obat.png',
                          )
                        )
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Kesehatan',
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

//   Widget _buildKategori() {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Container(
//         margin: EdgeInsets.only(top: 20),
//         child: Text(
//           'KATEGORI',
//           style: GoogleFonts.inter(
//             color: AppColors.primaryElement,
//             fontSize: 12,
//             fontWeight: FontWeight.w800,
//           ),
//         ),
//       ),
//       SizedBox(height: 3),
//       Container(
//         height: 86.h,
//         width: double.infinity,
//         padding: EdgeInsets.symmetric(horizontal: 34, vertical: 10),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           border: Border.all(
//             color: Colors.grey.withOpacity(0.5),
//             width: 1,
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.5),
//               spreadRadius: 2,
//               blurRadius: 5,
//               offset: Offset(0, 3),
//             ),
//           ],
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             _buildKategoriItem(
//               'assets/images/nest.png',
//               'Sarang Walet',
//             ),
//             _buildKategoriItem(
//               'assets/images/perlengkapan.png',
//               'Perlengkapan',
//             ),
//             _buildKategoriItem(
//               'assets/images/makanan.png',
//               'Pakan',
//             ),
//             _buildKategoriItem(
//               'assets/images/obat.png',
//               'Kesehatan',
//             ),
//           ],
//         ),
//       ),
//     ],
//   );
// }

// Widget _buildKategoriItem(String imagePath, String text) {
//   return Expanded(
//     child: Column(
//       children: [
//         Container(
//           height: 50,
//           width: 50,
//           decoration: BoxDecoration(
//             border: Border.all(
//               color: Colors.black,
//               width: 1,
//             ),
//             borderRadius: BorderRadius.circular(4),
//             image: DecorationImage(
//               image: AssetImage(imagePath),
//             ),
//           ),
//         ),
//         SizedBox(height: 2),
//         Text(
//           text,
//           style: GoogleFonts.inter(
//             fontSize: 10,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ],
//     ),
//   );
// }


  Widget _buildJualan(){
    return SliverPadding(
      padding: const EdgeInsets.only(top: 25, right: 21, left: 21, bottom: 2),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) => ItemKategori(),
          childCount: 6
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverPadding(
          padding: const EdgeInsets.only(top: 25, right: 21, left: 21, bottom: 2),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              _buildSearchLon(),
              _buildKategori(),
              
            ]),
          ),
        ),
            _buildJualan(),
          ],
        )
      ),
    );
  }
}