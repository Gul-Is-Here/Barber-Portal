import 'package:flutter/material.dart';

import '../const/color.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      backgroundColor: Colors.white,
      title: const Text(
        'Confirmation',
        style: TextStyle(
          color: darkBlueColor,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: const Text(
        'Are you sure?',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.0,
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            // Add your logic for confirming here
            Navigator.of(context).pop(true); // Close the dialog with true
          },
          child: const Text('Yes'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(false); // Close the dialog with false
          },
          child: const Text('No'),
        ),
      ],
    );
  }
}
