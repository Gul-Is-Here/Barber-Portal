// import 'package:barber_portal/const/color.dart';
// import 'package:barber_portal/controller/auth_controller.dart';
// import 'package:collapsible_sidebar/collapsible_sidebar.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// class SidebarPage extends StatelessWidget {
//   BuildContext context;
//   SidebarPage({super.key, required this.context});

//   late List<CollapsibleItem> _items;

//   // AssetImage _avatarImg = AssetImage('assets/man.png');
//   var controller = Get.put(AuthController());
//   List<CollapsibleItem> get _generateItems {
//     return [
//       CollapsibleItem(
//         text: 'Dashboard',
//         icon: Icons.dashboard_customize_outlined,
//         onPressed: () {},
//         isSelected: true,
//       ),
//       CollapsibleItem(
//         text: 'Menu',
//         icon: Icons.menu,
//         onPressed: () {},
//         // onHold: () => ScaffoldMessenger.of(context)
//         //     .showSnackBar(SnackBar(content: const Text("Search"))),
//       ),
//       CollapsibleItem(
//         text: 'Booking',
//         icon: Icons.book,
//         onPressed: () {},
//         // onHold: () => ScaffoldMessenger.of(context)
//         //     .showSnackBar(SnackBar(content: const Text("Notifications"))),
//       ),
//       CollapsibleItem(
//         text: 'Settings',
//         icon: Icons.settings,

//         onPressed: () {},
//         // onHold: () => ScaffoldMessenger.of(context)
//         //     .showSnackBar(SnackBar(content: const Text("Settings"))),
//       ),
//       CollapsibleItem(
//         text: 'Logout',
//         icon: Icons.logout,
//         onPressed: () {
//           controller.logout(context);
//         },
//       ),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: CollapsibleSidebar(
//         isCollapsed: MediaQuery.of(context).size.width <= 900,
//         items: _generateItems,
//         collapseOnBodyTap: true,
//         screenPadding: 12,
//         // avatarImg: _avatarImg,
//         title: 'John Smith',
//         // onTitleTap: () {
//         //   ScaffoldMessenger.of(context).showSnackBar(
//         //       SnackBar(content: Text('Yay! Flutter Collapsible Sidebar!')));
//         // },
//         iconSize: 30, badgeTextColor: Colors.white,
//         selectedIconBox: darkBlueColor,
//         selectedIconColor: Colors.white,
//         onHoverPointer: SystemMouseCursors.click,
//         backgroundColor: Colors.white,
//         selectedTextColor: darkBlueColor,
//         textStyle: TextStyle(
//             color: Colors.white,
//             fontSize: 20,
//             fontFamily: GoogleFonts.cormorant().fontFamily,
//             fontWeight: FontWeight.bold),
//         titleStyle: TextStyle(
//             // color: ,
//             fontSize: 20,
//             fontFamily: GoogleFonts.cormorant().fontFamily,
//             fontWeight: FontWeight.bold),
//         toggleTitleStyle: TextStyle(
//             // color: Colors.white,
//             fontSize: 20,
//             fontFamily: GoogleFonts.cormorant().fontFamily,
//             fontWeight: FontWeight.bold),
//         // sidebarBoxShadow: const [
//         //   BoxShadow(
//         //     color: darkBlueColor,
//         //     blurRadius: 20,
//         //     spreadRadius: 0.01,
//         //     offset: Offset(3, 3),
//         //   ),
//         //   BoxShadow(
//         //     color: darkGreenColor,
//         //     blurRadius: 50,
//         //     spreadRadius: 0.01,
//         //     offset: Offset(3, 3),
//         //   ),
//         // ],
//         body: const Text(''),
//       ),
//     );
//   }
// }
