import 'package:barber_portal/const/color.dart';
import 'package:barber_portal/controller/booking_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

import '../model/data.dart';
import '../model/order_model.dart';
import '../screens/Booking_Screen/view_booking_screen.dart';

class PaginatedTableWidget extends StatelessWidget {
  const PaginatedTableWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookingController());
    final DataTableSource mydata =
        Paginated(controller.bookingData as List<OrderData>, context);
    return Theme(
      data: Theme.of(context).copyWith(
        dataTableTheme: DataTableThemeData(
          dataRowColor: MaterialStateColor.resolveWith(
              (states) => Colors.white), // Change the row color
          headingRowColor: MaterialStateColor.resolveWith(
              (states) => darkBlueColor), // Change the heading row color
        ),
      ),
      child: SingleChildScrollView(
        child: PaginatedDataTable(
          columns: [
            DataColumn(
              label: Text(
                'Order',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            DataColumn(
              label:
                  Text('Status', style: Theme.of(context).textTheme.headline6),
            ),
            DataColumn(
              label: Text('Customer',
                  style: Theme.of(context).textTheme.headline6),
            ),
            DataColumn(
              label:
                  Text('Phone', style: Theme.of(context).textTheme.headline6),
            ),
            DataColumn(
              label:
                  Text('Email', style: Theme.of(context).textTheme.headline6),
            ),
            DataColumn(
              label: Text('Appointment Date & Time',
                  style: Theme.of(context).textTheme.headline6),
            ),
            DataColumn(
              label:
                  Text('Price', style: Theme.of(context).textTheme.headline6),
            ),
            DataColumn(
              label: Align(
                child: Text('Action',
                    style: Theme.of(context).textTheme.headline6),
              ),
            )
          ],
          source: mydata,
          dataRowHeight: 80,
          columnSpacing: 30,
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
}

class Paginated extends DataTableSource {
  final List<OrderData> bookingData;
  final BookingController controller = Get.put(BookingController());

  Paginated(this.bookingData, this.context);
  BuildContext context;

  @override
  DataRow? getRow(int index) {
    final order = bookingData[index];

    return DataRow(cells: [
      DataCell(Text(
        order.orderNumber,
        style: TextStyle(
          color: darkBlueColor,
          fontSize: 16,
          fontFamily: GoogleFonts.lato().toString(),
        ),
      )),
      DataCell(Text(
        order.status.toString().split('.').last,
        style: TextStyle(
          color: darkBlueColor,
          fontSize: 16,
          fontFamily: GoogleFonts.lato().toString(),
        ),
      )),
      DataCell(Text(
        order.customerName,
        style: TextStyle(
          color: darkBlueColor,
          fontSize: 16,
          fontFamily: GoogleFonts.lato().toString(),
        ),
      )),
      DataCell(Text(
        order.phone,
        style: TextStyle(
          color: darkBlueColor,
          fontSize: 16,
          fontFamily: GoogleFonts.lato().toString(),
        ),
      )),
      DataCell(Text(
        order.email,
        style: TextStyle(
          color: darkBlueColor,
          fontSize: 16,
          fontFamily: GoogleFonts.lato().toString(),
        ),
      )),
      DataCell(Text(
        controller.formatDate(order.appointmentAndDate),
        style: TextStyle(
          color: darkBlueColor,
          fontSize: 16,
          fontFamily: GoogleFonts.lato().toString(),
        ),
      )),
      DataCell(Text(
        '\$${order.price.toString()}',
        style: TextStyle(
          color: darkBlueColor,
          fontSize: 16,
          fontFamily: GoogleFonts.lato().toString(),
        ),
      )),
      DataCell(
        Row(
          children: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: greenColor,
                side: const BorderSide(width: 1, color: Colors.white),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      backgroundColor: Colors.white,
                      title: const Text(
                        'Confirmation',
                        style: TextStyle(
                          color: darkBlueColor,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      content: const Text(
                        'Are you sure?',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.red,
                            ),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            // Action when 'Yes' button is pressed
                            controller.changeStatus(
                                index, BookingStatus.canceled);
                            Navigator.of(context).pop(); // Close AlertDialog
                          },
                          child: const Text(
                            'Yes',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.grey,
                            ),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            // Action when 'No' button is pressed
                            Navigator.of(context).pop(); // Close AlertDialog
                          },
                          child: const Text(
                            'No',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text(
                'Complete',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: GoogleFonts.lato().toString(),
                ),
              ),
            ),
            10.widthBox,
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: greenColor,
                side: const BorderSide(width: 1, color: Colors.white),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      backgroundColor: Colors.white,
                      title: const Text(
                        'Confirmation',
                        style: TextStyle(
                          color: darkBlueColor,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      content: const Text(
                        'Are you sure?',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.red,
                            ),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            // Action when 'Yes' button is pressed
                            controller.changeStatus(
                                index, BookingStatus.scheduled);
                            Navigator.of(context).pop(); // Close AlertDialog
                          },
                          child: const Text(
                            'Yes',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.grey,
                            ),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            // Action when 'No' button is pressed
                            Navigator.of(context).pop(); // Close AlertDialog
                          },
                          child: const Text(
                            'No',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: GoogleFonts.lato().toString(),
                ),
              ),
            ),
            10.widthBox,
            IconButton(
              style: IconButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                backgroundColor: darkBlueColor,
              ),
              onPressed: () {
                Get.to(() => BookingDetailScreen(
                      bookingData: order,
                      index: index,
                    ));
              },
              icon: const Icon(
                Icons.remove_red_eye,
                color: Colors.white,
                size: 24,
              ),
            ),
          ],
        ),
      ),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => bookingData.length;

  @override
  int get selectedRowCount => 0;
}
