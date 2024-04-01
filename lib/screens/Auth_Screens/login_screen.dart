import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:barber_portal/const/color.dart';
import 'package:barber_portal/home_screen.dart';
import 'package:flutter/widgets.dart';

import 'password_rest_screen.dart';

class AnimatedLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  const SizedBox(height: 150),
                  // Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * .1),
                    child: TextFormField(
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
                        horizontal: MediaQuery.of(context).size.width * .1),
                    child: TextFormField(
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
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                      );
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
