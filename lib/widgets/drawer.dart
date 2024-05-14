import 'package:barber_portal/const/color.dart';
import 'package:barber_portal/controller/auth_controller.dart';
import 'package:barber_portal/screens/Booking_Screen/booking_screen.dart';
import 'package:barber_portal/screens/Home_Screen/home.dart';
import 'package:barber_portal/screens/Menu/menu_screen.dart';
import 'package:barber_portal/screens/Message_Screen/message_screen.dart';
import 'package:barber_portal/widgets/custome_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            20.heightBox,
            Container(
              height: 75,
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(10),
                color: greenColor,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      maxRadius: 50,
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: 200,
                      ),
                    ),
                  ),
                  10.widthBox,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome,',
                        style: TextStyle(
                          fontFamily: GoogleFonts.cormorant().fontFamily,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      5.widthBox,
                      Text(
                        'Mike',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: GoogleFonts.cormorant().fontFamily,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  )
                ],
              ),
            ),
            20.heightBox,
            CustomeDrawerWidget(
              icon: Icons.dashboard_customize_outlined,
              title: 'Dashboard',
              onTap: () {
                // Get.off(() => S(), curve: Curves.easeInOutCubic);
              },
            ),
            CustomeDrawerWidget(
              icon: Icons.menu,
              title: 'Menu',
              onTap: () {
                Get..off(() => MenuScreen(), curve: Curves.bounceOut);
              },
            ),
            CustomeDrawerWidget(
              icon: Icons.book_online,
              title: 'Bookings',
              onTap: () {
                Get.off(() => BookingScreen(), curve: Curves.easeInCirc);
              },
            ),
            CustomeDrawerWidget(
              icon: Icons.message,
              title: 'Messages',
              onTap: () {
                Get.to(() => MessageScreen(), curve: Curves.bounceOut);
              },
            ),
            CustomeDrawerWidget(
              icon: Icons.report,
              title: 'Reports',
              onTap: () {},
            ),
            CustomeDrawerWidget(
              icon: Icons.settings,
              title: 'Settings',
              onTap: () {},
            ),
            CustomeDrawerWidget(
              icon: Icons.logout,
              title: 'Logout',
              onTap: () {
                controller.logout(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
