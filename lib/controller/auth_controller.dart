import 'dart:convert';

import 'package:barber_portal/screens/Home_Screen/home_screen.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../const/globals.dart';
import '../model/user_model.dart';

class AuthController extends GetxController {
  final formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // Future<List<User>> getUserdata() async {
  //   http.Response response = await http.get(Uri.parse(
  //       'https://salons.sgsolutionsgroup.com/sassapi/get_booking/$id'));

  //   if (response.statusCode == 200) {
  //     var jsonData = jsonDecode(response.body) as List;
  //     print(id);
  //     List<User> userData =
  //         jsonData.map((json) => User.fromJson(json)).toList();
  //     print(userData);
  //     return userData;
  //   }

  //   // If something went wrong, return an empty list
  //   return [];
  // }

  Future<bool> userAuthentication(
      String email, String password, BuildContext context) async {
    http.Response authResponse = await http.post(
      Uri.parse(
          'https://salons.sgsolutionsgroup.com/sassapi/get_stylist'), // Replace with your authentication endpoint
      body: jsonEncode({'email': email, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );

    if (authResponse.statusCode == 200) {
      var responseData = jsonDecode(authResponse.body);
      List<dynamic> userData =
          responseData.map((json) => User.fromJson(json)).toList();

      for (int i = 0; i < userData.length; i++) {
        // Iterate over userData correctly
        if (userData[i].email == email &&
            userData[i].password ==
                md5.convert(utf8.encode(password)).toString()) {
          id = userData[i].id;
          if (id == userData[i].id) {
            print(id);
          }

          // Authentication successful, navigate to home screen
          if (formkey.currentState!.validate()) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return HomeScreen();
            }));
          } else {
            return false;
          }
          return true;
        }
      }

      // If no matching user is found, show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid email or password.'),
        ),
      );
      return false;
    } else {
      // Failed to communicate with the authentication endpoint
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to communicate with the server.'),
        ),
      );
      return false;
    }
  }
}
