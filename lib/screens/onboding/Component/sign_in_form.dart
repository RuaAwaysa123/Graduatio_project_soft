// import 'dart:ui';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:rive/rive.dart';
//
// import '../../../chat_groups/helper/helper_function.dart';
// import '../../../services/auth_service.dart';
// import '../../../services/auth_service_firebase.dart';
// import '../../../services/database_service.dart';
// import '../../../widget/chat_wedgets/widgets.dart';
// import '../../profile/profile_page.dart';
//
// class SignInForm extends StatefulWidget {
//   final AuthService authService;
//   // final formKey = GlobalKey<FormState>();
//   // bool _isLoading = false;
//   // AuthServiceFierbase authServiceFierbase = AuthServiceFierbase();
//   // String email = ''; // Add a variable to store the email
//   // String password = ''; // Add a variable to store the password
//
//   SignInForm({
//     Key? key,
//     required this.authService,
//   }) : super(key: key);
//   @override
//   _SignInFormState createState() => _SignInFormState();
// }
//
// class _SignInFormState extends State<SignInForm> {
//
//   final formKey = GlobalKey<FormState>();
//   bool _isLoading = false;
//   AuthServiceFierbase authServiceFierbase = AuthServiceFierbase();
//   String email = '';
//   String password = '';
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Form(
//         key: formKey,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//           Center(
//             child: Image.asset(
//               'assets/Backgrounds/R-removebg-preview.png',
//               width: 500.0,
//               height: 140.0,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 8, bottom: 15),
//             child: TextFormField(
//               onChanged: (value) {
//                 // Update the email variable when the text changes
//                 email = value;
//               },
//               decoration: InputDecoration(
//                 prefixIcon: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8),
//                   child: SvgPicture.asset("assets/icons/email11.svg"),
//                 ),
//                 hintText: 'Enter your email',
//               ),
//             ),
//
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 15, bottom: 10),
//             child: TextFormField(
//               onChanged: (value) {
//                 // Update the password variable when the text changes
//                 password = value;
//               },
//               obscureText: true,
//               decoration: InputDecoration(
//                 prefixIcon: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8),
//                   child: Icon(
//                     Icons.password_outlined,
//                     color:  Colors.blue //Color(0xED6E95F6),
//                   ),
//                 ),
//                 hintText: 'Enter your password',
//               ),
//
//             ),
//
//           ),
//           Padding(
//               padding: const EdgeInsets.only(top: 15, bottom: 10),
//             child: ElevatedButton.icon(
//               onPressed: () {
//                 authService.loginUser(
//                   context: context,
//                   email: email, // Pass the email variable
//                   password: password, // Pass the password variable
//                 );
//                 login();
//               },
//               style: ElevatedButton.styleFrom(
//                 // backgroundColor: const Color(0xED6E95F6),
//                 backgroundColor:  Colors.blue,
//                 minimumSize: const Size(double.infinity, 56),
//                 shape: const RoundedRectangleBorder(
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(10),
//                     topRight: Radius.circular(25),
//                     bottomLeft: Radius.circular(25),
//                     bottomRight: Radius.circular(10),
//                   ),
//                 ),
//               ),
//               icon: Icon(CupertinoIcons.arrow_right),
//               label: Text("Signin"),
//             ),
//           ),
//         ],
//       ),
//     ),
//           );
//   }
//   login() async {
//
//     if (formKey.currentState!.validate()) {
//       setState(() {
//         _isLoading = true;
//       });
//       await authServiceFierbase
//           .loginWithUserNameandPassword(email, password)
//           .then((value) async {
//         if (value == true) {
//           QuerySnapshot snapshot =
//           await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
//               .gettingUserData(email);
//           // saving the values to our shared preferences
//           await HelperFunctions.saveUserLoggedInStatus(true);
//           await HelperFunctions.saveUserEmailSF(email);
//           await HelperFunctions.saveUserNameSF(snapshot.docs[0]['fullName']);
//           //nextScreenReplace(context, const HomePageChat());
//         } else {
//           showSnackbar(context, Colors.red, value);
//           setState(() {
//             _isLoading = false;
//           });
//         }
//       });
//     }
//   }
//
//
// }
//
//
//
