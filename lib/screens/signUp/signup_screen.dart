import 'package:flutter/material.dart';
import 'package:rive_animation/screens/signup/registration_success_screen.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  String _selectedUserType = 'Student';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null, // Remove the app bar
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Signup',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset('assets/Backgrounds/img.png', height: 150, width: 300),
            SizedBox(height: 16.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                prefixIcon: Icon(Icons.email,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                prefixIcon: Icon(Icons.lock,
                    color: Colors.deepPurple),
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                hintText: 'Confirm your password',
                prefixIcon: Icon(Icons.lock,
                    color: Colors.deepPurple ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField(
              value: _selectedUserType,
              onChanged: (String? userType) {
                setState(() {
                  _selectedUserType = userType!;
                });
              },
              items: ['Student', 'Courses Center', 'Society'].map((userType) {
                return DropdownMenuItem(
                  value: userType,
                  child: Text(userType),
                );
              }).toList(),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                // Add your registration logic here
                String email = _emailController.text;
                String password = _passwordController.text;
                String confirmPassword = _confirmPasswordController.text;

                // Validate the password and confirmation
                if (password == confirmPassword) {
                  // Registration logic goes here
                  // You can check the user type using _selectedUserType

                  // Example: Navigating to a success screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegistrationSuccessScreen(
                        userType: _selectedUserType,
                      ),
                    ),
                  );
                } else {
                  // Show an error message or handle the mismatched passwords
                  // You may want to add more validation and error handling.
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent), // Change the button color
                minimumSize: MaterialStateProperty.all(
                  Size(double.infinity, 50), // Set button size
                ),
              ),
              child: Text(
                'Register',
                style: TextStyle(
                  color: Colors.white, // Change the button text color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
