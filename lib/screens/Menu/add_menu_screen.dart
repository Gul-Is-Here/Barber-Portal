// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../../const/color.dart';
// import '../../controller/booking_controller.dart';
// import 'add_booking_screen.dart';
// import 'booking_items.dart'; // Import the BookingItem class

// class AddBookingScreen extends StatelessWidget {
//   const AddBookingScreen({super.key});

//   // Variable to store selected date
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(AddBookingController());
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: greenColor,
//         title: const Text(
//           'Add Booking',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Text(
//               'Category',
//               style: Theme.of(context).textTheme.titleLarge,
//             ),
//             Obx(() => DropdownButton<String>(
//                   isExpanded: true,
//                   iconEnabledColor: darkBlueColor,
//                   elevation: 4,
//                   dropdownColor: Colors.white,
//                   style: const TextStyle(color: darkBlueColor, fontSize: 12),
//                   borderRadius: BorderRadius.circular(10),
//                   icon: const Icon(Icons.arrow_drop_down_circle_outlined,
//                       color: darkBlueColor),
//                   value: controller.selectedCategory.value.isEmpty
//                       ? null
//                       : controller.selectedCategory.value,
//                   hint: const Text('Select Category'),
//                   onChanged: (String? newValue) {
//                     if (newValue != null) {
//                       controller.setSelectedCategory(newValue);
//                       newValue = null;
//                     }
//                   },
//                   items: controller.categories
//                       .map((category) => DropdownMenuItem<String>(
//                             value: category,
//                             child: Text(category),
//                           ))
//                       .toList(),
//                 )),
//             const SizedBox(height: 20),
//             Text(
//               'Subcategory',
//               style: Theme.of(context).textTheme.titleLarge,
//             ),
//             Obx(() => DropdownButton<String>(
//                   isExpanded: true,
//                   iconEnabledColor: darkBlueColor,
//                   elevation: 4,
//                   dropdownColor: Colors.white,
//                   style: const TextStyle(fontSize: 12, color: darkBlueColor),
//                   borderRadius: BorderRadius.circular(10),
//                   icon: const Icon(
//                     Icons.arrow_drop_down_circle_outlined,
//                     color: darkBlueColor,
//                   ),
//                   value: controller.selectedSubcategory.value.isEmpty
//                       ? null
//                       : controller.selectedSubcategory.value.string,
//                   hint: const Text('Select Subcategory'),
//                   onChanged: (String? newValue) {
//                     if (newValue != null) {
//                       controller.setSelectedSubcategory(newValue);
//                       newValue = null;
//                     }
//                   },
//                   items: controller.selectedCategory.value.isEmpty
//                       ? []
//                       : controller
//                           .itemsByCategory[controller.selectedCategory.value]!
//                           .map((subcategory) => DropdownMenuItem<String>(
//                                 value: subcategory,
//                                 child: Text(subcategory),
//                               ))
//                           .toList(),
//                 )),
//             const SizedBox(height: 20),
//             // ElevatedButton(
//             //   onPressed: () => controller
//             //       .selectDate(context), // Show date picker on button press
//             //   child: Text(controller.selectedDate == null
//             //       ? 'Select Date'
//             //       : 'Selected Date: ${controller.selectedDate!.toString().split(' ')[0]}'),
//             // ),
//             const SizedBox(height: 20),
//             TextFormField(
//               style: Theme.of(context).textTheme.titleMedium,
//               decoration: InputDecoration(
//                 labelText: 'Price',
//                 labelStyle: Theme.of(context).textTheme.titleLarge,
//                 hintText: 'Enter Price (1 - 10 dollars)',
//                 border: const UnderlineInputBorder(),
//               ),
//               keyboardType: TextInputType.number,
//               onChanged: (value) {
//                 controller.setEnteredPrice(double.tryParse(value) ?? 0.0);
//               },
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 if (controller.isPriceValid()) {
//                   // Create a BookingItem object with selected values
//                   BookingItem bookingItem = BookingItem(
//                     category: controller.selectedCategory.value,
//                     subcategory: [controller.selectedSubcategory.value.string],
//                     prize: controller.enteredPrice.value,
//                     // date: controller
//                     //     .selectedDate!, // Assign selected date to the booking item
//                     id: DateTime.now().toString(),
//                   );

//                   // Send back the booking item to the previous screen
//                   Navigator.of(context).pop([bookingItem]);
//                 } else {
//                   Get.snackbar(
//                     'Invalid Price',
//                     'Please enter a price between 1 and 10 dollars',
//                   );
//                 }
//               },
//               child: const Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
