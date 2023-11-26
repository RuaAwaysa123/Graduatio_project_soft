// import 'dart:ui';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:rive/rive.dart';
//
// import '../../../services/auth_service.dart';
// import '../../profile/profile_page.dart';
//
// class SigIn_Form extends StatelessWidget {
//   final AuthService authService;
//
//   const SigIn_Form({
//     Key? key,
//     required this.authService,
//   }) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(child:
//     Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//
//
//         Center(
//           child: Image.asset(
//             'assets/Backgrounds/R-removebg-preview.png',
//             width: 700.0,
//             height: 140.0,
//           ),
//         ),
//
//
//
//         Padding(
//           padding: const EdgeInsets.only(top: 8 ,bottom: 8),
//           child:   TextFormField(
//             decoration: InputDecoration(
//               prefixIcon: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8),
//                 child: SvgPicture.asset("assets/icons/email11.svg"),
//
//               ),
//               hintText: 'Enter your email', // Add your explanatory text here
//             ),
//
//           ),
//         ),
//
// // the password filed
//         Padding(
//           padding: const EdgeInsets.only(top: 10 ,bottom: 8),
//           child:   TextFormField(
//             obscureText: true ,
//             decoration: InputDecoration(
//               prefixIcon: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8),
//                 child: Icon(
//                   Icons.password_outlined, // Replace with the desired icon
//                   color: const Color(0xED6E95F6), // Change the icon color as needed
//                 ),
//
//               ),
//               hintText: 'Enter your password', // Add your explanatory text here
//             ),
//
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(top: 8 , bottom: 10),
//           child:   ElevatedButton.icon(onPressed:(){
// //**********************************************************************
//             authService.loginUser(
//               context: context,
//               email:'',
//               password: '',
//             );
//             // Navigator.push(
//             //   context,
//             //   MaterialPageRoute(
//             //     builder: (context) => ProfilePage(),
//             //   ),
//             // );
//           },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: const Color(0xED6E95F6),
//               minimumSize: const Size(double.infinity, 56),
//               shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(10),
//                 topRight: Radius.circular(25),
//                 bottomLeft: Radius.circular(25),
//                 bottomRight: Radius.circular(10),
//               ),
//
//               ),
//             ),
//             icon: Icon(CupertinoIcons.arrow_right) ,
//             label:Text("Signin"),
//           ),
//         ),
//       ],
//     ),
//     );
//   }
// }

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';

import '../../../services/auth_service.dart';
import '../../profile/profile_page.dart';

class SigIn_Form extends StatelessWidget {
  final AuthService authService;

  const SigIn_Form({
    Key? key,
    required this.authService,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String email = ''; // Add a variable to store the email
    String password = ''; // Add a variable to store the password

    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              'assets/Backgrounds/R-removebg-preview.png',
              width: 700.0,
              height: 140.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: TextFormField(
              onChanged: (value) {
                // Update the email variable when the text changes
                email = value;
              },
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: SvgPicture.asset("assets/icons/email11.svg"),
                ),
                hintText: 'Enter your email',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 8),
            child: TextFormField(
              onChanged: (value) {
                // Update the password variable when the text changes
                password = value;
              },
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Icon(
                    Icons.password_outlined,
                    color: const Color(0xED6E95F6),
                  ),
                ),
                hintText: 'Enter your password',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 10),
            child: ElevatedButton.icon(
              onPressed: () {
                authService.loginUser(
                  context: context,
                  email: email, // Pass the email variable
                  password: password, // Pass the password variable
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xED6E95F6),
                minimumSize: const Size(double.infinity, 56),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(10),
                  ),
                ),
              ),
              icon: Icon(CupertinoIcons.arrow_right),
              label: Text("Signin"),
            ),
          ),
        ],
      ),
    );
  }
}
