import 'package:barber_portal/controller/auth_controller.dart';
import 'package:barber_portal/screens/Home_Screen/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:barber_portal/const/color.dart';
import 'package:barber_portal/screens/Home_Screen/home_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'password_rest_screen.dart';

class AnimatedLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        // Wrap with SingleChildScrollView
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              // Adjust height to cover remaining screen space
              height: MediaQuery.of(context).size.height - 100,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                  ),
                ],
              ),

              child: Column(
                children: [
                  Form(
                    key: controller.formkey,
                    child: Column(
                      children: [
                        const SizedBox(height: 150),
                        // Spacer(),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * .1),
                          child: TextFormField(
                            controller: controller.emailController,
                            validator: (value) {
                              if (value!.isEmpty ||
                                  value.contains(
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')) {
                                return 'Please enter a valid email';
                              } else {
                                return null;
                              }
                            },
                            decoration: const InputDecoration(
                              hintText: 'Email',
                              hintStyle: TextStyle(color: greenColor),
                              prefixIcon: Icon(Icons.email, color: greenColor),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: greenColor),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: greenColor), // Add bottom border
                              ),
                            ),
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal:
                                  MediaQuery.of(context).size.width * .1),
                          child: TextFormField(
                            controller: controller.passwordController,
                            decoration: const InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(color: greenColor),
                              prefixIcon: Icon(Icons.lock, color: greenColor),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: greenColor),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: greenColor), // Add bottom border
                              ),
                            ),
                            obscureText: true,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => ResetPasswordScreen()),
                            );
                          },
                          child: const Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(color: darkBlueColor),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (controller.userAuthentication(
                              controller.emailController.text,
                              controller.passwordController.text,
                              // ignore: unrelated_type_equality_checks
                              context) ==
                          true) {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: greenColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * .35),
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
