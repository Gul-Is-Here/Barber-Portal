import 'package:barber_portal/screens/Home_Screen/home_screen.dart';
import 'package:flutter/material.dart';

import '../screens/Booking_Screen/booking_screen.dart';
import '../screens/Menu/add_services_screen.dart';
import '../screens/Menu/menu_screen.dart';
import '../screens/Message_Screen/message_screen.dart';

final vxSwiperSubtitleList = [
  'So the user easily use and customized the template ',
  'With neat page layout and well aranged code',
  'Equiped with various feature such as list buttons and others'
];
// final vxSwiperText = ['Easy to edit', 'Well Documented', 'Complete Feature'];
// final vsSwiperIcon = [brushIcon, menuColorIcon, iconDone];

final vxSwiperText = ['Testimonial', 'Testimonial', 'Testimonial'];
  const List<Widget> tabOption = [
    HomeScreen(),
    MenuScreen(),
    BookingScreen(),
    MessageScreen()
  ];