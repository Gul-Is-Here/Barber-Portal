import 'package:barber_portal/screens/Menu/add_services_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Screen'),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => AddServiceScreen());
              },
              icon: const Icon(Icons.add))
        ],
      ),
    );
  }
}
