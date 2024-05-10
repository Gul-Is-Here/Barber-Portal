import 'package:barber_portal/controller/booking_controller.dart';
import 'package:barber_portal/model/booking_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../const/color.dart';
import '../../widgets/paginated_table_widget.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookingController());
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    print('Booking  Item ;${controller.bookingData.length}');

    return Scaffold(
      body: FutureBuilder<List<Booking>>(
          future: controller.getBookingdata(),
          builder: (context, AsyncSnapshot<List<Booking>> snapshot) {
            if (snapshot.hasError) {
              return CircularProgressIndicator(
                color: greenColor,
              );
            } else {
              return screenHeight < 900 || screenWidth < 450
                  ? ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var bookingData = snapshot.data![index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),

                            // For smaller screens, use list view

                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Booking Details',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontFamily:
                                                  GoogleFonts.lato().toString(),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const Icon(
                                            Icons.calendar_today,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 12),
                                      Text(
                                        'Customer: ${bookingData.oName}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily:
                                              GoogleFonts.lato().toString(),
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'Status: ${bookingData.orderStatus}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontFamily:
                                              GoogleFonts.lato().toString(),
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'Phone: ${bookingData.oPhone}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontFamily:
                                              GoogleFonts.lato().toString(),
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'Email: ${bookingData.oEmail}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontFamily:
                                              GoogleFonts.lato().toString(),
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'Price: \$${bookingData.oSubtotal}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontFamily:
                                              GoogleFonts.lato().toString(),
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'Date & Time: ${bookingData.bookingDate}${bookingData.bookingTime}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontFamily:
                                              GoogleFonts.lato().toString(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      })
                  : Center(
                      child: Text('No Data'),
                    );
            }
          }),
    );
  }
}
