import 'package:api_app/common/values/colors.dart';
import 'package:api_app/pages/main_navigation/home/widget/appBanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:google_fonts/google_fonts.dart';

class BannerItem extends StatelessWidget {

  final AppBanner appBanner;

  const BannerItem({
    super.key, required this.appBanner,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          image: DecorationImage(
              image: AssetImage(appBanner.thumbnailUrl),
              fit: BoxFit.cover)),
      child: DefaultTextStyle(
        style: TextStyle(color: Colors.white, fontSize: 20.0),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Color.fromRGBO(0, 0, 0, 0.7)),
            ),
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: 11, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    appBanner.judul,
                    style: GoogleFonts.inter(
                        fontSize: 12, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(height: 3),
                  Linkify(
                    onOpen: (link) {
                      // Tambahkan navigasi ke halaman tujuan di sini
                      // Misalnya, menggunakan Navigator.push atau Get.to
                    },
                    text: appBanner.deskripsi,
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.inter(
                      fontSize: 8,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                    ),
                    linkStyle: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                    linkifiers: [
                      UrlLinkifier(),
                    ],
                    maxLines: 7,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 3),
                  Text(
                    'Baca Selengkapnya ...',
                    style: GoogleFonts.inter(
                      fontSize: 7,
                      fontWeight: FontWeight.w500,
                      color: AppColors.secondaryText2
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