import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../const/color.dart';
import '../const/string_list.dart';
import '../controller/home_controller.dart';

Widget animationNotchBottom(Size size, BuildContext context) {
  return Container(
    height: double.infinity,
    width: double.infinity,
    color: Colors.blueGrey[50],
    child: Center(
      child: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
              bottomNavigationBar: AnimatedNotchBottomBar(
                notchBottomBarController: NotchBottomBarController(
                    index: controller.selectedIndex.value),
                color: Colors.white,
                showLabel: false,
                shadowElevation: 5,
                kBottomRadius: 28.0,
                removeMargins: false,
                bottomBarWidth: MediaQuery.of(context).size.width,
                showShadow: true,
                durationInMilliSeconds: 300,
                elevation: 8,
                bottomBarItems: const [
                  BottomBarItem(
                    inActiveItem: Icon(
                      Icons.home_filled,
                      color: darkBlueColor,
                    ),
                    activeItem: Icon(
                      Icons.home_filled,
                      color: greenColor,
                    ),
                    itemLabel: 'Home',
                  ),
                  BottomBarItem(
                    inActiveItem: Icon(
                      Icons.menu,
                      color: darkBlueColor,
                    ),
                    activeItem: Icon(
                      Icons.menu,
                      color: greenColor,
                    ),
                    itemLabel: 'Menu',
                  ),
                  BottomBarItem(
                    inActiveItem: Icon(
                      Icons.book,
                      color: darkBlueColor,
                    ),
                    activeItem: Icon(
                      Icons.book,
                      color: greenColor,
                    ),
                    itemLabel: 'Booking',
                  ),
                  BottomBarItem(
                    inActiveItem: Icon(
                      Icons.message,
                      color: darkBlueColor,
                    ),
                    activeItem: Icon(
                      Icons.message,
                      color: greenColor,
                    ),
                    itemLabel: 'Message',
                  ),
                ],
                onTap: (int index) {
                  controller.onTapped(index);
                },
                kIconSize: 24,
              ),
              body: Center(
                child: Obx(
                    () => tabOption.elementAt(controller.selectedIndex.value)),
              ),
            ),
          );
        },
      ),
    ),
  );
}
