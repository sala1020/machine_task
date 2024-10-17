import 'package:flutter/material.dart';
import 'package:food_order_app/src/core/app_color.dart';
import 'package:food_order_app/src/core/app_text_styles.dart';
import 'package:food_order_app/src/view/common_widgets/custom_app_bar.dart';
import 'package:food_order_app/src/view/pages/home/widget/home_card.dart';
import 'package:food_order_app/src/view/pages/home/widget/home_error_handler.dart';
import 'package:get/get.dart';
import 'package:food_order_app/src/controller/food_detail_controller.dart';
import 'package:lottie/lottie.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final controller = Get.put(FoodDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(appBarTitle: "Home"),
      body: RefreshIndicator(
        color: AppColor.commonBlack,
        backgroundColor: AppColor.primaryBackground,
        onRefresh: () async {
          await controller.refreshController();
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(() {
            if (controller.isLoading.value) {
              return Center(
                child: Lottie.network(
                  'https://lottie.host/68c200fb-ba99-4422-8954-33a8da09a0f1/3xWyDA6rQ7.json',
                  width: 150,
                  height: 150,
                  fit: BoxFit.contain,
                ),
              );
            } else if (controller.errorMessage.isNotEmpty) {
              return HomeErrorMessageHandler(controller: controller);
            } else if (controller.customerReport.value != null) {
              final user = controller.customerReport.value!.user;
              final report = controller.customerReport.value!.reports;
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return HomeCards(index: index, user: user, report: report);
                },
              );
            } else {
              return Center(
                child: GestureDetector(
                  onTap: () async {
                    await controller.refreshController();
                  },
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("No Report Available", style: AppTextStyles.title),
                      SizedBox(height: 5),
                      Text("Tap to refresh"),
                    ],
                  ),
                ),
              );
            }
          }),
        ),
      ),
    );
  }

  // Method to build each card based on index
}
