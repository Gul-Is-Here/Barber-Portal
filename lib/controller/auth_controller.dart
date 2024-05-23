import 'dart:convert';
import 'package:barber_portal/screens/Auth_Screens/login_screen.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../const/globals.dart';
import '../model/user_model.dart';
import '../screens/Home_Screen/home.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Method to handle user authentication
  Future<bool> userAuthentication(
      String email, String password, BuildContext context) async {
    const url = 'https://salons.sgsolutionsgroup.com/sassapi/get_stylist';
    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode({'email': email, 'password': password}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        List<dynamic> userData =
            responseData.map((json) => User.fromJson(json)).toList();

        for (int i = 0; i < userData.length; i++) {
          if (userData[i].email == email &&
              userData[i].password ==
                  md5.convert(utf8.encode(password)).toString()) {
            id = userData[i].id;

            // Store user ID in SharedPreferences
            await _storeUserId(id);
            print(_storeUserId(id));

            // Clear input fields
            emailController.clear();
            passwordController.clear();
            return true;
          }
        }

        // If no matching user is found, show an error message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invalid email or password.'),
          ),
        );
        return false;
      } else {
        // Log the response body for debugging
        print('Server response: ${response.body}');

        // Failed to communicate with the authentication endpoint
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to communicate with the server.'),
          ),
        );
        return false;
      }
    } catch (error) {
      // Log the error for debugging
      print('Error: $error');

      // Handle error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred. Please try again later.'),
        ),
      );
      return false;
    }
  }

  // Method to store user ID in SharedPreferences
  Future<void> _storeUserId(String id) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('user_id', id); // Storing user ID locally
  }

  // Method to check if the user is logged in using SharedPreferences
  Future<void> isLogged(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final storedId = prefs.getString('user_id'); // Retrieving stored user ID
    print('storedId =>  $storedId');

    if (storedId != null) {
      // User is logged in, navigate to home screen
      id = storedId;
      Get.offAll(() => Home());
    } else {
      // User is not logged in, navigate to login screen
      Get.offAll(() => const AnimatedLoginScreen());
    }
  }

  // Method to handle user logout
  Future<void> logout() async {
    // Reset user ID in SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_id');
    await prefs.clear();
    // Navigate to login screen
    Get.offAll(() => const AnimatedLoginScreen());

    Get.snackbar(
      'Logout',
      'Logout Successfully',
      snackPosition: SnackPosition.BOTTOM, // Show SnackBar at the bottom
      duration: const Duration(seconds: 3), // Optional
      backgroundColor: Color.fromARGB(255, 76, 104, 117), // Optional
      colorText: Colors.white, // Optional
      borderRadius: 10, // Optional
      margin: EdgeInsets.all(10), // Optional
      padding: EdgeInsets.all(20), // Optional
      dismissDirection: DismissDirection.horizontal, // Optional
      forwardAnimationCurve: Curves.easeOut, // Optional
      reverseAnimationCurve: Curves.easeIn, // Optional
    );
  }
}
