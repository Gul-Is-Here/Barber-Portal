import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isConnected = false.obs;
  var isDialogShowing = false.obs;
  late ConnectivityResult result;
  late StreamSubscription subscription;
  RxInt selectedIndex = 0.obs;
  void onTapped(int index) {
    selectedIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    checkInternet(Get.context!); // Initial check for internet connectivity
    startStreaming(Get.context!);
  }

  void showDialogBoxIos(BuildContext context) {
    if (isDialogShowing.value) return; // Prevent showing multiple dialogs
    isDialogShowing.value = true;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => CupertinoAlertDialog(
        title: Text('No Internet'),
        content: Text('Check your internet connection'),
        actions: [
          CupertinoButton.filled(
            child: Text('Retry'),
            onPressed: () {
              checkInternet(context);
            },
          )
        ],
      ),
    ).then((_) {
      isDialogShowing.value = false; // Reset the flag when dialog is dismissed
    });
  }

  Future<void> checkInternet(BuildContext context) async {
    result = await Connectivity().checkConnectivity();
    if (result != ConnectivityResult.none) {
      isConnected.value = true;
      if (isDialogShowing.value) {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pop(); // Close the dialog
        isDialogShowing.value = false;
      }
    } else {
      isConnected.value = false;
      if (!isDialogShowing.value) {
        // ignore: use_build_context_synchronously
        showDialogBoxIos(context); // Show the dialog if not already showing
      }
    }
  }

  void startStreaming(BuildContext context) {
    subscription = Connectivity().onConnectivityChanged.listen((event) {
      checkInternet(context);
    });
  }

  @override
  void onClose() {
    subscription.cancel();
    super.onClose();
  }
}
