import 'package:flutter/material.dart';
import 'package:rive_animation/screens/sign_up_screen/registration_success_screen.dart';
import 'package:rive_animation/screens/sign_up_screen/student_regestratin_con.dart';
import '../../facebook/Cources_profile.dart';
import '../../facebook/profile.dart';
import '../../services/auth_service.dart';
import '../../services/auth_service_firebase.dart';
import '../../utils/utils.dart';
import '../profile/profile_page.dart';
// import 'package:flutter/gestures.dart';
//

final AuthServiceFierbase chatAuthService = AuthServiceFierbase();

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _isLoading = false;
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();
  final AuthService authService = AuthService();
  String _selectedUserType = 'Student';
  // final formKey = GlobalKey<FormState>();  final formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = true;
  bool _isConfirmPasswordVisible = false;

  // Function to perform basic email validation
  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    // You can add more sophisticated email validation if needed
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  void signupUser() {
    if (_passwordController.text == _confirmPasswordController.text) {
      authService.signUpUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text,
      );
    } else {
      showSnackBar(context, "Passwords do not match");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: null,
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
            Image.asset('assets/Backgrounds/img_3.png', height: 150, width: 300),
            SizedBox(height: 16.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                prefixIcon: Icon(Icons.email),
                errorText: emailValidator(_emailController.text),
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
                if (_selectedUserType == 'Student' &&
                    emailValidator(_emailController.text) == null) {
                  signupUser();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          StudentRegistrationContinuationPage(
                            email: _emailController.text,
                          ),
                    ),
                  );
                } else {
                  showSnackBar(context, "Please enter a valid email");
                }
              },
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all( Colors.blue),
                minimumSize: MaterialStateProperty.all(
                  Size(double.infinity, 50),
                ),
              ),
              child: Text(
                'Register',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// chatAuthService
// register() async {
//   //var formKey;
//   if (formKey.currentState!.validate()) {
//
//   }
//
// }

// if (formKey.currentState!.validate()) {
// setState(() {
// _isLoading = true;
// });
// await authService
//     .registerUserWithEmailandPassword(fullName, email, password)
//     .then((value) async {
// if (value == true) {
// // saving the shared preference state
// await HelperFunctions.saveUserLoggedInStatus(true);
// await HelperFunctions.saveUserEmailSF(email);
// await HelperFunctions.saveUserNameSF(fullName);
// nextScreenReplace(context, const HomePage());
// } else {
// showSnackbar(context, Colors.red, value);
// setState(() {
// _isLoading = false;
// });
// }
// });
// }
// }