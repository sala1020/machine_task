import 'package:flutter/material.dart';
import 'package:food_order_app/src/core/app_text_styles.dart';
import 'package:food_order_app/src/model/food_report_model.dart';
import 'package:food_order_app/src/view/food_log/widgets/report_card.dart';
import 'package:food_order_app/src/view/food_log/widgets/status_row.dart';
import 'package:food_order_app/src/view/widgets/custom_app_bar.dart';
import 'package:intl/intl.dart';

class FoodLog extends StatelessWidget {
  final List<Report> reports;

  const FoodLog({super.key, required this.reports});

  @override
  Widget build(BuildContext context) {
    final totalFine = calculateTotalFine();

    return Scaffold(
      appBar: const CustomAppBar(
        appBarTitle: 'Employee Food Report',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: reports.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Reports Section Header
                  const Text(
                    'Monthly Report',
                    style: AppTextStyles.title,
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: reports.length,
                      itemBuilder: (context, index) {
                        final report = reports[index];
                        final dailyFine = calculateDailyFine(report);

                        return OrderReportCard(
                          dailyFine: dailyFine,
                          report: report,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Total Monthly Fine Section
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Total Monthly Fine: Rs. $totalFine',
                      style: AppTextStyles.totalFine,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )
            : const Center(child: Text("Oops Nothing Here...")),
      ),
    );
  }

  int calculateTotalFine() {
    int totalFine = 0;
    for (var report in reports) {
      totalFine += calculateDailyFine(report);
    }
    return totalFine;
  }

  int calculateDailyFine(Report report) {
    int fine = 0;
    if (report.optIns.breakfast == 'Pending') fine += 100;
    if (report.optIns.lunch == 'Pending') fine += 100;
    if (report.optIns.dinner == 'Pending') fine += 100;
    return fine;
  }
}

// Common Meal Status Icon Widget
Widget mealStatusIcon(String? status) {
  IconData icon;
  Color color;

  switch (status) {
    case 'Delivered':
      icon = Icons.check_circle;
      color = Colors.green;
      break;
    case 'Pending':
      icon = Icons.warning_amber_rounded;
      color = Colors.amber;
      break;
    case 'Canceled':
      icon = Icons.cancel;
      color = Colors.red;
      break;
    default:
      icon = Icons.help_outline;
      color = Colors.grey;
  }

  return Icon(icon, color: color, size: 24);
}
