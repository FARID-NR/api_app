import 'package:api_app/common/values/colors.dart';
import 'package:api_app/pages/main_navigation/home/widget/appBanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:google_fonts/google_fonts.dart';

class ListInfoWalet extends StatelessWidget {

  final AppBanner appBanner;
  const ListInfoWalet({
    super.key, required this.appBanner,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
      },
      child: Container(
        height: 66,
        width: double.infinity,
        margin: EdgeInsets.only(top: 16),
        padding: EdgeInsets.symmetric(horizontal: 9, vertical: 5),
        decoration: BoxDecoration(
          color: AppColors.primarySecondaryElement1,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    appBanner.thumbnailUrl,
                  ),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  strokeAlign: 1
                )
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appBanner.judul,
                    style: GoogleFonts.inter(
                      fontSize: 8,
                      fontWeight: FontWeight.w800
                    ),
                  ),
                  Linkify(
                    onOpen: (link) {
                      
                    },
                    text: appBanner.deskripsi,
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.inter(
                      fontSize: 6,
                      fontWeight: FontWeight.w500,
                      height: 1.5
                    ),
                    linkifiers: [
                      UrlLinkifier(),
                    ],
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 1),
                      Text(
                        'Baca Selengkapnya ...',
                        style: GoogleFonts.inter(
                          fontSize: 7,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF505050)
                        ),
                      )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}