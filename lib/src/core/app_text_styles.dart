// Common Text Styles
import 'package:flutter/material.dart';
import 'package:food_order_app/src/core/app_color.dart';

class AppTextStyles {
  static const TextStyle title = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle reportDate = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  static const TextStyle valueStyle = TextStyle(
    fontSize: 16,
  );

  static const TextStyle fineText = TextStyle(
    color: AppColor.fineTextColor,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle totalFine = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColor.fineTextColor,
  );
}
