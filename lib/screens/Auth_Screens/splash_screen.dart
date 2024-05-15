import 'dart:async';
import 'package:barber_portal/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  var controller = Get.put(AuthController());

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _animation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _animationController.forward();

    Timer(
      const Duration(seconds: 3),
      // Duration of the splash screen
      () {
        // Navigate to home screen
        controller.isLogged(context);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: C,
      body:  Center(
        child: ScaleTransition(
          scale: _animation,
          child: Container(
            width: 200.0,
            height: 200.0,
            decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage('assets/images/logo.png'), // Your logo image
              ),
            ),
          ),
        ),
      ),
    );
  }
}
