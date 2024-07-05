import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/loginscreen.dart';


class TestScreen extends StatefulWidget
{
  const TestScreen({super.key});

  @override
  State<StatefulWidget> createState() {

    return _TestScreen();
  }
  
}

class _TestScreen extends State<TestScreen>
{

    @override
  void initState() {
    super.initState();
    // Navigate to another screen after 4 seconds
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/splash.png'), // Replace with your image asset
              fit: BoxFit.cover, // This defines how the image is sized inside the container
            ),
          ),
          // child: const Center(
          //   child: Text(
          //     'Hello, World!',
          //     style: TextStyle(
          //       fontSize: 24,
          //       fontWeight: FontWeight.bold,
          //       color: Colors.black, // Example text color
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }
  
}