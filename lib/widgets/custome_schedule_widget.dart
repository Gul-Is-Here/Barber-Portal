import 'package:flutter/material.dart';
import 'package:barber_portal/const/color.dart';

class ScheduleWidget extends StatelessWidget {
  const ScheduleWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    // final double containerWidth = screenWidth > 600 ? 150 : screenWidth * 0.30;
    final double cardWidth = screenWidth > 600 ? 250 : screenHeight * .3;
    final double cardHeight = screenHeight > 300 ? 200 : screenWidth * 0.3;
    final double iconSize = screenHeight < 400 ? 100 : screenWidth * 0.2;

    return SizedBox(
      width: cardWidth,
      height: cardHeight,
      child: Card(
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.schedule,
                  size: iconSize,
                  color: greenColor,
                ),
              ),
              const SizedBox(height: 10), // Adding some space
              const Text(
                'Schedule',
                style: TextStyle(fontSize: 16, color: darkBlueColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
