// // import 'package:flutter/material.dart';
// //
// // import 'package:flutter/services.dart';
// // import 'package:rive_animation/screens/onboding/onboding_screen.dart';
// // import 'package:rive_animation/screens/sign_up_screen/sign_up_screen.dart';
// // import 'package:rive_animation/utils/user_preferences.dart';
// //
// // void main() {
// //   runApp(const MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final user = UserPreferences.myUser;
// //     return MaterialApp(
// //       title: 'The Flutter Way',
// //       theme: ThemeData(
// //         scaffoldBackgroundColor: Color(0xFFEEF1F8),
// //         primarySwatch: Colors.blue,
// //         fontFamily: "Intel",
// //         inputDecorationTheme: InputDecorationTheme(
// //           filled: true,
// //           fillColor: Colors.white,
// //           errorStyle: TextStyle(height: 0),
// //           border: defaultInputBorder,
// //           enabledBorder: defaultInputBorder,
// //           focusedBorder: defaultInputBorder,
// //           errorBorder: defaultInputBorder,
// //         ),
// //       ),
// //
// //       initialRoute: '/onboarding', // Set the initial route
// //       routes: {
// //         '/onboarding': (context) => const OnboardingScreen(),
// //         '/signup': (context) => SignupScreen(), // Define a route to the SignupScreen
// //       },
// //     );
// //   }
// // }
// //
// // const defaultInputBorder = OutlineInputBorder(
// //   borderRadius: BorderRadius.all(Radius.circular(16)),
// //   borderSide: BorderSide(
// //     color: Color(0xFFDEE3F2),
// //     width: 1,
// //   ),
// // );
// // //
// //
// //
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rive_animation/providers/user_provider.dart';
import 'package:rive_animation/screens/cources/root_app.dart';
import 'package:rive_animation/screens/onboding/onboding_screen.dart';
import 'package:rive_animation/screens/society/root_app_society.dart';
import 'package:rive_animation/themes.dart';
import 'package:rive_animation/utils/Constants.dart';
import 'package:rive_animation/utils/user_preferences.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: Constants.apiKey,
            appId: Constants.appId,
            messagingSenderId: Constants.messagingSenderId,
            projectId: Constants.projectId));
  } else {
    await Firebase.initializeApp();
  }
  runApp(
    MultiProvider(
      providers: [
        // Define your providers here, for example:
        ChangeNotifierProvider(create: (_) => UserProvider()),
        // You should add other providers here as needed.
      ],
      child: MyApp(),
    ),
  );
}


final String title = 'User Profile';
class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;
    final isDarkMode = false;
    return ThemeProvider(
      initTheme: isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
      child: Builder(
        builder: (context) =>
            MaterialApp(
              title: 'MyTitle',
              theme: isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
              // scrollBehavior: Profile(),
              home: OnboardingScreen(),
              // home: RootAppSociety(),//RootAppCources


              debugShowCheckedModeBanner: false,
            ),

      ),


    );
  }
}




// // main for notification
// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:rive_animation/screens/Home/notifcation_tap.dart';
// import 'package:rive_animation/widget/constans/colors.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         textTheme: const TextTheme(
//           //this Font we will use later 'H1'
//
//           headline1: TextStyle(
//             color: mainText,
//             fontFamily: 'Inter',
//             fontSize: 22,
//             fontWeight: FontWeight.w700,
//           ),
//
//           //this font we will use later 'H2'
//
//           headline2: TextStyle(
//             color: mainText,
//             fontFamily: 'Inter',
//             fontSize: 17,
//             fontWeight: FontWeight.w700,
//           ),
//           //this font we will use  later 'H3'
//
//           headline3: TextStyle(
//             fontFamily: 'Inter',
//             fontSize: 15,
//             fontWeight: FontWeight.w700,
//           ),
//
//           //this font we will use later 'P1'
//
//           bodyText1: TextStyle(
//             color: SecondaryText,
//             fontFamily: 'Inter',
//             fontSize: 17,
//             fontWeight: FontWeight.w500,
//           ),
//
//           //this font we will use later 'P2'
//
//           bodyText2: TextStyle(
//             fontFamily: 'Inter',
//             fontSize: 15,
//             fontWeight: FontWeight.w500,
//           ),
//           //this font we will use later 'S'
//           subtitle1: TextStyle(
//             fontFamily: 'Inter',
//             fontSize: 12,
//             fontWeight: FontWeight.w500,
//           ),
//           //thus we have added all the fonts used in the projct ..
//         ),
//         primarySwatch: Colors.blue,
//       ),
//       home: NotitcationTap(),
//     );
//   }
// }