import 'package:barber_portal/controller/auth_controller.dart';
import 'package:barber_portal/screens/Auth_Screens/password_rest_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../const/color.dart';
import '../Home_Screen/home_screen.dart';

class AnimatedLoginScreen extends StatefulWidget {
  @override
  State<AnimatedLoginScreen> createState() => _AnimatedLoginScreenState();
}

class _AnimatedLoginScreenState extends State<AnimatedLoginScreen> {
  var controller = Get.put(AuthController());

  final formKey1 = GlobalKey<FormState>();
  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: screenWidth < 450 || screenHeight < 900
          ? SingleChildScrollView(
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
                    height: MediaQuery.of(context).size.height - 100,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
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
                          key: formKey2,
                          child: Column(
                            children: [
                              const SizedBox(height: 150),
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
                                    prefixIcon:
                                        Icon(Icons.email, color: greenColor),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: greenColor),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: greenColor),
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
                                  validator: (value) {
                                    if (value!.length < 4) {
                                      return 'Password mustbe 4 character long';
                                    }
                                  },
                                  controller: controller.passwordController,
                                  decoration: const InputDecoration(
                                    hintText: 'Password',
                                    hintStyle: TextStyle(color: greenColor),
                                    prefixIcon:
                                        Icon(Icons.lock, color: greenColor),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: greenColor),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: greenColor),
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
                                      builder: (context) =>
                                          ResetPasswordScreen(),
                                    ),
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
                        Obx(
                          () => controller.isLoading.value
                              ? CircularProgressIndicator(
                                  color: greenColor,
                                )
                              : ElevatedButton(
                                  onPressed: () async {
                                    if (formKey2.currentState!.validate()) {
                                      controller.isLoading.value = true;
                                      bool isAuthenticated =
                                          await controller.userAuthentication(
                                        controller.emailController.text,
                                        controller.passwordController.text,
                                        context,
                                      );
                                      if (isAuthenticated) {
                                        controller.isLogged(context);
                                      }
                                      controller.isLoading.value = false;
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: greenColor,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.of(context).size.width *
                                                .35),
                                    child: const Text(
                                      'Login',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : SingleChildScrollView(
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
                          key: formKey1,
                          child: Column(
                            children: [
                              const SizedBox(height: 150),
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
                                    prefixIcon:
                                        Icon(Icons.email, color: greenColor),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: greenColor),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: greenColor),
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
                                    prefixIcon:
                                        Icon(Icons.lock, color: greenColor),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: greenColor),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: greenColor),
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
                                        builder: (context) =>
                                            ResetPasswordScreen()),
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
                          onPressed: () async {
                            bool isAuthenticated =
                                await controller.userAuthentication(
                              controller.emailController.text,
                              controller.passwordController.text,
                              context,
                            );

                            if (isAuthenticated) {
                              // Navigate to the home screen
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()),
                              );

                              // Call isLogged to handle further navigation based on authentication status
                              controller.isLogged(context);
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
                                horizontal:
                                    MediaQuery.of(context).size.width * .35),
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
