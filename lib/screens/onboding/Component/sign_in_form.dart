import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';

class SigIn_Form extends StatelessWidget {
  const SigIn_Form({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(child:
    Column(
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
          padding: const EdgeInsets.only(top: 8 ,bottom: 8),
          child:   TextFormField(
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: SvgPicture.asset("assets/icons/email11.svg"),

              ),
              hintText: 'Enter your email', // Add your explanatory text here
            ),

          ),
        ),

// the password filed
        Padding(
          padding: const EdgeInsets.only(top: 10 ,bottom: 8),
          child:   TextFormField(
            obscureText: true ,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Icon(
                  Icons.password_outlined, // Replace with the desired icon
                  color: Colors.blue, // Change the icon color as needed
                ),

              ),
              hintText: 'Enter your password', // Add your explanatory text here
            ),

          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8 , bottom: 10),
          child:   ElevatedButton.icon(onPressed:(){},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xED6E95F6),
              minimumSize: const Size(double.infinity, 56),
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(10),
              ),

              ),
            ),
            icon: Icon(CupertinoIcons.arrow_right) ,
            label:Text("Signin"),
          ),
        ),
      ],
    ),
    );
  }
}
