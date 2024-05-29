import 'package:barber_portal/const/color.dart';
import 'package:barber_portal/const/globals.dart';
import 'package:barber_portal/controller/services_controller.dart';
import 'package:barber_portal/model/added_services_model.dart';
import 'package:barber_portal/screens/Menu/add_services_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/progress_indicator.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    var menuController = Get.put(ServicesController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Screen'),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => AddServiceScreen());
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: StreamBuilder<List<AddedServices>>(
        stream: menuController.servicesStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show circular progress indicator for up to 10 seconds
            return buildProgressIndicator(context);
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No services found'));
          } else {
            List<AddedServices> services = snapshot.data!.reversed.toList();
            return ListView.builder(
              itemCount: services.length,
              itemBuilder: (context, index) {
                AddedServices service = services[index];
                return ListTile(
                  title: Text(
                    service.mTitle,
                    style: TextStyle(color: Colors.red),
                  ),
                  subtitle: Text(service.mDesc),
                  trailing: Text('\$${service.price}',
                      style: TextStyle(color: darkBlueColor)),
                );
              },
            );
          }
        },
      ),
    );
  }

 
}
