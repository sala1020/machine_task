
import 'package:flutter/material.dart';
import 'package:food_order_app/src/controller/food_detail_controller.dart';
import 'package:food_order_app/src/core/app_text_styles.dart';

class HomeErrorMessageHandler extends StatelessWidget {
  const HomeErrorMessageHandler({
    super.key,
    required this.controller,
  });

  final FoodDetailController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () async {
          await controller.refreshController(); // Try refreshing on tap
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              controller.errorMessage.value,
              style: AppTextStyles.reportDate, // Customize error message color
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8), // Spacing for better visibility
            const Text("Tap to refresh"), // Instruction to tap for refresh
          ],
        ),
      ),
    );
  }
}
