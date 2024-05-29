import 'package:barber_portal/const/color.dart';
import 'package:barber_portal/controller/auth_controller.dart';
import 'package:barber_portal/screens/Booking_Screen/booking_screen.dart';
import 'package:barber_portal/screens/Message_Screen/message_screen.dart';
import 'package:barber_portal/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import '../../widgets/AnimationNotch_bottom_widget.dart';
import '../Menu/menu_screen.dart';
import '../../controller/home_controller.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AssetImage avatarImg = const AssetImage('assets/images/logo.png');
  var authController = Get.put(AuthController());
  var homeController = Get.put(HomeController());

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
        text: 'Dashboard',
        icon: Icons.dashboard_customize_outlined,
        onPressed: () {
          if (homeController.isConnected.value) Get.to(() => Home());
        },
        isSelected: true,
      ),
      CollapsibleItem(
        text: 'Menu',
        icon: Icons.menu,
        onPressed: () {
          if (homeController.isConnected.value) Get.to(() => MenuScreen());
        },
      ),
      CollapsibleItem(
        text: 'Schedule',
        icon: Icons.schedule_send_outlined,
        onPressed: () {
          // if (homeController.isConnected.value) Get.to(() => Home());
        },
      ),
      CollapsibleItem(
        text: 'Booking',
        icon: Icons.book_online_rounded,
        onPressed: () {
          if (homeController.isConnected.value)
            Get.to(() => const BookingScreen());
        },
      ),
      CollapsibleItem(
        text: 'Messages',
        icon: Icons.messenger_outline_outlined,
        onPressed: () {
          if (homeController.isConnected.value)
            Get.to(() => const MessageScreen());
        },
      ),
      CollapsibleItem(
        text: 'Report',
        icon: Icons.read_more_outlined,
        onPressed: () {
          // if (homeController.isConnected.value) Get.to(() => ());
        },
      ),
      CollapsibleItem(
        text: 'Logout',
        icon: Icons.logout,
        onPressed: () {
          if (homeController.isConnected.value) authController.logout();
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: screenWidth > 450 || screenHeight > 900
          ? Scaffold(
              body: CollapsibleSidebar(
                badgeBackgroundColor: Colors.white,
                borderRadius: 20,
                avatarBackgroundColor: darkBlueColor,
                isCollapsed: screenWidth <= 800,
                items: _generateItems,
                collapseOnBodyTap: true,
                curve: Curves.bounceInOut,
                fitItemsToBottom: true,
                screenPadding: 12,
                unselectedIconColor: greenColor,
                unselectedTextColor: greenColor,
                duration: const Duration(milliseconds: 300),
                avatarImg: avatarImg,
                toggleTitle: 'Collapse',
                showToggleButton: true,
                title: 'John Smith',
                showTitle: true,
                iconSize: 30,
                selectedIconBox: darkBlueColor,
                selectedIconColor: Colors.white,
                backgroundColor: Colors.white,
                selectedTextColor: Colors.white,
                textStyle: Theme.of(context).textTheme.titleMedium,
                titleStyle: Theme.of(context).textTheme.bodyLarge,
                toggleTitleStyle: Theme.of(context).textTheme.titleLarge,
                body: animationNotchBottom(),
              ),
            )
          : Scaffold(
              appBar: AppBar(),
              drawer: const MyDrawer(),
              body: animationNotchBottom(),
            ),
    );
  }
}
