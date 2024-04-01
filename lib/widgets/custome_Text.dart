import 'package:flutter/material.dart';
import 'package:barber_portal/const/color.dart';

class CustomeTextWidget extends StatelessWidget {
  const CustomeTextWidget({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Hi,  $name',
              style: TextStyle(color: darkBlueColor, fontSize: 18),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Company Name',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: darkBlueColor),
          ),
        ),
      ],
    );
  }
}
