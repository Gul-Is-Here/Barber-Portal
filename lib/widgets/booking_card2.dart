import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class BookingCard2 extends StatelessWidget {
  const BookingCard2({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingRowColor: MaterialStateProperty.all(
            Colors.blueGrey[200]), // Color for the header row
        columns: [
          DataColumn(
              label: Text('Order #',
                  style: TextStyle(
                      fontWeight: FontWeight.bold))), // Bold header text
          DataColumn(label: Text('Status')),
          DataColumn(label: Text('Customer')),
          DataColumn(label: Text('Phone')),
          DataColumn(label: Text('Email')),
          DataColumn(label: Text('Appointment Date & Time')),
          DataColumn(label: Text('Location')),
          DataColumn(label: Text('Price')),
          DataColumn(label: Text('Date & Time')),
          DataColumn(label: Text('Action')),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Text('1')),
            DataCell(ElevatedButton(
              child: Text('Complete'),
              onPressed: () {},
            )),
            DataCell(Text('Alex')),

            DataCell(Text('1233131132')),
            DataCell(Text('dev@gmail.com')),
            DataCell(Text(DateTime.now().toString())),
            DataCell(Text('Richmond')),
            DataCell(Text('\$120')),
            DataCell(Text(DateTime.now().toString())),
            DataCell(Row(
              children: [ElevatedButton(onPressed: () {}, child: Text('view'))],
            )), // Example of a price
          ]),
          // Add more DataRows with different data
        ],
      ).onTap(() {}),
    );
  }
}
