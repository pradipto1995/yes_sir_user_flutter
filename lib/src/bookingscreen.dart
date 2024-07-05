import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/invoicescreen.dart';
class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _BookingScreenState();
  }

 
}

class _BookingScreenState extends State<BookingScreen> {
  int _selectedIndex = 0;
  final TextEditingController _couponController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const Text("We’re almost there"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSlotSelection(),
            const SizedBox(height: 16.0),
            _buildTherapistSpecialization(),
            const SizedBox(height: 16.0),
            _buildDateTimeSelection(),
            const SizedBox(height: 16.0),
            _buildAddressConfirmation(),
            const SizedBox(height: 16.0),
            _buildCouponSection(),
            const SizedBox(height: 16.0),
            _buildPaymentOptions(),
            const SizedBox(height: 16.0),
            _buildChargesSummary(),
            const SizedBox(height: 16.0),
            _buildConfirmBookingButton(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildSlotSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Choose your slot",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Icon(Icons.calendar_today),
          ],
        ),
        const SizedBox(height: 8.0),
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: const Text(
            "Today | 8th June",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 8.0),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: List.generate(
            12,
            (index) => _buildSlotButton("08:00"),
          ),
        ),
      ],
    );
  }

  Widget _buildSlotButton(String time) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black, backgroundColor: Colors.white,
        side: const BorderSide(color: Colors.grey),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      child: Text(time),
    );
  }

  Widget _buildTherapistSpecialization() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Your therapist also specializes in",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildSpecializationCard('assets/images/tech_1.png', 'Hair Removal', 'Rs. 350.00'),
              _buildSpecializationCard('assets/images/tech_2.png', 'High Pressure Massage', 'Rs. 100'),
              _buildSpecializationCard('assets/images/tech_3.png', 'Stretching', 'Rs. 199'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSpecializationCard(String image, String title, String price) {
    return Card(
      child: Column(
        children: [
          CircleAvatar(backgroundImage: AssetImage(image)),
          Text(title),
          Text(price),
        ],
      ),
    );
  }

  Widget _buildDateTimeSelection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Date & time selected",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        Text("Sat, 08 Jun - 08:00 AM"),
      ],
    );
  }

  Widget _buildAddressConfirmation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Confirm Delivery Address",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        const Text("9/1 Kasba Road, Kolkata 700042"),
        TextButton(
          onPressed: () {},
          child: const Text("Change Location", style: TextStyle(color: Colors.yellow)),
        ),
      ],
    );
  }

  Widget _buildCouponSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Apply Coupon",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _couponController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "DISC20PERCEN",
                ),
              ),
            ),
            const SizedBox(width: 8.0),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
              ),
              child: const Text("Apply"),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        const Text("Coupon is active", style: TextStyle(color: Colors.green)),
      ],
    );
  }

  Widget _buildPaymentOptions() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Pay Now or Pay after service",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        Row(
          children: [
            Icon(Icons.circle, color: Colors.black),
            SizedBox(width: 8.0),
            Text("Pay Now"),
            SizedBox(width: 16.0),
            Icon(Icons.circle_outlined, color: Colors.yellow),
            SizedBox(width: 8.0),
            Text("Pay after service"),
          ],
        ),
      ],
    );
  }

  Widget _buildChargesSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Charges summary",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        _buildChargesRow("Massage Therapy", "x1", "Rs. 850"),
        _buildChargesRow("Hair Removal", "x1", "Rs. 350"),
        _buildChargesRow("GST Charges", "", "Rs. 216"),
        _buildChargesRow("Coupon Discount", "", "-Rs. 240"),
        const Divider(),
        _buildChargesRow("Total Payable Amount:", "", "Rs. 1216"),
      ],
    );
  }

  Widget _buildChargesRow(String title, String qty, String amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Row(
            children: [
              if (qty.isNotEmpty) Text(qty),
              const SizedBox(width: 8.0),
              Text(amount, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildConfirmBookingButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
            Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const InvoiceScreen()),
      );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.yellow,
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
          textStyle: const TextStyle(fontSize: 18.0),
        ),
        child: const Text("Confirm Booking"),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Booking"),
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }
}