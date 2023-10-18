import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';

import 'Component/animated_btn.dart';
import 'Component/sign_in_form.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  // for the button animation
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late RiveAnimationController _btnAnimationController ;
 @override
  void initState() {
   // for add animation to the button
   _btnAnimationController = OneShotAnimation(
     "active",
     autoplay: false ,
   );
   // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            // height: 100,
            width: MediaQuery.of(context).size.width * 1.7,
            bottom: 200,
            left: 100,
            child: Image.asset("assets/Backgrounds/Spline.png"),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX : 20 , sigmaY : 10),
             // child: SizedBox(),
            ),
          ),

          RiveAnimation.asset("assets/RiveAssets/shapes.riv"),
Positioned.fill(
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX : 30 , sigmaY : 30),
       child: SizedBox(),
    ),
    ),
// add Text
        SafeArea(child:
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              SizedBox(
                width: 500,
                child: Column(
children:const [

Text("Empowering Tomorrow's Innovators:",
  style: TextStyle(
    fontSize: 50 ,
    fontFamily: "Poppins",
    height: 1.2 ,
  ),

),

   SizedBox(height: 20),
  Text("Skill Swap - Bridging Minds & Sharing Wisdom"), //2.47
],

                ),
              ),
          const Spacer(flex: 2,),
              // The code for the button
              Animatedbtn(btnAnimationController: _btnAnimationController,
                press: () {
                _btnAnimationController.isActive = true ;
                // add the code for the login dialog when button click
                Future.delayed(Duration(milliseconds: 800),(){  CustomSignDialog(context);
                  },
                );

               
              },),
Padding(
  padding: const EdgeInsets.symmetric(vertical: 24),
  child:   Text("Unlock Your Potential with Skill Swap! Gain access to 50+ skills, 300+ knowledge-sharing sessions, and endless opportunities for growth and collaboration."),
)
            ],
          ),
        ),
        )
          // the code for the animated button
        ],
      ),



    );
  }

  Future<Object?> CustomSignDialog(BuildContext context) {
    return showGeneralDialog(
      //add the close sign at the buttom

               // to close when tap outside
               barrierDismissible: true,
               barrierLabel: "SignIn",
               context: context,
               // add animation for the dialog
      transitionDuration: Duration(milliseconds: 400),
      transitionBuilder: (_ , animation , __ , child){
Tween<Offset> tween ;
tween = Tween(begin: const Offset(0 , -1), end: Offset.zero);
return SlideTransition(position: tween.animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut
),
),
  child: child,
);
      },

               pageBuilder:(context, _, __)=>
                 Center(
                   child: Container(
                     height: 620,
                     margin: EdgeInsets.symmetric(horizontal: 16),
                     padding: EdgeInsets.symmetric(vertical: 32 , horizontal: 24),
                     decoration: BoxDecoration(
                       color: Colors.white.withOpacity(0.94) ,
                       borderRadius: BorderRadius.all(Radius.circular(40))
                     ),
                     child: Scaffold(
                 backgroundColor: Colors.transparent,
                       body: Stack(
                         clipBehavior: Clip.none,
             children: [

                Column(

               children: [

                     // Padding(
                     //   padding: const EdgeInsets.symmetric(vertical: 16),
                        Text("Sign In",

                       style: TextStyle(
                           fontSize: 34,
                         fontFamily: "Poppins",

                       ),
                          textAlign: TextAlign.center,
                       ),
                         SigIn_Form(),
                      Row(
                        children: [
                          Expanded(child: Divider()),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16 , vertical: 10),
                            child: Text("or" , style: TextStyle(color: Colors.blue),),
                          ),
                          Expanded(child: Divider()),

                        ],
                      ),
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 6 ,vertical: 16),
                       child: Text("Sign Up with email ,facebook or google " ,style:TextStyle(color: Colors.blueAccent)),
                     ),

                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [

                         IconButton(
                           // padding : EdgeInsets.zero,
                           onPressed: (){}, icon: SvgPicture.asset("assets/icons/facebook.svg",
                           height: 64,
                           width: 64,

                         ),
                         ),

                         IconButton(
                           //padding : EdgeInsets.zero,
                           onPressed: (){
                             Navigator.pushNamed(context, '/signup');

                           }, icon: SvgPicture.asset("assets/icons/gmail.svg",
                           height: 64,
                           width: 64,

                         ),
                         ),

                         IconButton(
                          // padding : EdgeInsets.zero,
                           onPressed: (){}, icon: SvgPicture.asset("assets/icons/search.svg",
                           height: 64,
                           width: 64,

                         ),
                         ),



                       ],
                     ),
               ],

                     ),
               Positioned(
                 left: 0,
                 right: 0,
                 bottom: -48,
                 child: CircleAvatar(

                   radius: 16,
                   backgroundColor: Colors.white,
                   child: Icon(
                     Icons.close,
                     color: Colors.black,
                   ),
                 ),
               ),
                   ],

                 ),
               ),
                   ),
                 ),
             );
  }
}

// class SigIn_Form extends StatelessWidget {
//   const SigIn_Form({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(child:
//     Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
// Padding(
//   padding: const EdgeInsets.only(top: 16 ,bottom: 16),
//   child:   TextFormField(
//     decoration: InputDecoration(
//       prefixIcon: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 8),
//         child: SvgPicture.asset("assets/icons/email11.svg"),
//
//       ),
//       hintText: 'Enter your email', // Add your explanatory text here
//     ),
//
//   ),
// ),
//
// // the password filed
//         Padding(
//           padding: const EdgeInsets.only(top: 16 ,bottom: 16),
//           child:   TextFormField(
//             obscureText: true ,
//             decoration: InputDecoration(
//               prefixIcon: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8),
//                 child: Icon(
//                   Icons.password_outlined, // Replace with the desired icon
//                   color: Colors.blue, // Change the icon color as needed
//                 ),
//
//               ),
//               hintText: 'Enter your password', // Add your explanatory text here
//             ),
//
//           ),
//         ),
// Padding(
//   padding: const EdgeInsets.only(top: 8 , bottom: 24),
//   child:   ElevatedButton.icon(onPressed:(){},
//     style: ElevatedButton.styleFrom(
//       backgroundColor: const Color(0xED6E95F6),
//       minimumSize: const Size(double.infinity, 56),
//       shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(
//         topLeft: Radius.circular(10),
//         topRight: Radius.circular(25),
//         bottomLeft: Radius.circular(25),
//         bottomRight: Radius.circular(10),
//       ),
//
//       ),
//     ),
//     icon: Icon(CupertinoIcons.arrow_right) ,
//     label:Text("Signin"),
//   ),
// )
//
//       ],
//     ),
//     );
//   }
// }
