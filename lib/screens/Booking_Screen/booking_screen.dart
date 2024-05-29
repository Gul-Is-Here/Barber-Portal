import 'package:barber_portal/controller/booking_controller.dart';
import 'package:barber_portal/model/booking_model.dart';
import 'package:barber_portal/screens/Booking_Screen/booking_detail_screen.dart';
import 'package:barber_portal/widgets/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../const/color.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookingController());
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return buildProgressIndicator(context);
        } else if (controller.bookingData.isEmpty) {
          return const Center(
            child: Text('No bookings available'),
          );
        } else {
          // For smaller screens
          return screenWidth < 450
              ? ListView.builder(
                  itemCount: controller.bookingData.length,
                  itemBuilder: (context, index) {
                    var bookingData = controller.bookingData[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => BookingDetailScreen(
                            bookingOrderId: bookingData.orderId,
                            sPhone: bookingData.oPhone,
                            sEmail: bookingData.oEmail,
                            sName: bookingData.oName));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: darkBlueColor,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Booking Details',
                                          style: GoogleFonts.lato(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Icon(
                                          Icons.calendar_today,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      'Customer: ${bookingData.oName}',
                                      style: GoogleFonts.lato(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Status: ${bookingData.orderStatus}',
                                      style: GoogleFonts.lato(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Phone: ${bookingData.oPhone}',
                                      style: GoogleFonts.lato(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Email: ${bookingData.oEmail}',
                                      style: GoogleFonts.lato(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Price: \$${bookingData.oSubtotal}',
                                      style: GoogleFonts.lato(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Date & Time: ${controller.formatDate(bookingData.bookingDate)} : ${bookingData.bookingTime}',
                                      style: GoogleFonts.lato(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  })
              : SafeArea(
                  child: SingleChildScrollView(
                    child: PaginatedDataTable(
                      columns: [
                        DataColumn(
                          label: Text(
                            'Order',
                            style: GoogleFonts.cormorant(
                              color: Colors.white,
                              fontSize: 20,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Status',
                            style: GoogleFonts.cormorant(
                              color: Colors.white,
                              fontSize: 20,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Customer',
                            style: GoogleFonts.cormorant(
                              color: Colors.white,
                              fontSize: 20,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Phone',
                            style: GoogleFonts.cormorant(
                              color: Colors.white,
                              fontSize: 20,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Email',
                            style: GoogleFonts.cormorant(
                              color: Colors.white,
                              fontSize: 20,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Appointment Date & Time',
                            style: GoogleFonts.cormorant(
                              color: Colors.white,
                              fontSize: 20,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Price',
                            style: GoogleFonts.cormorant(
                              color: Colors.white,
                              fontSize: 20,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Align(
                            child: Text(
                              'Action',
                              style: GoogleFonts.cormorant(
                                color: Colors.white,
                                fontSize: 20,
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                      source: _BookingDataSource(controller.bookingData),
                      dataRowHeight: 60,
                      columnSpacing: 20,
                      horizontalMargin: 40,
                      showFirstLastButtons: true,
                      rowsPerPage: 10,
                      sortAscending: true,
                      arrowHeadColor: darkBlueColor,
                      showEmptyRows: false,
                    ),
                  ),
                );
        }
      }),
    );
  }
}

class _BookingDataSource extends DataTableSource {
  final List<Booking> _bookings;
  final BookingController controller = Get.find<BookingController>();

  _BookingDataSource(this._bookings);

  @override
  DataRow? getRow(int index) {
    final booking = _bookings[index];
    return DataRow(cells: [
      DataCell(Text(booking.orderId)),
      DataCell(Text(booking.orderStatus)),
      DataCell(Text(booking.oName)),
      DataCell(Text(booking.oPhone)),
      DataCell(Text(booking.oEmail)),
      DataCell(Text(
          '${controller.formatDate(booking.bookingDate)} : ${booking.bookingTime}')),
      DataCell(Text('\$${booking.oSubtotal}')),
      DataCell(Row(
        children: [
          ElevatedButton(
              onPressed: () {
                Get.to(() => BookingDetailScreen(
                    bookingOrderId: booking.orderId,
                    sPhone: booking.oPhone,
                    sEmail: booking.oEmail,
                    sName: booking.oName));
              },
              child: const Text('View')),
        ],
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _bookings.length;

  @override
  int get selectedRowCount => 0;
}
