import 'package:meta/meta.dart';
import 'dart:convert';

class AddedServices {
    final String smId;
    final String mId;
    final String serviceId;
    final String stylistId;
    final String mTitle;
    final String mDesc;
    final String price;
    final DateTime dateTime;

    AddedServices({
        required this.smId,
        required this.mId,
        required this.serviceId,
        required this.stylistId,
        required this.mTitle,
        required this.mDesc,
        required this.price,
        required this.dateTime,
    });

    factory AddedServices.fromRawJson(String str) => AddedServices.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AddedServices.fromJson(Map<String, dynamic> json) => AddedServices(
        smId: json["sm_id"],
        mId: json["m_id"],
        serviceId: json["service_id"],
        stylistId: json["stylist_id"],
        mTitle: json["m_title"],
        mDesc: json["m_desc"],
        price: json["price"],
        dateTime: DateTime.parse(json["date_time"]),
    );

    Map<String, dynamic> toJson() => {
        "sm_id": smId,
        "m_id": mId,
        "service_id": serviceId,
        "stylist_id": stylistId,
        "m_title": mTitle,
        "m_desc": mDesc,
        "price": price,
        "date_time": dateTime.toIso8601String(),
    };
}
