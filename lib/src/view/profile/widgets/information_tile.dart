
import 'package:flutter/material.dart';
import 'package:food_order_app/src/core/app_color.dart';
import 'package:food_order_app/src/core/app_text_styles.dart';

class InformationTile extends StatelessWidget {
  const InformationTile({
    super.key,
    required this.icon,
    required this.value,
  });

  final IconData icon;
  final String value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.teal),
      title: Text(
        value,
        style: AppTextStyles.valueStyle, // Use a common style for meal status
      ),
      tileColor: AppColor.lightGrey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
    );
  }
}