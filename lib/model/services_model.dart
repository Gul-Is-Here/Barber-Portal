import 'package:meta/meta.dart';
import 'dart:convert';

class AddServices {
  final List<Service> services;
  final List<Menu> menu;

  AddServices({
    required this.services,
    required this.menu,
  });

  factory AddServices.fromRawJson(String str) =>
      AddServices.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddServices.fromJson(Map<String, dynamic> json) => AddServices(
        services: List<Service>.from(
            json["services"].map((x) => Service.fromJson(x))),
        menu: List<Menu>.from(json["menu"].map((x) => Menu.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "services": List<dynamic>.from(services.map((x) => x.toJson())),
        "menu": List<dynamic>.from(menu.map((x) => x.toJson())),
      };
}

class Menu {
  final String mId;
  final String serviceId;
  final String mTitle;
  final String mDesc;
  final String minPrice;
  final String maxPrice;
  final DateTime dateTime;

  Menu({
    required this.mId,
    required this.serviceId,
    required this.mTitle,
    required this.mDesc,
    required this.minPrice,
    required this.maxPrice,
    required this.dateTime,
  });

  factory Menu.fromRawJson(String str) => Menu.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        mId: json["m_id"],
        serviceId: json["service_id"],
        mTitle: json["m_title"],
        mDesc: json["m_desc"],
        minPrice: json["min_price"],
        maxPrice: json["max_price"],
        dateTime: DateTime.parse(json["date_time"]),
      );

  Map<String, dynamic> toJson() => {
        "m_id": mId,
        "service_id": serviceId,
        "m_title": mTitle,
        "m_desc": mDesc,
        "min_price": minPrice,
        "max_price": maxPrice,
        "date_time": dateTime.toIso8601String(),
      };
}

class Service {
  final String serId;
  final String serTitle;
  final String serDesc;
  final String locationId;
  final DateTime dateTime;

  Service({
    required this.serId,
    required this.serTitle,
    required this.serDesc,
    required this.locationId,
    required this.dateTime,
  });

  factory Service.fromRawJson(String str) => Service.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        serId: json["ser_id"],
        serTitle: json["ser_title"],
        serDesc: json["ser_desc"],
        locationId: json["location_id"],
        dateTime: DateTime.parse(json["date_time"]),
      );

  Map<String, dynamic> toJson() => {
        "ser_id": serId,
        "ser_title": serTitle,
        "ser_desc": serDesc,
        "location_id": locationId,
        "date_time": dateTime.toIso8601String(),
      };
}
