// import 'package:flutter/material.dart';
//
// import 'package:flutter/services.dart';
// import 'package:rive_animation/screens/onboding/onboding_screen.dart';
// import 'package:rive_animation/screens/sign_up_screen/sign_up_screen.dart';
// import 'package:rive_animation/utils/user_preferences.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final user = UserPreferences.myUser;
//     return MaterialApp(
//       title: 'The Flutter Way',
//       theme: ThemeData(
//         scaffoldBackgroundColor: Color(0xFFEEF1F8),
//         primarySwatch: Colors.blue,
//         fontFamily: "Intel",
//         inputDecorationTheme: InputDecorationTheme(
//           filled: true,
//           fillColor: Colors.white,
//           errorStyle: TextStyle(height: 0),
//           border: defaultInputBorder,
//           enabledBorder: defaultInputBorder,
//           focusedBorder: defaultInputBorder,
//           errorBorder: defaultInputBorder,
//         ),
//       ),
//
//       initialRoute: '/onboarding', // Set the initial route
//       routes: {
//         '/onboarding': (context) => const OnboardingScreen(),
//         '/signup': (context) => SignupScreen(), // Define a route to the SignupScreen
//       },
//     );
//   }
// }
//
// const defaultInputBorder = OutlineInputBorder(
//   borderRadius: BorderRadius.all(Radius.circular(16)),
//   borderSide: BorderSide(
//     color: Color(0xFFDEE3F2),
//     width: 1,
//   ),
// );
// //
//
//
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rive_animation/providers/user_provider.dart';
import 'package:rive_animation/screens/Home/Button_Navigator.dart';
import 'package:rive_animation/screens/onboding/onboding_screen.dart';
import 'package:rive_animation/screens/profile/profile_page.dart';
import 'package:rive_animation/screens/sign_up_screen/education_input_page.dart';
import 'package:rive_animation/themes.dart';
import 'package:rive_animation/utils/user_preferences.dart';

import 'facebook/profile.dart';
import 'providers/user_profile_provider.dart';

//
// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);
//
//   runApp(MyApp());
// }

// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => UserProfileProvider(),
//       child: MyApp(),
//     ),
//   );
// }

// void main() {
//   runApp( MyApp());
// }


void main() {
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
              // home: Profile(),

              debugShowCheckedModeBanner: false,
            ),

      ),
    );
  }
}

