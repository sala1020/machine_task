import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.appBarTitle});

  final String appBarTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      title: Text(
        appBarTitle,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20, 
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white, 
      elevation: 1, 
      centerTitle: true,
    
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
