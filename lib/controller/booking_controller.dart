import 'dart:convert';

import 'package:barber_portal/model/booking_details_model.dart';
import 'package:get/get.dart';

import '../const/globals.dart';
import '../model/booking_model.dart';

import 'package:http/http.dart' as http;

class BookingController extends GetxController {
  // Example data, replace with your actual data source
  // RxList bookingData = orderBooking.obs;

  // Method to change the status of a booking
  // void changeStatus(int index, BookingStatus newStatus) {
  //   bookingData[index].status = newStatus;
  //   update(); // Notify listeners that the data has changed
  // }

  // Method to format date

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getBookingdata();
  }

  String formatDate(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  // GET API Method for Admin And Stylist Login
  Future<List<Booking>> getBookingdata() async {
    http.Response response = await http.get(Uri.parse(
        'https://salons.sgsolutionsgroup.com/sassapi/get_booking/$id'));

    try {
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body) as List;
        print(id);
        List<Booking> bookingData =
            jsonData.map((json) => Booking.fromJson(json)).toList();

        return bookingData;
      }
    } catch (e) {
      print(e.toString());
    }
    // If something went wrong, return an empty list
    return [];
  }

  // Booking Details Api Method to Get Booking Details Data
  Future<List<BookingDetailsModel>> getBookingDetailsData(
      String orderId) async {
    http.Response response = await http.get(Uri.parse(
        'https://salons.sgsolutionsgroup.com/Sassapi/booking_detail/$orderId'));
    try {
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body) as List;
        print(id);
        List<BookingDetailsModel> bookingDetailsData =
            jsonData.map((json) => BookingDetailsModel.fromJson(json)).toList();

        return bookingDetailsData;
      }
    } catch (e) {
      print(e.toString());
    }
    // If something went wrong, return an empty list
    return [];
  }
}

// Model for booking data

// Enum for booking status
enum BookingStatus {
  scheduled,
  completed,
  canceled,
}
