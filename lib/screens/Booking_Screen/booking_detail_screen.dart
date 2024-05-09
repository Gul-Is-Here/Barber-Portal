import 'package:barber_portal/const/color.dart';

import 'package:barber_portal/controller/booking_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingDetailScreen extends StatelessWidget {
  const BookingDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BookingController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Details Screen'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Light background color
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: darkGreenColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.download),
                    label: Text('Download report'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: darkBlueColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.send_sharp),
                    label: Text('Send report'),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Stylist Information",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: Container(
                      color: Colors.red,
                      child: Image.asset(
                        "icPerson",
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name:',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: GoogleFonts.lato().toString(),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Phone:',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: GoogleFonts.lato().toString(),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Email:',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: GoogleFonts.lato().toString(),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mike',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: GoogleFonts.lato().toString(),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '+636182893',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: GoogleFonts.lato().toString(),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'mike@gmail.com',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: GoogleFonts.lato().toString(),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Booking 289827891',
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: GoogleFonts.lato().toString(),
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(height: 10),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                side:
                                    BorderSide(width: 1, color: darkGreenColor),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'Complete',
                              style: TextStyle(color: darkGreenColor),
                            ),
                          ),
                          Text('Location')
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
