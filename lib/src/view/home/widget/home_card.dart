
import 'package:flutter/material.dart';
import 'package:food_order_app/src/core/app_text_styles.dart';
import 'package:food_order_app/src/model/food_report_model.dart';
import 'package:food_order_app/src/view/food_log/food_log.dart';
import 'package:food_order_app/src/view/profile/profile.dart';
import 'package:get/get.dart';

class HomeCards extends StatelessWidget {
  const HomeCards({
    super.key,
    required this.index,
    required this.user,
    required this.report,
  });

  final int index;
  final User user;
  final List<Report> report;

  @override
  Widget build(BuildContext context) {
    String? title;
    String? imagePath;
    void Function()? ontap;

    // Define card content based on index
    if (index == 0) {
      title = 'Profile';
      imagePath = 'assets/profile.png'; // Replace with your profile image path
      ontap = () {
        Get.to(() => Profile(user: user)); // Pass user data to Profile
      };
    } else if (index == 1) {
      title = 'Orders';
      imagePath = 'assets/food.png'; // Replace with your food log image path
      ontap = () {
        Get.to(() => FoodLog(
              reports: report,
            )); // Pass user data to FoodLog
      };
    }

    return GestureDetector(
      onTap: () {
        ontap!();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200], // Light grey background for contrast
          borderRadius:
              BorderRadius.circular(15.0), // Rounded corners for the container
        ),
        padding: const EdgeInsets.all(16.0), // Padding for content
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Center content vertically
          children: [
            Image.asset(
              imagePath!,
              height: 60, // Adjust height as needed
              width: 60, // Adjust width as needed
            ),
            const SizedBox(height: 8), // Spacing between image and text
            Text(title!, style: AppTextStyles.title),
          ],
        ),
      ),
    );
  }
}
