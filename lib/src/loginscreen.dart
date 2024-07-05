import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/homescreen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  
  @override
  State<StatefulWidget> createState() {
  
    return _LoginScreenState();
  }


}

class _LoginScreenState extends State<LoginScreen> {
  

    final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final String _correctPhone = "+91 1234567890";
  final String _correctPassword = "TrashDragon123";

  void _validateAndLogin() {
    // ignore: prefer_interpolation_to_compose_strings
    String phone = "+91 " + _phoneController.text.trim();
    String password = _passwordController.text.trim();
    print("wtf fool");
    if (phone == _correctPhone && password == _correctPassword) {
      // Navigate to the next screen if credentials are correct
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      // Show an error message if credentials are incorrect
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid phone number or password')),
      );
    }
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
          
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: const BoxDecoration(
                color: Colors.white,
              image: DecorationImage(
                image: AssetImage('assets/images/yes_logo_2.png'), // Replace with your image asset
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Scrollable bottom panel
          DraggableScrollableSheet(
          
            initialChildSize: 0.6,
            minChildSize: 0.4,
            maxChildSize: 0.6,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                 margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        'Hey! Welcome 👋',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Login to Nirvana! We are here to help you relax like never before',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 32),
                       TextField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          prefixText: '+91 ',
                          prefixIcon: Icon(Icons.phone),
                          labelText: 'Phone number',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                       TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // Add forgot password functionality
                          },
                          child: const Text('Forgot password?'),
                        ),
                      ),
                      const SizedBox(height: 16),
                       ElevatedButton(
                          onPressed: () {
                            // Add login functionality
                            _validateAndLogin();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black, // Set button background color to black
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero, // Make the button box-shaped
                            ),
                            minimumSize: const Size(double.infinity, 50), // Set button width to fill the container
                          ),
                          child: const Text('Login'),
                        ),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: () {
                          // Add register functionality
                        },
                        child: const Text('Don\'t have an account? Register'),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  
}
