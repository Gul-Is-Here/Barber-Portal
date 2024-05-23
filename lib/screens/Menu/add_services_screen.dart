import 'dart:async';
import 'package:barber_portal/const/color.dart';
import 'package:barber_portal/controller/services_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../const/globals.dart';

class AddServiceScreen extends StatelessWidget {
  AddServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var isLoading = false.obs; // Define local isLoading variable
    var controller = Get.put(ServicesController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Services'),
        backgroundColor: darkBlueColor,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Category Dropdown
                Text(
                  'Select Category',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: darkBlueColor,
                  ),
                ),
                SizedBox(height: 8),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: darkBlueColor, width: 1),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: controller.selectedService.value.isEmpty
                            ? null
                            : controller.selectedService.value,
                        hint: Text('Select Category'),
                        onChanged: (newValue) {
                          controller.selectedService.value = newValue!;
                          controller.serId.value = newValue; // Set ser_id
                          controller.selectedSubCategory.value =
                              ''; // Reset subcategory when category changes
                        },
                        items: controller.addServices.value.services
                            .map((service) {
                          return DropdownMenuItem<String>(
                            value: service.serId,
                            child: Text(service.serTitle),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 16),

                // Subcategory Dropdown
                if (controller.selectedService.value.isNotEmpty) ...[
                  Text(
                    'Select Subcategory',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: darkBlueColor,
                    ),
                  ),
                  SizedBox(height: 8),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: darkBlueColor, width: 1),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: controller.selectedSubCategory.value.isEmpty
                              ? null
                              : controller.selectedSubCategory.value,
                          hint: Text('Select Subcategory'),
                          onChanged: (newValue) {
                            controller.selectedSubCategory.value = newValue!;
                            controller.mId.value = newValue; // Set m_id
                          },
                          items: controller.filteredMenu.map((menu) {
                            return DropdownMenuItem<String>(
                              value: menu.mId,
                              child: Text(menu.mTitle),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ],

                SizedBox(height: 16),

                // Price Input Field
                Text(
                  'Enter Price (\$0 - \$15)',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: darkBlueColor,
                  ),
                ),
                SizedBox(height: 8),
                SizedBox(
                  height: 50,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Price',
                      labelStyle: TextStyle(color: darkBlueColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.teal.shade50,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      ),
                    ),
                    onChanged: (value) {
                      controller.userPrice.value = value;
                    },
                  ),
                ),

                SizedBox(height: 8),

                // Display price validation
                Obx(() {
                  double? price = double.tryParse(controller.userPrice.value);
                  if (price != null && (price < 0 || price > 15)) {
                    return const Text(
                      'Price must be between \$0 and \$15',
                      style: TextStyle(color: Colors.red),
                    );
                  }
                  return Container();
                }),

                const SizedBox(height: 16),
                Center(
                  child: Obx(() {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 160,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: darkBlueColor,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: isLoading.value
                          ? null
                          : () async {
                              if (controller.userPrice.value.isEmpty ||
                                  controller.selectedService.value.isEmpty ||
                                  controller
                                      .selectedSubCategory.value.isEmpty) {
                                Get.snackbar(
                                  'Error',
                                  'Please fill all fields',
                                  snackPosition: SnackPosition.BOTTOM,
                                );
                                return;
                              }

                              isLoading.value = true;

                              await controller.postSelectedData();

                              isLoading.value = false;
                              controller.refreshData(id);

                              Get.snackbar(
                                'Success',
                                'Service added successfully',
                                snackPosition: SnackPosition.BOTTOM,
                              );

                              // Reset form fields
                              controller.selectedService.value = '';
                              controller.selectedSubCategory.value = '';
                              controller.userPrice.value = '';

                              // Pop the screen
                              Navigator.pop(context);
                            },
                      child: isLoading.value
                          ? SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : const Text('Save'),
                    );
                  }),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
