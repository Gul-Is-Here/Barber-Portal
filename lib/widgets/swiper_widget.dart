import 'package:barber_portal/widgets/swiper_custome_text.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../const/string_list.dart';

class SwiperWidget extends StatelessWidget {
  const SwiperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return screenWidth < 400 || screenHeight < 800
        ? VxSwiper.builder(
            aspectRatio: 16 / 9,
            autoPlay: true,
            height: 160,
            enlargeCenterPage: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              // Accessing color based on index from controller
              return Card(
                child: Stack(
                  children: [
                    Positioned(
                      top: 15,
                      left: 20,
                      child: Text(
                        textAlign: TextAlign.left,
                        'Marry Jhon',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 50, left: 20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.star_rate, color: Colors.white),
                                Icon(Icons.star_rate, color: Colors.white),
                                Icon(Icons.star_rate, color: Colors.white),
                                Icon(Icons.star_rate, color: Colors.white),
                                Icon(Icons.star_rate, color: Colors.white),
                              ],
                            ),
                            SwiperCustomeText(text: 'Mike is an Amazing Barber')
                          ],
                        )),
                  ],
                ),
              );
            },
          )
        : VxSwiper.builder(
            aspectRatio: 16 / 9,
            autoPlay: true,
            height: 220,
            enlargeCenterPage: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              // Accessing color based on index from controller
              return Card(
                child: Stack(
                  children: [
                    Positioned(
                      top: 15,
                      left: 20,
                      child: Text(
                        textAlign: TextAlign.left,
                        'Marry Jhon',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 50, left: 20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.star_rate, color: Colors.white),
                                Icon(Icons.star_rate, color: Colors.white),
                                Icon(Icons.star_rate, color: Colors.white),
                                Icon(Icons.star_rate, color: Colors.white),
                                Icon(Icons.star_rate, color: Colors.white),
                              ],
                            ),
                            SwiperCustomeText(text: 'Mike is an Amazing Barber')
                          ],
                        )),
                  ],
                ),
              );
            },
          );
  }
}
