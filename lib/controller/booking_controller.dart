import 'package:get/get.dart';

import '../model/data.dart';

class BookingController extends GetxController {
  // Example data, replace with your actual data source
  RxList bookingData = orderBooking.obs;

  // Method to change the status of a booking
  void changeStatus(int index, BookingStatus newStatus) {
    bookingData[index].status = newStatus;
    update(); // Notify listeners that the data has changed
  }

  // Method to format date
  String formatDate(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }
}

// Model for booking data

// Enum for booking status
enum BookingStatus {
  scheduled,
  completed,
  canceled,
}
