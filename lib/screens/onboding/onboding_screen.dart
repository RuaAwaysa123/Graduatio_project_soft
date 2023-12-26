import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';

import '../../login_page.dart';
import '../../services/auth_service.dart';
import '../../widget/chat_wedgets/widgets.dart';
import '../sign_up_screen/regestration_with_fierbase.dart';
import '../sign_up_screen/sign_up_screen.dart';
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

Text("Explore.",

  style: TextStyle(
    fontSize: 50 ,
    fontFamily: "Poppins",
    height: 1.2 ,
  ),

),
  Text("LEARN a new skill",

    style: TextStyle(
      fontSize: 35 ,
      fontFamily: "Poppins",
      height: 1.2 ,
    ),

  ),
  Text("Get a new friend",

    style: TextStyle(
      fontSize: 30 ,
      fontFamily: "Poppins",
      height: 1.2 ,
    ),

  ),



  SizedBox(height: 20),
  Text("Skill Swap - Connect people seeking to share    & acquire skills"), //2.47
],

                ),
              ),
          const Spacer(flex: 2,),
              // The code for the button
              Animatedbtn(btnAnimationController: _btnAnimationController,
                press: () {
                _btnAnimationController.isActive = true ;
                // add the code for the login dialog when button click
                Future.delayed(Duration(milliseconds: 800),(){
                  nextScreen(context, const LoginPage());
                 // CustomSignDialog(context, AuthService());
                  },
                );

               
              },),
Padding(
  padding: const EdgeInsets.symmetric(vertical: 24),
  child:   Text("Unlock Your Potential with Skill Swap! Gain access to skills,  knowledge-sharing sessions, and endless opportunities for growth and collaboration."),
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

  Future<Object?> CustomSignDialog(BuildContext context, AuthService authService) {
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

                 // LoginPage
                 //SignInForm(authService: authService),
                      Row(
                        children: [
                          Expanded(child: Divider()),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16 , vertical: 10),
                            // child: Text("or" , style: TextStyle(color: const Color(0xED6E95F6)),),
                            child: Text("or" , style: TextStyle(color: Colors.blue),),
                          ),
                          Expanded(child: Divider()),

                        ],
                      ),
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 6 ,vertical: 16),
                       child: Text("Sign Up with email ,facebook or google " ,style:TextStyle(color: Colors.blue,)),
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
//------------------------------------------------------------------------------
                         IconButton(
                           //padding : EdgeInsets.zero,
                           onPressed: (){
                             //Navigator.pushNamed(context, '/signup');
                             Navigator.push(
                               context,
                               MaterialPageRoute(
                                 builder: (context) => RegisterPage(),
                               ),
                             );

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
                   ],

                 ),
               ),
                   ),
                 ),
             );
  }
}

