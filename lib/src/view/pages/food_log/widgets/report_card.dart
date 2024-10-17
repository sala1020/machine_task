import 'package:flutter/material.dart';
import 'package:food_order_app/src/core/app_text_styles.dart';
import 'package:food_order_app/src/model/food_report_model.dart';
import 'package:food_order_app/src/view/pages/food_log/widgets/status_row.dart';
import 'package:intl/intl.dart';

class OrderReportCard extends StatelessWidget {
  const OrderReportCard({
    super.key,
    required this.report,
    required this.dailyFine,
  });
  final Report report;
  final int dailyFine;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(158, 158, 158, 1).withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              formatDate(report.date.toString()),
              style: AppTextStyles.reportDate,
            ),
            const SizedBox(height: 10),
            BuildStatusRow(meal: 'Breakfast', status: report.optIns.breakfast),
            BuildStatusRow(meal: 'Lunch', status: report.optIns.lunch),
            BuildStatusRow(meal: 'Dinner', status: report.optIns.dinner),
            const Divider(),
            Text(
              'Daily Fine: Rs. $dailyFine',
              style: AppTextStyles.fineText,
            ),
          ],
        ),
      ),
    );
  }

  String formatDate(String date) {
    final DateTime parsedDate = DateTime.parse(date);
    final DateFormat dayFormat = DateFormat('d');
    final DateFormat monthFormat = DateFormat('MMM');
    final DateFormat yearFormat = DateFormat('y');

    String daySuffix;
    int day = parsedDate.day;
    if (day >= 11 && day <= 13) {
      daySuffix = 'th'; // Special cases for 11, 12, 13
    } else {
      switch (day % 10) {
        case 1:
          daySuffix = 'st';
          break;
        case 2:
          daySuffix = 'nd';
          break;
        case 3:
          daySuffix = 'rd';
          break;
        default:
          daySuffix = 'th';
      }
    }

    return '${dayFormat.format(parsedDate)}$daySuffix ${monthFormat.format(parsedDate)} ${yearFormat.format(parsedDate)}';
  }
}
