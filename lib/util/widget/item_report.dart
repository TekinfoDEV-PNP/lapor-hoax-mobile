import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laporhoax/common/theme.dart';
import 'package:laporhoax/data/model/user_report.dart';
import 'package:laporhoax/ui/report/detail_report_page.dart';
import 'package:laporhoax/util/datetime_helper.dart';

class ListItem extends StatelessWidget {
  final ReportItem report;

  ListItem({required this.report});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, DetailReportPage.routeName,
            arguments: report),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${report.category}',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/modified_date.svg',
                          height: 13,
                        ),
                        SizedBox(width: 2),
                        Text(
                          '${DateTimeHelper.formattedDate(report.dateReported.toString())}',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: grey700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Status : ${report.status}',
                    style: TextStyle(
                        color: Color(0xFFFF3333), fontWeight: FontWeight.bold),
                  ),
                  Text(
                      'Tag : ${report.verdict == null ? 'N/A' : report.verdict}'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}