import 'dart:convert';
import 'package:barber_portal/model/booking_details_model.dart';
import 'package:get/get.dart';
import '../const/globals.dart';
import '../model/booking_model.dart';
import 'package:http/http.dart' as http;

class BookingController extends GetxController {
  var bookingData = <Booking>[].obs;
  var bookingDetailsData = <BookingDetailsModel>[].obs;
  var isLoading = false.obs;
  var isBookingDetailsLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getBookingData();
  }

  String formatDate(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  // GET API Method for Admin And Stylist Login
  Future<void> getBookingData() async {
    isLoading.value = true;
    try {
      final response = await http.get(Uri.parse(
          'https://salons.sgsolutionsgroup.com/sassapi/get_booking/$id'));

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body) as List;
        bookingData.value =
            jsonData.map((json) => Booking.fromJson(json)).toList();
      } else {
        Get.snackbar(
            'Error', 'Failed to load booking data: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
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
