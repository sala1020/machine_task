
import 'package:flutter/material.dart';
import 'package:food_order_app/src/core/app_text_styles.dart';
import 'package:food_order_app/src/view/food_log/food_log.dart';

class BuildStatusRow extends StatelessWidget {
  const BuildStatusRow({
    super.key,
    required this.meal,
    required this.status,
  });

  final String meal;
  final String? status;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        mealStatusIcon(status),
        const SizedBox(width: 10),
        Text(
          '$meal: ${status ?? 'Not Specified'}',
          style: AppTextStyles.valueStyle,
        ),
      ],
    );
  }
}
