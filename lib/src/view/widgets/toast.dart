import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_order_app/src/core/app_color.dart';

class ToastWidget {
  static void showToast(String message, {ToastGravity gravity = ToastGravity.BOTTOM}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT, // Use a short duration as a fallback
      gravity: gravity,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColor.commonBlack,
      textColor: AppColor.primaryBackground,
      fontSize: 16.0,
    );

    // Custom duration
    Future.delayed(Duration(milliseconds:1100 ), () {
      Fluttertoast.cancel(); // Cancel the toast after the custom duration
    });
  }
}
