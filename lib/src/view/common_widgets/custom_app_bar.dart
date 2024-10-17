import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.appBarTitle});

  final String appBarTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.black), // Icon color
      title: Text(
        appBarTitle,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20, // Adjusted font size
          fontWeight: FontWeight.bold, // Bold for emphasis
        ),
      ),
      backgroundColor: Colors.white, // Changed to white for a clean look
      elevation: 1, // Slight elevation for subtle shadow effect
      centerTitle: true,
    
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
