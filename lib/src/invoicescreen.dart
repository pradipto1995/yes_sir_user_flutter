import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String date = DateFormat('EEE, d MMM').format(DateTime.now());
    final String time = DateFormat('hh:mm a').format(DateTime.now());

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 216, 188, 25),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back),
                  Text(
                    'Confirmation & Invoice',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 24), // Empty box to balance the Row
                ],
              ),
            ),
             Center(
              child: Column(
                children: [
                  // Icon(
                  //   Icons.check_circle,
                  //   size: 100,
                  //   color: Colors.black,
                  // ),
                  // Text(
                  //   'Booking Successful',
                  //   style: TextStyle(
                  //     fontSize: 24,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  // Text(
                  //   'Now sit back & relax\nFor more info: Check My Bookings',
                  //   textAlign: TextAlign.center,
                  //   style: TextStyle(fontSize: 16),
                  // ),
                  Container(
          
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: const BoxDecoration(
               // color: Colors.white,
              image: DecorationImage(
                image: AssetImage('assets/images/booking_final.png'), // Replace with your image asset
                fit: BoxFit.cover,
              ),
            ),
          ), 
                ],
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(left: 5.0, right: 5.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Massage Therapy +1',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              date,
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              time,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Therapist: Akash Sen',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Payment summary',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Payable Amount:',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Rs. 980',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                          ),
                          child: const Text('Home'),
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.black, shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            side: const BorderSide(color: Colors.black),
                          ),
                          child: const Row(
                            children: [
                              Text('Download'),
                              SizedBox(width: 8),
                              Icon(Icons.cloud_download),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}