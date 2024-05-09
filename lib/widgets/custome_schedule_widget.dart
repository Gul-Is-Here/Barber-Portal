import 'package:flutter/material.dart';
import 'package:barber_portal/const/color.dart';

class ScheduleWidget extends StatelessWidget {
  const ScheduleWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    // final double cardWidth = screenWidth > 300 ? 250 : screenWidth * 0.8;
    // final double cardHeight = screenHeight > 700 ? 200 : screenHeight * 0.5;
    // final double iconSize = screenHeight < 600 ? 100 : screenWidth * 0.10;

    return SizedBox(
      width: screenWidth < 400 ? screenWidth * .5 : screenWidth * .4,
      height: screenHeight < 800 ? screenHeight * .23 : screenHeight * .3,
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
              screenWidth < 400 || screenHeight < 800
                  ? IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.schedule,
                        size: 50,
                        color: greenColor,
                      ),
                    )
                  : IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.schedule,
                        size: 80,
                        color: greenColor,
                      ),
                    ),
              const SizedBox(height: 10), // Adding some space
              screenWidth < 400 || screenHeight < 800
                  ? Text(
                      'Schedule',
                      style: TextStyle(fontSize: 16, color: darkBlueColor),
                    )
                  : Text(
                      'Schedule',
                      style: TextStyle(fontSize: 25, color: darkBlueColor),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
