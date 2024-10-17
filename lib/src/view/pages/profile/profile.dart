import 'package:flutter/material.dart';
import 'package:food_order_app/src/core/app_color.dart';
import 'package:food_order_app/src/model/food_report_model.dart';
import 'package:food_order_app/src/view/pages/profile/widgets/information_tile.dart';
import 'package:food_order_app/src/view/common_widgets/custom_app_bar.dart'; 
import 'package:food_order_app/src/core/app_text_styles.dart'; 

class Profile extends StatelessWidget {
  final User user; 

  const Profile(
      {super.key,
      required this.user}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(appBarTitle: "Profile"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfilePicture(),
            const SizedBox(height: 16.0),
            _buildUserName(),
            const SizedBox(height: 8.0),
            _buildEmployeeID(),
            const SizedBox(height: 16.0),
            _buildContactInformationTitle(),
            const SizedBox(height: 8.0),
            _buildContactInformation(),
          ],
        ),
      ),
    );
  }

  // Widget for Profile Picture
  Widget _buildProfilePicture() {
    return Center(
      child: CircleAvatar(
        radius: 60,
        backgroundColor: AppColor.lightGrey,
        child: ClipOval(
          child: Image.asset(
            user.image ??
                'assets/default_profile.png', 
            height: 80,
            width: 80,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  // Widget for Username
  Widget _buildUserName() {
    return Text(
      '${user.fName} ${user.lName}',
      style: AppTextStyles.title,
    );
  }

  // Widget for Emploee Id
  Widget _buildEmployeeID() {
    return Text(
      'Employee ID: ${user.empId}',
      style: AppTextStyles.valueStyle,
    );
  }

  // Widget for Contact Information Title
  Widget _buildContactInformationTitle() {
    return const Text(
      'Contact Information',
      style: AppTextStyles.title,
    );
  }

  // Widget for Contact Information
  Widget _buildContactInformation() {
    return Column(
      children: [
        InformationTile(icon: Icons.phone, value: user.phone),
        InformationTile(icon: Icons.email, value: user.email),
      ],
    );
  }
}
