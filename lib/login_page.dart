// //
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/gestures.dart';
// // import 'package:flutter/material.dart';
// // import 'package:rive_animation/screens/Home/Button_Navigator.dart';
// // import 'package:rive_animation/screens/sign_up_screen/regestration_with_fierbase.dart';
// // import 'package:rive_animation/services/auth_service.dart';
// // import 'package:rive_animation/services/auth_service_firebase.dart';
// // import 'package:rive_animation/services/database_service.dart';
// // import 'package:rive_animation/widget/chat_wedgets/widgets.dart';
// //
// // import 'chat_groups/helper/helper_function.dart';
// // import 'chat_groups/home_page.dart';
// //
// // class LoginPage extends StatefulWidget {
// //   const LoginPage({Key? key}) : super(key: key);
// //
// //   @override
// //   State<LoginPage> createState() => _LoginPageState();
// // }
// //
// // class _LoginPageState extends State<LoginPage> {
// //   final formKey = GlobalKey<FormState>();
// //   String email = "";
// //   String password = "";
// //   bool _isLoading = false;
// //   AuthServiceFierbase authServicefierbase = AuthServiceFierbase();
// //   final AuthService authService= AuthService();
// //
// //   final InputDecoration textInputDecoration = InputDecoration(
// //     labelText: "Full Name",
// //     prefixIcon: Icon(
// //       Icons.person,
// //       color: Colors.blue, // Set the border color to blue
// //     ),
// //     border: OutlineInputBorder(
// //       borderSide: BorderSide(color: Colors.blue), // Set the border color to blue
// //       borderRadius: BorderRadius.all(Radius.circular(30.0)),
// //     ),
// //   );
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: _isLoading
// //           ? Center(
// //               child: CircularProgressIndicator(
// //                   color: Theme.of(context).primaryColor),
// //             )
// //           : SingleChildScrollView(
// //               child: Padding(
// //                 padding:
// //                     const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
// //                 child: Form(
// //                     key: formKey,
// //                     child: Column(
// //                       mainAxisAlignment: MainAxisAlignment.center,
// //                       crossAxisAlignment: CrossAxisAlignment.center,
// //                       children: <Widget>[
// //                         const Text(
// //                           "Skill Swap",
// //                           style: TextStyle(
// //                               fontSize: 40, fontWeight: FontWeight.bold),
// //                         ),
// //                         const SizedBox(height: 10),
// //                         const Text("Login now to see what they are talking!",
// //                             style: TextStyle(
// //                                 fontSize: 15, fontWeight: FontWeight.w400)),
// //                         Image.asset("assets/Backgrounds/login.png"),
// //                         TextFormField(
// //                           decoration: textInputDecoration.copyWith(
// //                               labelText: "Email",
// //                               prefixIcon: Icon(
// //                                 Icons.email,
// //                                 color: Theme.of(context).primaryColor,
// //                               )),
// //                           onChanged: (val) {
// //                             setState(() {
// //                               email = val;
// //                             });
// //                           },
// //
// //                           // check tha validation
// //                           validator: (val) {
// //                             return RegExp(
// //                                         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
// //                                     .hasMatch(val!)
// //                                 ? null
// //                                 : "Please enter a valid email";
// //                           },
// //                         ),
// //                         const SizedBox(height: 15),
// //                         TextFormField(
// //                           obscureText: true,
// //                           decoration: textInputDecoration.copyWith(
// //                               labelText: "Password",
// //                               prefixIcon: Icon(
// //                                 Icons.lock,
// //                                 color: Theme.of(context).primaryColor,
// //                               )),
// //                           validator: (val) {
// //                             if (val!.length < 6) {
// //                               return "Password must be at least 6 characters";
// //                             } else {
// //                               return null;
// //                             }
// //                           },
// //                           onChanged: (val) {
// //                             setState(() {
// //                               password = val;
// //                             });
// //                           },
// //                         ),
// //                         const SizedBox(
// //                           height: 20,
// //                         ),
// //                         SizedBox(
// //                           width: double.infinity,
// //                           child: ElevatedButton(
// //                             style: ElevatedButton.styleFrom(
// //                                 primary: Theme.of(context).primaryColor,
// //                                 elevation: 0,
// //                                 shape: RoundedRectangleBorder(
// //                                     borderRadius: BorderRadius.circular(30))),
// //                             child: const Text(
// //                               "Sign In",
// //                               style:
// //                                   TextStyle(color: Colors.white, fontSize: 16),
// //                             ),
// //                             onPressed: () {
// //                               login();
// //                               authService.loginUser(
// //                   context: context,
// //                   email: email, // Pass the email variable
// //                   password: password, // Pass the password variable
// //                 );
// //                             },
// //                           ),
// //                         ),
// //                         const SizedBox(
// //                           height: 10,
// //                         ),
// //                         Text.rich(TextSpan(
// //                           text: "Don't have an account? ",
// //                           style: const TextStyle(
// //                               color: Colors.black, fontSize: 14),
// //                           children: <TextSpan>[
// //                             TextSpan(
// //                                 text: "Register here",
// //                                 style: const TextStyle(
// //                                     color: Colors.black,
// //                                     decoration: TextDecoration.underline),
// //                                 recognizer: TapGestureRecognizer()
// //                                   ..onTap = () {
// //                                     nextScreen(context, const RegisterPage());
// //                                   }),
// //                           ],
// //                         )),
// //                       ],
// //                     )),
// //               ),
// //             ),
// //     );
// //   }
// //
// //   login() async {
// //     if (formKey.currentState!.validate()) {
// //       setState(() {
// //         _isLoading = true;
// //       });
// //       await authServicefierbase
// //           .loginWithUserNameandPassword(email, password)
// //           .then((value) async {
// //         if (value == true) {
// //           QuerySnapshot snapshot =
// //               await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
// //                   .gettingUserData(email);
// //           // saving the values to our shared preferences
// //           await HelperFunctions.saveUserLoggedInStatus(true);
// //           await HelperFunctions.saveUserEmailSF(email);
// //           await HelperFunctions.saveUserNameSF(snapshot.docs[0]['fullName']);
// //           nextScreenReplace(context, const RootApp1());
// //         } else {
// //           showSnackbar(context, Colors.red, value);
// //           setState(() {
// //             _isLoading = false;
// //           });
// //         }
// //       });
// //     }
// //   }
// // }
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:rive_animation/screens/Home/Button_Navigator.dart';
// import 'package:rive_animation/screens/sign_up_screen/regestration_with_fierbase.dart';
// import 'package:rive_animation/screens/society/root_app_society.dart';
// import 'package:rive_animation/services/auth_service.dart';
// import 'package:rive_animation/services/auth_service_firebase.dart';
// import 'package:rive_animation/services/database_service.dart';
// import 'package:rive_animation/services/society_auth_service.dart';
// import 'package:rive_animation/widget/chat_wedgets/widgets.dart';
//
// import 'chat_groups/helper/helper_function.dart';
// import 'chat_groups/home_page.dart';
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);
//
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final formKey = GlobalKey<FormState>();
//   String email = "";
//   String password = "";
//   bool _isLoading = false;
//   bool isSelected = false;
//   String selectedUserType = "Student";
//   AuthServiceFierbase authServicefierbase = AuthServiceFierbase();
//   final AuthService authService = AuthService();
//
//   final InputDecoration textInputDecoration = InputDecoration(
//     labelText: "Full Name",
//     prefixIcon: Icon(
//       Icons.person,
//       color: Colors.blue, // Set the border color to blue
//     ),
//     border: OutlineInputBorder(
//       borderSide: BorderSide(color: Colors.blue),
//       borderRadius: BorderRadius.all(Radius.circular(30.0)),
//     ),
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _isLoading
//           ? Center(
//         child: CircularProgressIndicator(
//             color: Theme.of(context).primaryColor),
//       )
//           : SingleChildScrollView(
//         child: Padding(
//           padding:
//           const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
//           child: Form(
//             key: formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 const Text(
//                   "Skill Swap",
//                   style: TextStyle(
//                       fontSize: 40, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 10),
//                 const Text("!",
//                     style: TextStyle(
//                         fontSize: 15, fontWeight: FontWeight.w400)),
//                 Image.asset("assets/Backgrounds/login.png"),
//                 const SizedBox(height: 20),
//                 // Row with user type squares
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     userTypeSquare("Student"),
//                     userTypeSquare("Society"),
//                     userTypeSquare("Course Center"),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 TextFormField(
//                   decoration: textInputDecoration.copyWith(
//                       labelText: "Email",
//                       prefixIcon: Icon(
//                         Icons.email,
//                         color: Theme.of(context).primaryColor,
//                       )),
//                   onChanged: (val) {
//                     setState(() {
//                       email = val;
//                     });
//                   },
//                   validator: (val) {
//                     return RegExp(
//                         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//                         .hasMatch(val!)
//                         ? null
//                         : "Please enter a valid email";
//                   },
//                 ),
//                 const SizedBox(height: 15),
//                 TextFormField(
//                   obscureText: true,
//                   decoration: textInputDecoration.copyWith(
//                       labelText: "Password",
//                       prefixIcon: Icon(
//                         Icons.lock,
//                         color: Theme.of(context).primaryColor,
//                       )),
//                   validator: (val) {
//                     if (val!.length < 6) {
//                       return "Password must be at least 6 characters";
//                     } else {
//                       return null;
//                     }
//                   },
//                   onChanged: (val) {
//                     setState(() {
//                       password = val;
//                     });
//                   },
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         primary: Theme.of(context).primaryColor,
//                         elevation: 0,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30))),
//                     child: const Text(
//                       "Sign In",
//                       style:
//                       TextStyle(color: Colors.white, fontSize: 16),
//                     ),
//                     onPressed: () async {
//                       if(selectedUserType == "Student"){
//                         login();
//                         authService.loginUser(
//                           context: context,
//                           email: email,
//                           password: password,
//                         );
//                       }
//                       else if(selectedUserType == "Society"){
//                         await SocietyAuthService().loginSociety(
//                           email: email,
//                           password: password,
//                         ).then((result) async {
//                           if (result['success']) {
//                             // Society logged in successfully, implement your logic here
//                             // You can also navigate to the next screen or perform other actions
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 // builder: (context) => ProfilePage(),
//                                 builder: (context) => RootAppSociety(),
//                               ),
//                             );
//                             print(result['message']);
//                           } else {
//                             // Handle error in society login
//                             print(result['message']);
//                           }
//                         });
//                       }
//
//
//                     },
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Text.rich(TextSpan(
//                   text: "Don't have an account? ",
//                   style: const TextStyle(
//                       color: Colors.black, fontSize: 14),
//                   children: <TextSpan>[
//                     TextSpan(
//                         text: "Register here",
//                         style: const TextStyle(
//                             color: Colors.black,
//                             decoration: TextDecoration.underline),
//                         recognizer: TapGestureRecognizer()
//                           ..onTap = () {
//                             nextScreen(context, const RegisterPage());
//                           }),
//                   ],
//                 )),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget userTypeSquare(String type) {
//     return GestureDetector(
//       onTap: () {
//         // Handle the onTap event for each square
//         print("User type selected: $type");
//         setState(() {
//           selectedUserType = type; // Set the selected user type
//         });
//         // You can add logic here to handle the selected user type
//       },
//       child: Container(
//         width: 100,
//         height: 50,
//         decoration: BoxDecoration(
//           color: selectedUserType == type
//               ? Colors.blue.withOpacity(0.5)
//               : Colors.transparent,
//           borderRadius: BorderRadius.circular(15),
//           border: Border.all(color: Colors.blue),
//         ),
//         child: Center(
//           child: Text(
//             type,
//             style: TextStyle(color: Colors.blue),
//           ),
//         ),
//       ),
//     );
//   }
//   login() async {
//     if (formKey.currentState!.validate()) {
//       setState(() {
//         _isLoading = true;
//       });
//       await authServicefierbase
//           .loginWithUserNameandPassword(email, password)
//           .then((value) async {
//         if (value == true) {
//           QuerySnapshot snapshot =
//           await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
//               .gettingUserData(email);
//
//           await HelperFunctions.saveUserLoggedInStatus(true);
//           await HelperFunctions.saveUserEmailSF(email);
//           await HelperFunctions.saveUserNameSF(snapshot.docs[0]['fullName']);
//           nextScreenReplace(context, const RootApp1());
//         } else {
//           showSnackbar(context, Colors.red, value);
//           setState(() {
//             _isLoading = false;
//           });
//         }
//       });
//     }
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rive_animation/screens/Home/Button_Navigator.dart';
import 'package:rive_animation/screens/sign_up_screen/regestration_with_fierbase.dart';
import 'package:rive_animation/screens/society/root_app_society.dart';
import 'package:rive_animation/services/auth_service.dart';
import 'package:rive_animation/services/auth_service_firebase.dart';
import 'package:rive_animation/services/database_service.dart';
import 'package:rive_animation/services/society_auth_service.dart';
import 'package:rive_animation/widget/chat_wedgets/widgets.dart';

import 'chat_groups/helper/helper_function.dart';
import 'chat_groups/home_page.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);
//
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final formKey = GlobalKey<FormState>();
//   String email = "";
//   String password = "";
//   bool _isLoading = false;
//   bool isSelected = false;
//   String selectedUserType = "Student";
//   AuthServiceFierbase authServicefierbase = AuthServiceFierbase();
//   final AuthService authService = AuthService();
//
//   final InputDecoration textInputDecoration = InputDecoration(
//     labelText: "Full Name",
//     prefixIcon: Icon(
//       Icons.person,
//       color: Colors.blue, // Set the border color to blue
//     ),
//     border: OutlineInputBorder(
//       borderSide: BorderSide(color: Colors.blue),
//       borderRadius: BorderRadius.all(Radius.circular(30.0)),
//     ),
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _isLoading
//           ? Center(
//         child: CircularProgressIndicator(
//             color: Theme.of(context).primaryColor),
//       )
//           : SingleChildScrollView(
//         child: Padding(
//           padding:
//           const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
//           child: Form(
//             key: formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 const Text(
//                   "Skill Swap",
//                   style: TextStyle(
//                       fontSize: 40, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 10),
//                 const Text("!",
//                     style: TextStyle(
//                         fontSize: 15, fontWeight: FontWeight.w400)),
//                 Image.asset("assets/Backgrounds/login.png"),
//                 const SizedBox(height: 20),
//                 // Row with user type squares
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     userTypeSquare("Student"),
//                     userTypeSquare("Society"),
//                     userTypeSquare("Course Center"),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 TextFormField(
//                   decoration: textInputDecoration.copyWith(
//                       labelText: "Email",
//                       prefixIcon: Icon(
//                         Icons.email,
//                         color: Theme.of(context).primaryColor,
//                       )),
//                   onChanged: (val) {
//                     setState(() {
//                       email = val;
//                     });
//                   },
//                   validator: (val) {
//                     return RegExp(
//                         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//                         .hasMatch(val!)
//                         ? null
//                         : "Please enter a valid email";
//                   },
//                 ),
//                 const SizedBox(height: 15),
//                 TextFormField(
//                   obscureText: true,
//                   decoration: textInputDecoration.copyWith(
//                       labelText: "Password",
//                       prefixIcon: Icon(
//                         Icons.lock,
//                         color: Theme.of(context).primaryColor,
//                       )),
//                   validator: (val) {
//                     if (val!.length < 6) {
//                       return "Password must be at least 6 characters";
//                     } else {
//                       return null;
//                     }
//                   },
//                   onChanged: (val) {
//                     setState(() {
//                       password = val;
//                     });
//                   },
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         primary: Theme.of(context).primaryColor,
//                         elevation: 0,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30))),
//                     child: const Text(
//                       "Sign In",
//                       style:
//                       TextStyle(color: Colors.white, fontSize: 16),
//                     ),
//                     onPressed: () async {
//                       if(selectedUserType == "Student"){
//                         login();
//                         authService.loginUser(
//                           context: context,
//                           email: email,
//                           password: password,
//                         );
//                       }
//                       else if(selectedUserType == "Society"){
//                         await SocietyAuthService().loginSociety(
//                           email: email,
//                           password: password,
//                         ).then((result) async {
//                           if (result['success']) {
//                             // Society logged in successfully, implement your logic here
//                             // You can also navigate to the next screen or perform other actions
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 // builder: (context) => ProfilePage(),
//                                 builder: (context) => RootAppSociety(),
//                               ),
//                             );
//                             print(result['message']);
//                           } else {
//                             // Handle error in society login
//                             print(result['message']);
//                           }
//                         });
//                       }
//
//
//                     },
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Text.rich(TextSpan(
//                   text: "Don't have an account? ",
//                   style: const TextStyle(
//                       color: Colors.black, fontSize: 14),
//                   children: <TextSpan>[
//                     TextSpan(
//                         text: "Register here",
//                         style: const TextStyle(
//                             color: Colors.black,
//                             decoration: TextDecoration.underline),
//                         recognizer: TapGestureRecognizer()
//                           ..onTap = () {
//                             nextScreen(context, const RegisterPage());
//                           }),
//                   ],
//                 )),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget userTypeSquare(String type) {
//     return GestureDetector(
//       onTap: () {
//         // Handle the onTap event for each square
//         print("User type selected: $type");
//         setState(() {
//           selectedUserType = type; // Set the selected user type
//         });
//         // You can add logic here to handle the selected user type
//       },
//       child: Container(
//         width: 100,
//         height: 50,
//         decoration: BoxDecoration(
//           color: selectedUserType == type
//               ? Colors.blue.withOpacity(0.5)
//               : Colors.transparent,
//           borderRadius: BorderRadius.circular(15),
//           border: Border.all(color: Colors.blue),
//         ),
//         child: Center(
//           child: Text(
//             type,
//             style: TextStyle(color: Colors.blue),
//           ),
//         ),
//       ),
//     );
//   }
//   login() async {
//     if (formKey.currentState!.validate()) {
//       setState(() {
//         _isLoading = true;
//       });
//       await authServicefierbase
//           .loginWithUserNameandPassword(email, password)
//           .then((value) async {
//         if (value == true) {
//           QuerySnapshot snapshot =
//           await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
//               .gettingUserData(email);
//
//           await HelperFunctions.saveUserLoggedInStatus(true);
//           await HelperFunctions.saveUserEmailSF(email);
//           await HelperFunctions.saveUserNameSF(snapshot.docs[0]['fullName']);
//           nextScreenReplace(context, const RootApp1());
//         } else {
//           showSnackbar(context, Colors.red, value);
//           setState(() {
//             _isLoading = false;
//           });
//         }
//       });
//     }
//   }
// }
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:rive_animation/screens/Home/Button_Navigator.dart';
// import 'package:rive_animation/screens/sign_up_screen/regestration_with_fierbase.dart';
// import 'package:rive_animation/services/auth_service.dart';
// import 'package:rive_animation/services/auth_service_firebase.dart';
// import 'package:rive_animation/services/database_service.dart';
// import 'package:rive_animation/widget/chat_wedgets/widgets.dart';
//
// import 'chat_groups/helper/helper_function.dart';
// import 'chat_groups/home_page.dart';
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);
//
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final formKey = GlobalKey<FormState>();
//   String email = "";
//   String password = "";
//   bool _isLoading = false;
//   AuthServiceFierbase authServicefierbase = AuthServiceFierbase();
//   final AuthService authService= AuthService();
//
//   final InputDecoration textInputDecoration = InputDecoration(
//     labelText: "Full Name",
//     prefixIcon: Icon(
//       Icons.person,
//       color: Colors.blue, // Set the border color to blue
//     ),
//     border: OutlineInputBorder(
//       borderSide: BorderSide(color: Colors.blue), // Set the border color to blue
//       borderRadius: BorderRadius.all(Radius.circular(30.0)),
//     ),
//   );
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _isLoading
//           ? Center(
//               child: CircularProgressIndicator(
//                   color: Theme.of(context).primaryColor),
//             )
//           : SingleChildScrollView(
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
//                 child: Form(
//                     key: formKey,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: <Widget>[
//                         const Text(
//                           "Skill Swap",
//                           style: TextStyle(
//                               fontSize: 40, fontWeight: FontWeight.bold),
//                         ),
//                         const SizedBox(height: 10),
//                         const Text("Login now to see what they are talking!",
//                             style: TextStyle(
//                                 fontSize: 15, fontWeight: FontWeight.w400)),
//                         Image.asset("assets/Backgrounds/login.png"),
//                         TextFormField(
//                           decoration: textInputDecoration.copyWith(
//                               labelText: "Email",
//                               prefixIcon: Icon(
//                                 Icons.email,
//                                 color: Theme.of(context).primaryColor,
//                               )),
//                           onChanged: (val) {
//                             setState(() {
//                               email = val;
//                             });
//                           },
//
//                           // check tha validation
//                           validator: (val) {
//                             return RegExp(
//                                         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//                                     .hasMatch(val!)
//                                 ? null
//                                 : "Please enter a valid email";
//                           },
//                         ),
//                         const SizedBox(height: 15),
//                         TextFormField(
//                           obscureText: true,
//                           decoration: textInputDecoration.copyWith(
//                               labelText: "Password",
//                               prefixIcon: Icon(
//                                 Icons.lock,
//                                 color: Theme.of(context).primaryColor,
//                               )),
//                           validator: (val) {
//                             if (val!.length < 6) {
//                               return "Password must be at least 6 characters";
//                             } else {
//                               return null;
//                             }
//                           },
//                           onChanged: (val) {
//                             setState(() {
//                               password = val;
//                             });
//                           },
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         SizedBox(
//                           width: double.infinity,
//                           child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                                 primary: Theme.of(context).primaryColor,
//                                 elevation: 0,
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(30))),
//                             child: const Text(
//                               "Sign In",
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 16),
//                             ),
//                             onPressed: () {
//                               login();
//                               authService.loginUser(
//                   context: context,
//                   email: email, // Pass the email variable
//                   password: password, // Pass the password variable
//                 );
//                             },
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         Text.rich(TextSpan(
//                           text: "Don't have an account? ",
//                           style: const TextStyle(
//                               color: Colors.black, fontSize: 14),
//                           children: <TextSpan>[
//                             TextSpan(
//                                 text: "Register here",
//                                 style: const TextStyle(
//                                     color: Colors.black,
//                                     decoration: TextDecoration.underline),
//                                 recognizer: TapGestureRecognizer()
//                                   ..onTap = () {
//                                     nextScreen(context, const RegisterPage());
//                                   }),
//                           ],
//                         )),
//                       ],
//                     )),
//               ),
//             ),
//     );
//   }
//
//   login() async {
//     if (formKey.currentState!.validate()) {
//       setState(() {
//         _isLoading = true;
//       });
//       await authServicefierbase
//           .loginWithUserNameandPassword(email, password)
//           .then((value) async {
//         if (value == true) {
//           QuerySnapshot snapshot =
//               await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
//                   .gettingUserData(email);
//           // saving the values to our shared preferences
//           await HelperFunctions.saveUserLoggedInStatus(true);
//           await HelperFunctions.saveUserEmailSF(email);
//           await HelperFunctions.saveUserNameSF(snapshot.docs[0]['fullName']);
//           nextScreenReplace(context, const RootApp1());
//         } else {
//           showSnackbar(context, Colors.red, value);
//           setState(() {
//             _isLoading = false;
//           });
//         }
//       });
//     }
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rive_animation/screens/Home/Button_Navigator.dart';
import 'package:rive_animation/screens/sign_up_screen/regestration_with_fierbase.dart';
import 'package:rive_animation/screens/society/root_app_society.dart';
import 'package:rive_animation/services/auth_service.dart';
import 'package:rive_animation/services/auth_service_firebase.dart';
import 'package:rive_animation/services/database_service.dart';
import 'package:rive_animation/services/society_auth_service.dart';
import 'package:rive_animation/widget/chat_wedgets/widgets.dart';

import 'chat_groups/helper/helper_function.dart';
import 'chat_groups/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  bool _isLoading = false;
  bool isSelected = false;
  String selectedUserType = "Student";
  AuthServiceFierbase authServicefierbase = AuthServiceFierbase();
  final AuthService authService = AuthService();

  final InputDecoration textInputDecoration = InputDecoration(
    labelText: "Full Name",
    prefixIcon: Icon(
      Icons.person,
      color: Colors.blue, // Set the border color to blue
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(
        child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor),
      )
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
                  "Skill Swap",
                  style: TextStyle(
                      fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text("!",
                    style: TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w400)),
                Image.asset("assets/Backgrounds/login.png"),
                const SizedBox(height: 20),
                // Row with user type squares
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    userTypeSquare("Student"),
                    userTypeSquare("Society"),
                    userTypeSquare("Course Center"),
                  ],
                ),
                const SizedBox(height: 20),
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
                      )),
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
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    child: const Text(
                      "Sign In",
                      style:
                      TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    onPressed: () async {
                      if(selectedUserType == "Student"){
                        login();
                        authService.loginUser(
                          context: context,
                          email: email,
                          password: password,
                        );
                      }
                      else if(selectedUserType == "Society"){
                        await SocietyAuthService().loginSociety(
                          email: email,
                          password: password,
                        ).then((result) async {
                          if (result['success']) {
                            // Society logged in successfully, implement your logic here
                            // You can also navigate to the next screen or perform other actions

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                // builder: (context) => ProfilePage(),
                                builder: (context) => RootAppSociety(),
                              ),
                            );
                            print(result['message']);
                          } else {
                            // Handle error in society login
                            print(result['message']);
                          }
                        });
                      }


                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text.rich(TextSpan(
                  text: "Don't have an account? ",
                  style: const TextStyle(
                      color: Colors.black, fontSize: 14),
                  children: <TextSpan>[
                    TextSpan(
                        text: "Register here",
                        style: const TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            nextScreen(context, const RegisterPage());
                          }),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget userTypeSquare(String type) {
    return GestureDetector(
      onTap: () {
        // Handle the onTap event for each square
        print("User type selected: $type");
        setState(() {
          selectedUserType = type; // Set the selected user type
        });
        // You can add logic here to handle the selected user type
      },
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          color: selectedUserType == type
              ? Colors.blue.withOpacity(0.5)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.blue),
        ),
        child: Center(
          child: Text(
            type,
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ),
    );
  }
  login() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authServicefierbase
          .loginWithUserNameandPassword(email, password)
          .then((value) async {
        if (value == true) {
          QuerySnapshot snapshot =
          await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
              .gettingUserData(email);

          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserEmailSF(email);
          await HelperFunctions.saveUserNameSF(snapshot.docs[0]['fullName']);
          nextScreenReplace(context, const RootApp1());
        } else {
          showSnackbar(context, Colors.red, value);
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }
}