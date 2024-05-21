import 'package:barber_portal/const/color.dart';
import 'package:barber_portal/model/booking_details_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../controller/booking_controller.dart';

// ignore: must_be_immutable
class BookingDetailScreen extends StatelessWidget {
  String bookingOrderId;
  final String sPhone;
  final String sEmail;
  final String sName;
  BookingDetailScreen(
      {super.key,
      required this.bookingOrderId,
      required this.sPhone,
      required this.sEmail,
      required this.sName});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    print(bookingOrderId);
    final controller = Get.find<BookingController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Details Screen'),
      ),
      body: FutureBuilder<List<BookingDetailsModel>>(
        future: controller.getBookingDetailsData(bookingOrderId),
        builder: (context, AsyncSnapshot<List<BookingDetailsModel>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                color: greenColor,
              ),
            );
          } else {
            return screenWidth > 450 || screenHeight > 900
                ? ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var data = snapshot.data![index];
                      return Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Buttons Section
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: darkGreenColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: Text(
                                      'Download report',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: darkBlueColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: const Text(
                                      'Send report',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),

                              // Stylist Information Section
                              Container(
                                color: Colors.grey.shade200,
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Stylist Information",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(80),
                                          child: Container(
                                            height: 80,
                                            width: 80,
                                            color: Colors.red,
                                            child: const Icon(
                                              Icons.person,
                                              size: 60,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Name ',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              'Phone ',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              'Email ',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                          ],
                                        ),
                                        const SizedBox(width: 20),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              sName,
                                              style: const TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              sPhone,
                                              style: const TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              sEmail,
                                              style: const TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              
                              // Customer Information Section
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Customer Information",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(80),
                                          child: Container(
                                              color: Colors.red,
                                              child: const Icon(
                                                Icons.person,
                                                size: 100,
                                              )),
                                        ),
                                        const SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Name ',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              'Phone ',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              'Email ',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              'Appointment Date & Time ',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 20),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              data.oName,
                                              style: const TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              data.oPhone,
                                              style: const TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              data.oEmail,
                                              style: const TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              DateTime.now().toString(),
                                              style: const TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),

                              // Title and Price Section
                              Container(
                                width: double.infinity,
                                color: Colors.black,
                                padding: const EdgeInsets.all(8.0),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "#id",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      'Title',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      'Price',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),

                              // ListView to display data
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Text('${index + 1}'),
                                  ),
                                  const Text("Women & Girl Cut & Style"),
                                  const Padding(
                                    padding: EdgeInsets.only(right: 8),
                                    child: Text('\$12'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var data = snapshot.data![index];
                      return Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Buttons Section
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: darkGreenColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: const Text(
                                      'Download report',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: darkBlueColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: const Text(
                                      'Send report',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      data.orderId,
                                      style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        color: darkBlueColor,
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            width: 1, color: darkGreenColor),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: data.orderStatus == '0'
                                        ? Text(
                                            'Pending',
                                            style: TextStyle(
                                                fontFamily:
                                                    GoogleFonts.poppins()
                                                        .fontFamily,
                                                color: darkGreenColor),
                                          )
                                        : const Text(
                                            'Complete',
                                            style: TextStyle(
                                                color: darkGreenColor),
                                          ),
                                  ),
                                ],
                              ),
                              10.heightBox,

                              // Stylist Information Section
                              // Container(
                              //   width: double.infinity,
                              //   color: Colors.grey.shade200,
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: SingleChildScrollView(
                              //     scrollDirection: Axis.horizontal,
                              //     child: Column(
                              //       crossAxisAlignment:
                              //           CrossAxisAlignment.start,
                              //       children: [
                              //         Text(
                              //           "Stylist Information",
                              //           style: TextStyle(
                              //             fontFamily:
                              //                 GoogleFonts.poppins().fontFamily,
                              //             fontSize: 20,
                              //             fontWeight: FontWeight.bold,
                              //           ),
                              //         ),
                              //         const SizedBox(height: 20),
                              //         Row(
                              //           crossAxisAlignment:
                              //               CrossAxisAlignment.center,
                              //           mainAxisAlignment:
                              //               MainAxisAlignment.center,
                              //           children: [
                              //             ClipRRect(
                              //               borderRadius:
                              //                   BorderRadius.circular(10),
                              //               child: Container(
                              //                 height: 60,
                              //                 width: 60,
                              //                 color: Colors.red,
                              //                 child: const Icon(
                              //                   Icons.person,
                              //                   size: 60,
                              //                 ),
                              //               ),
                              //             ),
                              //             const SizedBox(width: 20),
                              //             Column(
                              //               crossAxisAlignment:
                              //                   CrossAxisAlignment.start,
                              //               children: [
                              //                 Text(
                              //                   'Name ',
                              //                   style: TextStyle(
                              //                     fontFamily:
                              //                         GoogleFonts.poppins()
                              //                             .fontFamily,
                              //                     fontSize: 14,
                              //                     fontWeight: FontWeight.bold,
                              //                   ),
                              //                 ),
                              //                 SizedBox(height: 10),
                              //                 Text(
                              //                   'Phone ',
                              //                   style: TextStyle(
                              //                     fontFamily:
                              //                         GoogleFonts.poppins()
                              //                             .fontFamily,
                              //                     fontSize: 14,
                              //                     fontWeight: FontWeight.bold,
                              //                   ),
                              //                 ),
                              //                 SizedBox(height: 10),
                              //                 Text(
                              //                   'Email ',
                              //                   style: TextStyle(
                              //                     fontFamily:
                              //                         GoogleFonts.poppins()
                              //                             .fontFamily,
                              //                     fontSize: 14,
                              //                     fontWeight: FontWeight.bold,
                              //                   ),
                              //                 ),
                              //                 SizedBox(height: 10),
                              //               ],
                              //             ),
                              //             const SizedBox(width: 20),
                              //             Column(
                              //               crossAxisAlignment:
                              //                   CrossAxisAlignment.start,
                              //               children: [
                              //                 Text(
                              //                   sName,
                              //                   style: TextStyle(
                              //                     fontFamily:
                              //                         GoogleFonts.poppins()
                              //                             .fontFamily,
                              //                     fontSize: 14,
                              //                   ),
                              //                 ),
                              //                 10.heightBox,
                              //                 Text(
                              //                   sPhone,
                              //                   style: TextStyle(
                              //                     fontFamily:
                              //                         GoogleFonts.poppins()
                              //                             .fontFamily,
                              //                     fontSize: 14,
                              //                   ),
                              //                 ),
                              //                 const SizedBox(height: 10),
                              //                 Text(
                              //                   sEmail,
                              //                   style: TextStyle(
                              //                     fontFamily:
                              //                         GoogleFonts.poppins()
                              //                             .fontFamily,
                              //                     fontSize: 14,
                              //                   ),
                              //                 ),
                              //                 const SizedBox(height: 10),
                              //               ],
                              //             ),
                              //           ],
                              //         ),
                              //         10.heightBox,
                              //         Column(
                              //           crossAxisAlignment:
                              //               CrossAxisAlignment.center,
                              //           children: [
                              //             Text(
                              //               textAlign: TextAlign.center,
                              //               'Booking Id  ${data.orderId}',
                              //               style: TextStyle(
                              //                 fontFamily: GoogleFonts.poppins()
                              //                     .fontFamily,
                              //                 color: darkBlueColor,
                              //                 fontSize: 24,
                              //               ),
                              //             ),
                              //             const SizedBox(height: 10),
                              //             TextButton(
                              //               onPressed: () {},
                              //               style: TextButton.styleFrom(
                              //                 shape: RoundedRectangleBorder(
                              //                   side: const BorderSide(
                              //                       width: 1,
                              //                       color: darkGreenColor),
                              //                   borderRadius:
                              //                       BorderRadius.circular(10),
                              //                 ),
                              //               ),
                              //               child: data.orderStatus == '0'
                              //                   ? Text(
                              //                       'Pending',
                              //                       style: TextStyle(
                              //                           fontFamily: GoogleFonts
                              //                                   .poppins()
                              //                               .fontFamily,
                              //                           color: darkGreenColor),
                              //                     )
                              //                   : const Text(
                              //                       'Complete',
                              //                       style: TextStyle(
                              //                           color: darkGreenColor),
                              //                     ),
                              //             ),
                              //             Text(
                              //               data.locationId,
                              //               style: TextStyle(
                              //                 fontFamily: GoogleFonts.poppins()
                              //                     .fontFamily,
                              //               ),
                              //             )
                              //           ],
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),

                              // Customer Information Section
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Card(
                                  elevation: 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: darkBlueColor,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Customer Information",
                                            style: TextStyle(
                                                fontFamily:
                                                    GoogleFonts.poppins()
                                                        .fontFamily,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          // const SizedBox(height: 10),
                                          // Text(
                                          //   data.locationId,
                                          //   style: TextStyle(
                                          //     fontFamily:
                                          //         GoogleFonts.poppins()
                                          //             .fontFamily,
                                          //   ),
                                          // )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          // Cutomer Image widget
                                          // ClipRRect(
                                          //   borderRadius:
                                          //       BorderRadius.circular(10),
                                          //   child: Container(
                                          //       width: 60,
                                          //       height: 60,
                                          //       color: Colors.red,
                                          //       child: const Icon(
                                          //         Icons.person,
                                          //         size: 40,
                                          //       )),
                                          // ),

                                          // const SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              10.heightBox,
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0),
                                                child: Text(
                                                  'Name ',
                                                  style: TextStyle(
                                                    fontFamily:
                                                        GoogleFonts.poppins()
                                                            .fontFamily,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0),
                                                child: Text(
                                                  'Phone ',
                                                  style: TextStyle(
                                                    fontFamily:
                                                        GoogleFonts.poppins()
                                                            .fontFamily,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0),
                                                child: Text(
                                                  'Email ',
                                                  style: TextStyle(
                                                    fontFamily:
                                                        GoogleFonts.poppins()
                                                            .fontFamily,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0),
                                                child: Text(
                                                  'Appointment Date',
                                                  style: TextStyle(
                                                    fontFamily:
                                                        GoogleFonts.poppins()
                                                            .fontFamily,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0),
                                                child: Text(
                                                  'Appointment Time',
                                                  style: TextStyle(
                                                    fontFamily:
                                                        GoogleFonts.poppins()
                                                            .fontFamily,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              10.heightBox
                                            ],
                                          ),
                                          const SizedBox(width: 20),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              10.heightBox,
                                              Text(
                                                data.oName,
                                                style: TextStyle(
                                                  fontFamily:
                                                      GoogleFonts.poppins()
                                                          .fontFamily,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                data.oPhone,
                                                style: TextStyle(
                                                  fontFamily:
                                                      GoogleFonts.poppins()
                                                          .fontFamily,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                data.oEmail,
                                                style: TextStyle(
                                                  fontFamily:
                                                      GoogleFonts.poppins()
                                                          .fontFamily,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                DateTime.now().toString(),
                                                style: TextStyle(
                                                  fontFamily:
                                                      GoogleFonts.poppins()
                                                          .fontFamily,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                DateTime.now().toString(),
                                                style: TextStyle(
                                                  fontFamily:
                                                      GoogleFonts.poppins()
                                                          .fontFamily,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              10.heightBox
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),

                              // Title and Price Section
                              Container(
                                width: double.infinity,
                                color: Colors.black,
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "#id",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      'Title',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'Price',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // ListView to display data
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: Text(
                                        '${index + 1}',
                                        style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Women & Girl Cut & Style",
                                      style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: Text(
                                        '\$${data.oSubtotal}',
                                        style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
          }
        },
      ),
    );
  }
}
