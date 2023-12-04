import 'package:flutter/material.dart';

import '../onboding/onboding_screen.dart';

class RegistrationSuccessScreen extends StatelessWidget {
  final String userType;

  RegistrationSuccessScreen({required this.userType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Signup',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 100,
            ),
            SizedBox(height: 20),
            Text(
              'Registration Successful!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'You are now registered as a $userType.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OnboardingScreen(),
                  ),
                );

                // Navigate to your main screen or home screen.
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
