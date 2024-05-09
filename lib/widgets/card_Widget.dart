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
    final double screenHeight = MediaQuery.of(context).size.height;
    print('Width : $screenWidth');
    print('Height : $screenHeight');
    final double containerWidth = screenWidth < 450 ? 1500 : screenWidth * 0.40;
    final double containerHeight =
        screenHeight < 800 ? 200 : screenHeight * .300;

    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        child: SizedBox(
          width: screenWidth < 450 ? screenWidth * .25 : screenWidth * .24,
          height: screenHeight < 900 ? screenHeight * .23 : screenHeight * .3,
          child: Stack(
            children: [
              if (num != null && color != null)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    height: screenWidth < 450 || screenHeight < 900 ? 35 : 60,
                    width: screenWidth < 450 || screenHeight < 900 ? 35 : 60,
                    color: color,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          screenWidth < 450 || screenHeight < 900
                              ? Text(
                                  '$num',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : Text(
                                  '$num',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                          screenWidth < 450 || screenHeight < 900
                              ? const Text(
                                  "+",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : const Text(
                                  "+",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
              screenWidth < 450 || screenHeight < 900
                  ? Positioned(
                      top: 50,
                      left: 0,
                      right: 40,
                      child: IconButton(
                          onPressed: onTap,
                          icon: Icon(
                            icon,
                            size: 60,
                            color: greenColor,
                          )))
                  : Positioned(
                      top: 80,
                      left: 0,
                      right: 100,
                      child: IconButton(
                          onPressed: onTap,
                          icon: Icon(
                            icon,
                            size: 100,
                            color: greenColor,
                          ))),
              screenWidth < 450 || screenHeight < 900
                  ? Positioned(
                      top: 150,
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
                  : Positioned(
                      top: 200,
                      left: 0,
                      right: 50,
                      child: Center(
                        child: Text(
                          title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 36,
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
