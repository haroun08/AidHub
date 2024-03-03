import 'package:flutter/material.dart';

import 'Homepage.dart';
import 'main.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    // Simulate some loading time with Future.delayed
    Future.delayed(const Duration(seconds: 2), () {
      // Navigate to the main screen after 2 seconds
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MyHomePage(title: 'AidHub')),
      );


    });

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFF5F5D), // Start color
              Color(0xFF72F2EB), // End color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('images/aidhub.png'), // Load the image from the images folder
              const SizedBox(height: 20),
              Text(
                'AIDHUB FIND YOUR WAY',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
