import 'dart:convert';

class User {
  final String id;
  final String roleId;
  final String locationId;
  final String address;
  final String bioDesc;
  final String imgSrc;
  final String username;
  final String password;
  final String email;
  final String banned;
  final dynamic banReason;
  final String contact;
  final String skill;
  final String designation;
  final String experience;
  final DateTime created;
  final DateTime modified;

  User({
    required this.id,
    required this.roleId,
    required this.locationId,
    required this.address,
    required this.bioDesc,
    required this.imgSrc,
    required this.username,
    required this.password,
    required this.email,
    required this.banned,
    required this.banReason,
    required this.contact,
    required this.skill,
    required this.designation,
    required this.experience,
    required this.created,
    required this.modified,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        roleId: json["role_id"],
        locationId: json["location_id"],
        address: json["address"],
        bioDesc: json["bio_desc"],
        imgSrc: json["img_src"],
        username: json["username"],
        password: json["password"],
        email: json["email"],
        banned: json["banned"],
        banReason: json["ban_reason"],
        contact: json["contact"],
        skill: json["skill"],
        designation: json["designation"],
        experience: json["experience"],
        created: DateTime.parse(json["created"]),
        modified: DateTime.parse(json["modified"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "role_id": roleId,
        "location_id": locationId,
        "address": address,
        "bio_desc": bioDesc,
        "img_src": imgSrc,
        "username": username,
        "password": password,
        "email": email,
        "banned": banned,
        "ban_reason": banReason,
        "contact": contact,
        "skill": skill,
        "designation": designation,
        "experience": experience,
        "created": created.toIso8601String(),
        "modified": modified.toIso8601String(),
      };
}
