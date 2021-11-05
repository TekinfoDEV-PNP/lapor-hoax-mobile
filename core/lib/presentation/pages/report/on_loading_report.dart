import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../domain/entities/report.dart';
import '../../../styles/colors.dart';
import '../../../styles/theme.dart';
import '../../../utils/navigation.dart';
import 'detail_report_page.dart';
import 'report_page.dart';

class OnSuccessReport extends StatelessWidget {
  static const String ROUTE_NAME = '/success';

  final Report reportItem;

  OnSuccessReport({required this.reportItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/success.svg', width: 100),
              SizedBox(height: 30),
              Text('Selamat !',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                      color: success)),
              SizedBox(height: 10),
              Text('Laporan berhasil dikirimkan',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: success)),
              SizedBox(height: 15),
              Text(
                  'Laporanmu akan segera diproses oleh ahli yang bersangkutan, jadi tunggu ya !',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400, fontSize: 20)),
              SizedBox(height: 25),
              ElevatedButton(
                onPressed: () => Navigation.intent(ReportPage.ROUTE_NAME),
                child: Text('Lapor lagi yuk !'),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () => Navigation.intentWithData(
                    DetailReportPage.ROUTE_NAME, reportItem),
                child: Text('Lihat laporan yang barusan',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: orangeBlaze)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnFailureReport extends StatelessWidget {
  static const String ROUTE_NAME = '/error';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/fail.svg', width: 100),
            SizedBox(height: 25),
            Text('Oops...!',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    color: Colors.red)),
            SizedBox(height: 10),
            Text('Sepertinya Ada Kesalahan',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.red)),
            SizedBox(height: 15),
            Text('Hmmm, sepertinya ada kesalahan. Ayo laporkan ulang !',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400, fontSize: 12)),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: () => Navigation.intent(ReportPage.ROUTE_NAME),
              style: redElevatedButton,
              child: Text('Ulang Pelaporan'),
            ),
          ],
        ),
      ),
    );
  }
}