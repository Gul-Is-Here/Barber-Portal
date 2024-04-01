import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../const/color.dart';
import '../../controller/menu_controller.dart';
import 'menu_items.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> with TickerProviderStateMixin {
  final controller = Get.put(AddMenuController());

  Future<void> modelBottom() async {
    BookingItem? newBooking = await showModalBottomSheet<BookingItem>(
      context: context,
      isScrollControlled:
          true, // Allows the bottom sheet to cover the whole screen
      builder: (context) {
        return FractionallySizedBox(
          heightFactor:
              0.9, // Adjust this factor as needed to cover the desired portion of the screen
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Category',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Obx(() => DropdownButton<String>(
                        isExpanded: true,
                        iconEnabledColor: darkBlueColor,
                        elevation: 4,
                        dropdownColor: Colors.white,
                        style:
                            const TextStyle(color: darkBlueColor, fontSize: 12),
                        borderRadius: BorderRadius.circular(10),
                        icon: const Icon(Icons.arrow_drop_down_circle_outlined,
                            color: darkBlueColor),
                        value: controller.selectedCategory.value.isEmpty
                            ? null
                            : controller.selectedCategory.value,
                        hint: const Text('Select Category'),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            controller.setSelectedCategory(newValue);
                            newValue = null;
                          }
                        },
                        items: controller.categories
                            .map((category) => DropdownMenuItem<String>(
                                  value: category,
                                  child: Text(category),
                                ))
                            .toList(),
                      )),
                  SizedBox(height: 20),
                  Text(
                    'Subcategory',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Obx(() => DropdownButton<String>(
                        isExpanded: true,
                        iconEnabledColor: darkBlueColor,
                        elevation: 4,
                        dropdownColor: Colors.white,
                        style:
                            const TextStyle(fontSize: 12, color: darkBlueColor),
                        borderRadius: BorderRadius.circular(10),
                        icon: const Icon(
                          Icons.arrow_drop_down_circle_outlined,
                          color: darkBlueColor,
                        ),
                        value: controller.selectedSubcategory.value.isEmpty
                            ? null
                            : controller.selectedSubcategory.value.string,
                        hint: Text('Select Subcategory'),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            controller.setSelectedSubcategory(newValue);
                            newValue = null;
                          }
                        },
                        items: controller.selectedCategory.value.isEmpty
                            ? []
                            : controller.itemsByCategory[
                                    controller.selectedCategory.value]!
                                .map((subcategory) => DropdownMenuItem<String>(
                                      value: subcategory,
                                      child: Text(subcategory),
                                    ))
                                .toList(),
                      )),
                  const SizedBox(height: 20),
                  TextFormField(
                    style: Theme.of(context).textTheme.titleSmall,
                    decoration: InputDecoration(
                      labelText: 'Price',
                      labelStyle: Theme.of(context).textTheme.titleLarge,
                      hintText: 'Enter Price (1 - 10 dollars)',
                      border: const UnderlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      controller.setEnteredPrice(double.tryParse(value) ?? 0.0);
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      if (controller.isPriceValid()) {
                        BookingItem bookingItem = BookingItem(
                          category: controller.selectedCategory.value,
                          subcategory: [
                            controller.selectedSubcategory.value.string
                          ],
                          prize: controller.enteredPrice.value,
                          id: DateTime.now().toString(),
                        );
                        Navigator.pop(context, bookingItem);
                      } else {
                        Get.snackbar(
                          'Invalid Price',
                          'Please enter a price between 1 and 10 dollars',
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                          animationDuration: Duration(milliseconds: 500),
                          duration: Duration(seconds: 3),
                          snackPosition: SnackPosition.BOTTOM,
                          borderRadius: 10,
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(15),
                          snackStyle: SnackStyle.GROUNDED,
                          isDismissible: true,
                          forwardAnimationCurve: Curves.easeOutBack,
                          reverseAnimationCurve: Curves.easeInBack,
                          icon: const Icon(
                            Icons.error_outline,
                            color: Colors.white,
                          ),
                        );
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    if (newBooking != null) {
      setState(() {
        controller.bookings.add(newBooking);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenColor,
        actions: [
          IconButton(onPressed: modelBottom, icon: const Icon(Icons.add))
        ],
        title: Text('Booking Screen', style: GoogleFonts.poppins()),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: controller.bookings.length,
              itemBuilder: (context, index) {
                final booking = controller.bookings[index];
                return Dismissible(
                  key: Key(booking.id),
                  onDismissed: (direction) {
                    setState(() {
                      controller.bookings.removeAt(index);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const SizedBox(
                          height: 50,
                          child: Padding(
                            padding: EdgeInsets.all(11),
                            child: Text(
                              "Booking dismissed",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                        ),
                        backgroundColor: darkBlueColor,
                        action: SnackBarAction(
                          label: "Undo",
                          textColor: Colors.white,
                          onPressed: () {
                            setState(() {
                              controller.bookings.insert(index, booking);
                            });
                          },
                        ),
                        duration: Duration(seconds: 2),
                        animation: CurvedAnimation(
                          parent: AnimationController(
                            vsync: this,
                            duration: Duration(milliseconds: 500),
                          ),
                          curve: Curves.easeInOut,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  },
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20.0),
                    child: Icon(Icons.delete, size: 40, color: Colors.white),
                  ),
                  child: Card(
                    elevation: 4,
                    margin: EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            booking.category,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: darkBlueColor,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            booking.subcategory.join(", "),
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '\$${booking.prize}',
                            style: const TextStyle(
                              fontSize: 18,
                              color: darkBlueColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            DateFormat.yMMMMEEEEd().format(DateTime.now()),
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
