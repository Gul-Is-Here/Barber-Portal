import 'package:barber_portal/controller/booking_controller.dart';
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
    final width = MediaQuery.of(context).size.width;
    print('Booking  Item ;${controller.bookingData.length}');

    return Scaffold(
      body: controller.bookingData.isEmpty
          ? const Center(
              child: Text('Appointment is Not Schedule'),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Expanded(
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      if (constraints.maxWidth > 400) {
                        // For larger screens, use paginated table widget
                        return const PaginatedTableWidget();
                      } else {
                        // For smaller screens, use list view
                        return ListView.builder(
                          itemCount: controller.bookingData.length,
                          itemBuilder: (context, index) {
                            final booking = controller.bookingData[index];
                            return Padding(
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
                                        'Customer: ${booking.customerName}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily:
                                              GoogleFonts.lato().toString(),
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'Status: ${booking.status}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontFamily:
                                              GoogleFonts.lato().toString(),
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'Phone: ${booking.phone}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontFamily:
                                              GoogleFonts.lato().toString(),
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'Email: ${booking.email}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontFamily:
                                              GoogleFonts.lato().toString(),
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'Price: \$${booking.price.toStringAsFixed(2)}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontFamily:
                                              GoogleFonts.lato().toString(),
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'Date & Time: ${controller.formatDate(booking.appointmentAndDate)}',
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
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
