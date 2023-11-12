// import 'package:flutter/material.dart';
// import 'package:rive_animation/screens/sign_up_screen/registration_success_screen.dart';
// import 'package:rive_animation/screens/sign_up_screen/student_regestratin_con.dart';
//
// import '../../services/auth_service.dart';
//
// class SignupScreen extends StatefulWidget {
//   @override
//   _SignupScreenState createState() => _SignupScreenState();
// }
//
// class _SignupScreenState extends State<SignupScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController = TextEditingController();
//   final AuthService authService = AuthService();
//   String _selectedUserType = 'Student';
//
//   void signupUser() {
//     authService.signUpUser(
//       context: context,
//       email: _emailController.text,
//       password: _passwordController.text,
//      //name: "Ali",
//       // name: nameController.text,
//     );
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: null, // Remove the app bar
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Welcome back',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.blue
//               ),
//             ),
//             Image.asset('assets/Backgrounds/img_3.png', height: 150, width: 300),
//             SizedBox(height: 16.0),
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(
//                 labelText: 'Email',
//                 hintText: 'Enter your email',
//                 prefixIcon: Icon(Icons.email),
//
//               ),
//             ),
//             SizedBox(height: 16.0),
//             TextField(
//               controller: _passwordController,
//               decoration: InputDecoration(
//                 labelText: 'Password',
//                 hintText: 'Enter your password',
//                 prefixIcon: Icon(Icons.lock),
//               ),
//               obscureText: true,
//             ),
//             SizedBox(height: 16.0),
//             TextField(
//               controller: _confirmPasswordController,
//               decoration: InputDecoration(
//                 labelText: 'Confirm Password',
//                 hintText: 'Confirm your password',
//                 prefixIcon: Icon(Icons.lock),
//               ),
//               obscureText: true,
//             ),
//             SizedBox(height: 16.0),
//             DropdownButtonFormField(
//               value: _selectedUserType,
//               onChanged: (String? userType) {
//                 setState(() {
//                   _selectedUserType = userType!;
//                 });
//               },
//               items: ['Student', 'Courses Center', 'Society'].map((userType) {
//                 return DropdownMenuItem(
//                   value: userType,
//                   child: Text(userType),
//                 );
//               }).toList(),
//             ),
//             SizedBox(height: 24.0),
//             ElevatedButton(
//               onPressed: () {
//                 // Add your registration logic here
//                 // String email = _emailController.text;
//                 // String password = _passwordController.text;
//                 // String confirmPassword = _confirmPasswordController.text;
//                 // signupUser();
//
//                 // Validate the password and confirmation
//         // Validate the password and confirmation
//
//       // Registration logic goes here
//       // You can check the user type using _selectedUserType
//
//       if (_selectedUserType == 'Student') {
//         // If the user type is Student, navigate to the continuation page
//         signupUser();
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => StudentRegistrationContinuationPage(),
//           ),
//         );
//       }
//     },
//               style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all(const Color(0xED6E95F6),), // Change the button color
//                 minimumSize: MaterialStateProperty.all(
//                   Size(double.infinity, 50), // Set button size
//                 ),
//               ),
//               child: Text(
//                 'Register',
//                 style: TextStyle(
//                   color: Colors.white, // Change the button text color
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:rive_animation/screens/sign_up_screen/registration_success_screen.dart';
import 'package:rive_animation/screens/sign_up_screen/student_regestratin_con.dart';
import '../../services/auth_service.dart';
import '../../utils/utils.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();
  final AuthService authService = AuthService();
  String _selectedUserType = 'Student';

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  void signupUser() {
    if (_passwordController.text == _confirmPasswordController.text) {
      authService.signUpUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text,
        // name: "Ali",
        // name: nameController.text,
      );
    } else {
      // Passwords do not match, show an error or handle it accordingly
      showSnackBar(context, "Passwords do not match");
    }
  }

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
              'Welcome back',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            Image.asset('assets/Backgrounds/img_3.png',
                height: 150, width: 300),
            SizedBox(height: 16.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                  child: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
              ),
              obscureText: !_isPasswordVisible,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                hintText: 'Confirm your password',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      _isConfirmPasswordVisible =
                      !_isConfirmPasswordVisible;
                    });
                  },
                  child: Icon(
                    _isConfirmPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
              ),
              obscureText: !_isConfirmPasswordVisible,
            ),
            SizedBox(height: 24.0),
            DropdownButtonFormField(
              value: _selectedUserType,
              onChanged: (String? userType) {
                setState(() {
                  _selectedUserType = userType!;
                });
              },
              items: ['Student', 'Courses Center', 'Society']
                  .map((userType) {
                return DropdownMenuItem(
                  value: userType,
                  child: Text(userType),
                );
              }).toList(),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {


                if (_selectedUserType == 'Student') {
                  signupUser();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          StudentRegistrationContinuationPage(),
                    ),
                  );
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    const Color(0xED6E95F6)), // Change the button color
                minimumSize: MaterialStateProperty.all(
                  Size(double.infinity,
                      50), // Set button size
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
