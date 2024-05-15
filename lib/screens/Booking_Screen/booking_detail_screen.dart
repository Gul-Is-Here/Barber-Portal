import 'package:barber_portal/const/color.dart';
import 'package:barber_portal/model/booking_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/booking_controller.dart';

class BookingDetailScreen extends StatelessWidget {
  String bookingOrderId;
  BookingDetailScreen({
    super.key,
    required this.bookingOrderId,
  });

  @override
  Widget build(BuildContext context) {
    print(bookingOrderId);
    final controller = Get.find<BookingController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Details Screen'),
      ),
      body: FutureBuilder<List<BookingDetailsModel>>(
        future: controller.getBookingDetailsData(bookingOrderId),
        builder: (context, AsyncSnapshot<List<BookingDetailsModel>> snapshot) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var data = snapshot.data![index];
              return Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Buttons Section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: darkGreenColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'Download report',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: darkBlueColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'Send report',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Stylist Information Section
                      Container(
                        color: Colors.grey.shade200,
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Stylist Information",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(80),
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    color: Colors.red,
                                    child: const Icon(
                                      Icons.person,
                                      size: 60,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Name ',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Phone ',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Email ',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                ),
                                const SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data.oName,
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      data.oPhone,
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      data.oEmail,
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Booking Id  ${data.orderId}',
                                          style: const TextStyle(
                                            fontSize: 30,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        TextButton(
                                          onPressed: () {},
                                          style: TextButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              side: const BorderSide(
                                                  width: 1,
                                                  color: darkGreenColor),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          child: data.orderStatus == '0'
                                              ? const Text(
                                                  'Pending',
                                                  style: TextStyle(
                                                      color: darkGreenColor),
                                                )
                                              : const Text(
                                                  'Complete',
                                                  style: TextStyle(
                                                      color: darkGreenColor),
                                                ),
                                        ),
                                        Text(data.locationId)
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Customer Information Section
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Customer Information",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(80),
                                  child: Container(
                                      color: Colors.red,
                                      child: const Icon(
                                        Icons.person,
                                        size: 100,
                                      )),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Name  Gul Faraz',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'Phone  +9201010010',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'Email  gulfaraz@gmail.com}',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    const SizedBox(height: 10),
                                    Text('Booking Date & Time'),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Title and Price Section
                      Container(
                        width: double.infinity,
                        color: Colors.black,
                        padding: const EdgeInsets.all(8.0),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "#id",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              'Title',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              'Price',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),

                      // ListView to display data
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Text('${index + 1}'),
                            ),
                            Text("Women & Girl Cut & Style"),
                            const Padding(
                              padding: EdgeInsets.only(right: 8),
                              child: Text('\$12'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
