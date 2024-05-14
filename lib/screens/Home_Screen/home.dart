import 'dart:math' as math show pi;
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:barber_portal/const/color.dart';
import 'package:barber_portal/controller/home_controller.dart';
import 'package:barber_portal/screens/Booking_Screen/booking_screen.dart';
import 'package:barber_portal/screens/Home_Screen/home_screen.dart';
import 'package:barber_portal/screens/Menu/menu_screen.dart';
import 'package:barber_portal/screens/Message_Screen/message_screen.dart';
import 'package:barber_portal/widgets/drawer.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../const/string_list.dart';

import 'package:collapsible_sidebar/collapsible_sidebar.dart';

import '../../widgets/AnimationNotch_bottom_widget.dart';

class Home extends StatelessWidget {
  Home({super.key});

  AssetImage avatarImg = AssetImage('assets/images/logo.png');
  List<CollapsibleItem> get _generateItems {
    // Define your selected color here
    return [
      CollapsibleItem(
        text: 'Dashboard',
        icon: Icons.dashboard_customize_outlined,
        onPressed: () {
          Get.to(() => Home());
        },
        isSelected: true,

        // Pas the selected color
      ),
      CollapsibleItem(
        text: 'Menu',
        icon: Icons.menu,
        onPressed: () {
          Get.to(() => MenuScreen());
        },
      ),
      CollapsibleItem(
        text: 'Schedule',
        icon: Icons.schedule_send_outlined,
        onPressed: () {
          // Get.to(() => Home());
        },
      ),
      CollapsibleItem(
        text: 'Booking',
        icon: Icons.book_online_rounded,
        onPressed: () {
          Get.to(() => BookingScreen());
        },
      ),
      CollapsibleItem(
        text: 'Messages',
        icon: Icons.messenger_outline_outlined,
        onPressed: () {
          Get.to(() => MessageScreen());
        },
      ),
      CollapsibleItem(
        text: 'Report',
        icon: Icons.read_more_outlined,
        onPressed: () {
          // Get.to(() => ());
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    var size = MediaQuery.of(context).size;

    return SafeArea(
      // this for tablets screens
      child: screenWidth > 450
          ? Scaffold(
              body: CollapsibleSidebar(
                badgeBackgroundColor: Colors.white,

                borderRadius: 20,
                avatarBackgroundColor: darkBlueColor,
                isCollapsed: MediaQuery.of(context).size.width <= 800,
                items: _generateItems,
                collapseOnBodyTap: true,
                curve: Curves.bounceInOut,
                fitItemsToBottom: true,
                screenPadding: 12,
                unselectedIconColor: greenColor,
                unselectedTextColor: greenColor,
                duration: Duration(milliseconds: 300),
                avatarImg: avatarImg,
                toggleTitle: 'Colapse',
                showToggleButton: true,
                title: 'John Smith',
                showTitle: true,
                // onTitleTap: () {
                //   ScaffoldMessenger.of(context).showSnackBar(
                //       SnackBar(content: Text('Yay! Flutter Collapsible Sidebar!')));
                // },
                iconSize: 30,
                selectedIconBox: darkBlueColor,
                selectedIconColor: Colors.white,
                backgroundColor: Colors.white,
                selectedTextColor: Colors.white,
                textStyle: Theme.of(context).textTheme.titleMedium,
                titleStyle: Theme.of(context).textTheme.bodyLarge,
                toggleTitleStyle: Theme.of(context).textTheme.titleLarge,
                body: animationNotchBottom(size, context),
              ),
            )
          : Scaffold(
              appBar: AppBar(),
              drawer: const MyDrawer(),
              body: animationNotchBottom(size, context),
            ),
    );
  }
}
