import 'package:barber_portal/controller/booking_controller.dart';
import 'package:barber_portal/model/booking_model.dart';
import 'package:barber_portal/screens/Booking_Screen/booking_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../const/color.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookingController());
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: FutureBuilder<List<Booking>>(
          future: controller.getBookingdata(),
          builder: (context, AsyncSnapshot<List<Booking>> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  color: greenColor,
                ),
              );
            } else {
              // for smaller Screens
              return screenWidth < 450
                  ? ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var bookingData = snapshot.data![index];
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => BookingDetailScreen(
                                bookingOrderId: snapshot.data![index].orderId,
                                sPhone: snapshot.data![index].oPhone,
                                sEmail: snapshot.data![index].oEmail,
                                sName: snapshot.data![index].oName));
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
                                                fontFamily: GoogleFonts.lato()
                                                    .toString(),
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
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontFamily:
                                                GoogleFonts.lato().toString(),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          'Status: ${bookingData.orderStatus}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontFamily:
                                                GoogleFonts.lato().toString(),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          'Phone: ${bookingData.oPhone}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontFamily:
                                                GoogleFonts.lato().toString(),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          'Email: ${bookingData.oEmail}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontFamily:
                                                GoogleFonts.lato().toString(),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          'Price: \$${bookingData.oSubtotal}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontFamily:
                                                GoogleFonts.lato().toString(),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          'Date & Time: ${controller.formatDate(bookingData.bookingDate)} : ${bookingData.bookingTime} ',
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
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily:
                                        GoogleFonts.cormorant().fontFamily,
                                    fontSize: 20,
                                    letterSpacing: 1.5,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Status',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily:
                                        GoogleFonts.cormorant().fontFamily,
                                    fontSize: 20,
                                    letterSpacing: 1.5,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Customer',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily:
                                        GoogleFonts.cormorant().fontFamily,
                                    fontSize: 20,
                                    letterSpacing: 1.5,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Phone',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily:
                                        GoogleFonts.cormorant().fontFamily,
                                    fontSize: 20,
                                    letterSpacing: 1.5,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Email',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily:
                                        GoogleFonts.cormorant().fontFamily,
                                    fontSize: 20,
                                    letterSpacing: 1.5,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Appointment Date & Time',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily:
                                        GoogleFonts.cormorant().fontFamily,
                                    fontSize: 20,
                                    letterSpacing: 1.5,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Price',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily:
                                        GoogleFonts.cormorant().fontFamily,
                                    fontSize: 20,
                                    letterSpacing: 1.5,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            DataColumn(
                              label: Align(
                                child: Text(
                                  'Action',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily:
                                          GoogleFonts.cormorant().fontFamily,
                                      fontSize: 20,
                                      letterSpacing: 1.5,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                          source: _BookingDataSource(snapshot.data!),
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

  _BookingDataSource(this._bookings);
  final controller = Get.find<BookingController>();

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
