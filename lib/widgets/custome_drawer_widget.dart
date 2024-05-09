import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../const/color.dart';

class CustomeDrawerWidget extends StatelessWidget {
  CustomeDrawerWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1,
              color: greenColor, // Set your desired border color here
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                style: TextButton.styleFrom(
                  foregroundColor: greenColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: Icon(icon),
                label: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.cormorant().fontFamily,
                  ),
                ),
                onPressed: onTap,
              ),
              IconButton(
                  onPressed: onTap,
                  icon: Icon(
                    Icons.forward,
                    color: greenColor,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
