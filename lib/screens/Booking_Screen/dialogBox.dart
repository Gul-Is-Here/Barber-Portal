// import 'package:barber_portal/widgets/dialogBox.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:barber_portal/controller/booking_controller.dart';
// import 'package:barber_portal/screens/Booking_Screen/dialogBox.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:velocity_x/velocity_x.dart';

// import '../../const/color.dart';

// import '../../widgets/paginated_table_widget.dart';

// class BookingScreen extends StatelessWidget {
//   const BookingScreen({
//     required Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(BookingController());
//     final width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Customer Booking Schedule',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: width > 400 ? 28 : 14,
//             fontFamily: GoogleFonts.poppins().toString(),
//           ),
//         ),
//       ),
//       backgroundColor: Colors.white,
//       body: LayoutBuilder(
//         builder: (BuildContext context, BoxConstraints constraints) {
//           if (constraints.maxWidth > 400) {
//             return const PaginatedTableWidget();
//           } else {
//             return ListView.builder(
//               itemCount: controller.bookingData.length,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () {
//                     showDialog(
//                       context: context,
//                       builder: (context) => DialogBox(),
//                     );
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Material(
//                       borderRadius: const BorderRadius.only(
//                         topLeft: Radius.elliptical(25, 25),
//                         bottomRight: Radius.elliptical(25, 25),
//                       ),
//                       elevation: 5,
//                       child: SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: DataTable(
//                           headingRowHeight: 50,
//                           dataRowHeight: 60,
//                           columns: [
//                             DataColumn(
//                               label: Text('Customer',
//                                   style:
//                                       Theme.of(context).textTheme.titleSmall),
//                             ),
//                             DataColumn(
//                               label: Text('Status',
//                                   style:
//                                       Theme.of(context).textTheme.titleSmall),
//                             ),
//                             DataColumn(
//                               label: Text('Phone',
//                                   style:
//                                       Theme.of(context).textTheme.titleSmall),
//                             ),
//                             DataColumn(
//                               label: Text('Email',
//                                   style:
//                                       Theme.of(context).textTheme.titleSmall),
//                             ),
//                             DataColumn(
//                               label: Text('Price',
//                                   style:
//                                       Theme.of(context).textTheme.titleSmall),
//                             ),
//                             DataColumn(
//                               label: Text('Date & Time',
//                                   style:
//                                       Theme.of(context).textTheme.titleSmall),
//                             ),
//                           ],
//                           rows: [
//                             DataRow(cells: [
//                               DataCell(Text(
//                                 controller.bookingData[index].customerName,
//                                 style: TextStyle(
//                                   color: darkBlueColor,
//                                   fontSize: 14,
//                                   fontFamily: GoogleFonts.lato().toString(),
//                                 ),
//                               )),
//                               DataCell(
//                                 Text(
//                                   (controller.bookingData[index].status
//                                       .toString()),
//                                   style: TextStyle(
//                                     color: darkBlueColor,
//                                     fontSize: 14,
//                                     fontFamily: GoogleFonts.lato().toString(),
//                                   ),
//                                 ),
//                               ),
//                               DataCell(Text(
//                                 (controller.bookingData[index].phone),
//                                 style: TextStyle(
//                                   color: darkBlueColor,
//                                   fontSize: 14,
//                                   fontFamily: GoogleFonts.lato().toString(),
//                                 ),
//                               )),
//                               DataCell(Text(
//                                 (controller.bookingData[index].email),
//                                 style: TextStyle(
//                                   color: darkBlueColor,
//                                   fontSize: 14,
//                                   fontFamily: GoogleFonts.lato().toString(),
//                                 ),
//                               )),
//                               DataCell(
//                                 Chip(
//                                   label: Text(
//                                     '\$${(controller.bookingData[index].price.toString())}',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 14,
//                                       fontFamily: GoogleFonts.lato().toString(),
//                                     ),
//                                   ),
//                                   backgroundColor: darkBlueColor,
//                                   shape: const RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.only(
//                                       topLeft: Radius.elliptical(25, 25),
//                                       bottomRight: Radius.elliptical(25, 25),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               DataCell(Text(
//                                 (controller.formatDate(controller
//                                     .bookingData[index].appointmentAndDate)),
//                                 style: TextStyle(
//                                   color: darkBlueColor,
//                                   fontSize: 14,
//                                   fontFamily: GoogleFonts.lato().toString(),
//                                 ),
//                               )),
//                             ]),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
