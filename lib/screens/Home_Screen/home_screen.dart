import 'package:barber_portal/screens/Booking_Screen/booking_screen.dart';
import 'package:flutter/material.dart';
import 'package:barber_portal/const/color.dart';
import 'package:barber_portal/widgets/card_Widget.dart';
import 'package:barber_portal/widgets/custome_Text.dart';
import 'package:barber_portal/widgets/swiper_widget.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../widgets/custome_schedule_widget.dart';
import '../Menu/menu_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                60.widthBox,
                CustomizedCardWidget(
                  onTap: () {
                    Get.to(() => const MenuScreen());
                  },
                  icon: Icons.menu,
                  title: 'Menu',
                ),
                CustomizedCardWidget(
                    onTap: () {
                      Get.to(() => const BookingScreen());
                    },
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
          const ScheduleWidget(),
          const SwiperWidget(),
        ],
      ),
    ));
  }
}
