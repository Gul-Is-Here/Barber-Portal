import 'dart:convert';

class Booking {
    final String orderId;
    final String oName;
    final String oPhone;
    final String oEmail;
    final String oMessage;
    final DateTime bookingDate;
    final String bookingTime;
    final String orderStatus;
    final String oSubtotal;
    final String locationId;
    final String stylistId;
    final DateTime dateTime;

    Booking({
        required this.orderId,
        required this.oName,
        required this.oPhone,
        required this.oEmail,
        required this.oMessage,
        required this.bookingDate,
        required this.bookingTime,
        required this.orderStatus,
        required this.oSubtotal,
        required this.locationId,
        required this.stylistId,
        required this.dateTime,
    });

    factory Booking.fromRawJson(String str) => Booking.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        orderId: json["order_id"],
        oName: json["o_name"],
        oPhone: json["o_phone"],
        oEmail: json["o_email"],
        oMessage: json["o_message"],
        bookingDate: DateTime.parse(json["booking_date"]),
        bookingTime: json["booking_time"],
        orderStatus: json["order_status"],
        oSubtotal: json["o_subtotal"],
        locationId: json["location_id"],
        stylistId: json["stylist_id"],
        dateTime: DateTime.parse(json["date_time"]),
    );

    Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "o_name": oName,
        "o_phone": oPhone,
        "o_email": oEmail,
        "o_message": oMessage,
        "booking_date": "${bookingDate.year.toString().padLeft(4, '0')}-${bookingDate.month.toString().padLeft(2, '0')}-${bookingDate.day.toString().padLeft(2, '0')}",
        "booking_time": bookingTime,
        "order_status": orderStatus,
        "o_subtotal": oSubtotal,
        "location_id": locationId,
        "stylist_id": stylistId,
        "date_time": dateTime.toIso8601String(),
    };
}
