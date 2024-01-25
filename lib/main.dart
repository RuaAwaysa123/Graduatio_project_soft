import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rive_animation/providers/user_provider.dart';
import 'package:rive_animation/screens/onboding/onboding_screen.dart';
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
               home: OnboardingScreen(),// //MyCalendarPage
              // home: ProfileFourPage(),// SignupStepper /MyCalendarPage/ MyHomePageCources /MyHomePageCources
              // home: MyHomePageTest(title: 'Flutter Demo Home Page', key: UniqueKey()),


              debugShowCheckedModeBanner: false,
            ),

      ),

    );
  }
}


// ***************************** Web Main ********************************
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
//
// import 'Web_screens/constants.dart';
// import 'Web_screens/controllers/MenuAppController.dart';
// import 'Web_screens/screens/main/main_screen.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Admin Panel',
//       theme: ThemeData.dark().copyWith(
//         scaffoldBackgroundColor: bgColor,
//         textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
//             .apply(bodyColor: Colors.white),
//         canvasColor: secondaryColor,
//       ),
//       home: MultiProvider(
//         providers: [
//           ChangeNotifierProvider(
//             create: (context) => MenuAppController(),
//           ),
//         ],
//         child: MainScreen(),
//       ),
//     );
//   }
// }
