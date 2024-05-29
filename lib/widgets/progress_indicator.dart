import 'package:flutter/material.dart';

Widget buildProgressIndicator(BuildContext context) {
  // Use a timer to limit the duration of the circular progress indicator
  return FutureBuilder<bool>(
    future: Future.delayed(Duration(seconds: 10), () => true),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        // Show circular progress indicator
        return Center(child: CircularProgressIndicator());
      } else {
        // Show Snackbar about slow internet connection
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Your internet connection is slow'),
          ),
        );
        // Return an empty container
        return Container();
      }
    },
  );
}
