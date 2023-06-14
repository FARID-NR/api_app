import 'package:api_app/pages/main_navigation/feed/widget/dataFeeds.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/values/colors.dart';


class FeedUserItem extends StatelessWidget {
  final AppFeeds appFeedItems;

  const FeedUserItem({
    Key? key,
    required this.appFeedItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24),
      decoration: BoxDecoration(
        color: AppColors.primarySecondaryElement1,
      ),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(), // Disable scrolling of ListView
        shrinkWrap: true,
        itemCount: 1, // Only one item in the ListView
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/slider.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(width: 7),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Nur Farid Mufid NR',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          '2 jam yang lalu',
                          style: GoogleFonts.inter(
                            fontSize: 8,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF474747),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 181,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/slider.png',
                      ),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ExpandableText(
                    appFeedItems.deskripsi,
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                    ),
                    expandText: 'Baca Selengkapnya',
                    collapseText: 'Tutup',
                    maxLines: 2,
                    linkColor: Colors.black, // Customize link color if needed
                    linkStyle: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(height: 7),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            FontAwesome.thumbs_o_up,
                          ),
                          SizedBox(width: 3),
                          Text(
                            'Suka',
                            style: GoogleFonts.inter(
                              fontSize: 9,
                              fontWeight: FontWeight.w500
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            FontAwesome.commenting_o,
                          ),
                          SizedBox(width: 3),
                          Text(
                            'Komentar',
                            style: GoogleFonts.inter(
                              fontSize: 9,
                              fontWeight: FontWeight.w500
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            FontAwesome.share_square_o,
                          ),
                          SizedBox(width: 3),
                          Text(
                            'Bagikan',
                            style: GoogleFonts.inter(
                              fontSize: 9,
                              fontWeight: FontWeight.w500
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}