import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rive_animation/screens/sign_up_screen/student_regestratin_con.dart';

import '../../chat_groups/helper/helper_function.dart';
import '../../chat_groups/home_page.dart';
import '../../services/auth_service.dart';
import '../../services/auth_service_firebase.dart';
import '../../utils/utils.dart';
import '../../widget/frequently_used_functions.dart';
import '../Home/Button_Navigator.dart';
import '../onboding/onboding_screen.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isLoading = false;
  bool _isPasswordVisible = false ;
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String fullName = "";
  String confimPass = "";
  AuthServiceFierbase authServiceFierbase = AuthServiceFierbase();
  final AuthService authService= AuthService();
  // Updated textInputDecoration with blue border color
  final InputDecoration textInputDecoration = InputDecoration(
    labelText: "Full Name",
    prefixIcon: Icon(
      Icons.person,
      color: Colors.blue, // Set the border color to blue
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue), // Set the border color to blue
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(
          child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor))
          : SingleChildScrollView(
        child: Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
          child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "SignUp",
                    style: TextStyle(
                        fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                      "Create your account now to chat and explore",
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w400)),
                  Image.asset("assets/avaters/OIP (13).png" ,),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(
                        labelText: "Full Name",
                        prefixIcon: Icon(
                          Icons.person,
                          color: Theme.of(context).primaryColor,
                        )),
                    onChanged: (val) {
                      setState(() {
                        fullName = val;
                      });
                    },
                    validator: (val) {
                      if (val!.isNotEmpty) {
                        return null;
                      } else {
                        return "Name cannot be empty";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(
                        labelText: "Email",
                        prefixIcon: Icon(
                          Icons.email,
                          color: Theme.of(context).primaryColor,
                        )),
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    },

                    // check tha validation
                    validator: (val) {
                      return RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(val!)
                          ? null
                          : "Please enter a valid email";
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    obscureText: true,
                    decoration: textInputDecoration.copyWith(
                      labelText: "Password",
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    validator: (val) {
                      if (val!.length < 6) {
                        return "Password must be at least 6 characters";
                      } else {
                        return null;
                      }
                    },
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                  ),



                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: !_isPasswordVisible, // Toggle visibility based on _isPasswordVisible

                    decoration: textInputDecoration.copyWith(
                      labelText: "Confirm Password",
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Theme.of(context).primaryColor,
                      ),
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
                    validator: (val) {
                      if (val != password) {
                        return "Enter the correct password, please";
                      } else {
                        return null;
                      }
                    },
                    onChanged: (val) {
                      setState(() {
                        confimPass = val;
                      });
                    },
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                         // color: Color(0xff7847FC),
                         primary: Theme.of(context).primaryColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      child: const Text(
                        "Register",
                        style:
                        TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      onPressed: () {
                        register();
                        signupUser();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text.rich(TextSpan(
                    text: "Already have an account? ",
                    style: const TextStyle(
                        color: Colors.black, fontSize: 14),
                    children: <TextSpan>[
                      TextSpan(
                          text: "Login now",
                          style: const TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              nextScreen(context, const OnboardingScreen());
                            }),
                    ],
                  )),
                ],
              )),
        ),
      ),
    );
  }

  // register() async {
  //   if (formKey.currentState!.validate()) {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //     await authServiceFierbase
  //         .registerUserWithEmailandPassword(fullName, email, password)
  //         .then((value) async {
  //       if (value == true) {
  //         // saving the shared preference state
  //         await HelperFunctions.saveUserLoggedInStatus(true);
  //         await HelperFunctions.saveUserEmailSF(email);
  //         await HelperFunctions.saveUserNameSF(fullName);
  //         nextScreenReplace(context, const RootApp1());
  //       } else {
  //         showSnackbar(context, Colors.red, value);
  //         setState(() {
  //           _isLoading = false;
  //         });
  //       }
  //     });
  //   }
  // }
  register() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authServiceFierbase
          .registerUserWithEmailandPassword(fullName, email, password)
          .then((value) async {
        if (value == true) {
          // saving the shared preference state
          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserEmailSF(email);
          await HelperFunctions.saveUserNameSF(fullName);
          nextScreenReplace(context, const RootApp1());//HomePageChat
          nextScreenReplace(context, StudentRegistrationContinuationPage( email: email,)); // OnboardingScreen

        } else {
          showSnackbar(context, Colors.red, value);
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }
  void signupUser() {
    if (password == confimPass) {
      authService.signUpUser(
        context: context,
        email: email,
        password: password,
      );
    } else {
      showSnackBar(context, "Passwords do not match");
    }
  }
}