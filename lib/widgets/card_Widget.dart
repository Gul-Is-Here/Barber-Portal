import 'package:flutter/material.dart';
import 'package:barber_portal/const/color.dart';

class CustomizedCardWidget extends StatelessWidget {
  const CustomizedCardWidget({
    Key? key,
    required this.icon,
    required this.onTap,
    required this.title,
    this.num,
    this.color,
  }) : super(key: key);

  final IconData icon;
  final void Function() onTap;
  final int? num;
  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    // Calculate adaptive width based on screen width
    final double screenWidth = MediaQuery.of(context).size.width;
    final double containerWidth = screenWidth > 600 ? 150 : screenWidth * 0.30;

    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        child: SizedBox(
          width: containerWidth,
          height: 150,
          child: Stack(
            children: [
              if (num != null && color != null)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    height: 30,
                    width: 35,
                    color: color,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$num',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            "+",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              Positioned(
                top: 60,
                left: 30,
                child: Icon(
                  icon,
                  size: 50,
                  color: greenColor,
                ),
              ),
              Positioned(
                top: 125,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: darkBlueColor),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
