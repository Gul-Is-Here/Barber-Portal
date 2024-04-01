import 'package:flutter/material.dart';
import 'package:barber_portal/const/color.dart';
import 'package:barber_portal/widgets/card_Widget.dart';
import 'package:barber_portal/widgets/custome_Text.dart';
import 'package:barber_portal/widgets/swiper_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'screens/Menu/menu_screen.dart';

import 'widgets/custome_schedule_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: greenColor,
          elevation: 1,
          actions: [
            IconButton(
              onPressed: () {},
              icon: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  child: Container(
                    height: 45,
                    width: 50,
                    decoration: const BoxDecoration(color: Colors.red),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  )),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              // Customized Text Widget
              const CustomeTextWidget(
                name: 'Mike',
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CustomizedCardWidget(
                      onTap: () {
                        Get.to(() => const MenuScreen());
                      },
                      icon: Icons.menu,
                      title: 'Menu',
                    ),
                    CustomizedCardWidget(
                        onTap: () {},
                        icon: Icons.book,
                        num: 5,
                        title: 'Bookings',
                        color: greenColor),
                    CustomizedCardWidget(
                        onTap: () {},
                        icon: Icons.message,
                        num: 10,
                        title: 'Messages',
                        color: greenColor),
                  ],
                ),
              ),
              ScheduleWidget(),
              SwiperWidget(),
            ],
          ),
        ));
  }
}
