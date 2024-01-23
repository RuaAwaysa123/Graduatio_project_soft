import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rive_animation/providers/user_provider.dart';
import 'package:rive_animation/screens/cources/course_details/Navigator_coffie.dart';
import 'package:rive_animation/screens/cources/root_app.dart';
import 'package:rive_animation/screens/cources/society_profile%20test.dart';
import 'package:rive_animation/screens/onboding/onboding_screen.dart';
import 'package:rive_animation/screens/profile_test/pages/profile_Screen.dart';
import 'package:rive_animation/screens/signUp/society_signup/signup_society_step2.dart';
import 'package:rive_animation/screens/society/root_app_society.dart';
import 'package:rive_animation/themes.dart';
import 'package:rive_animation/utils/Constants.dart';
import 'package:rive_animation/utils/user_preferences.dart';

import 'facebook/Calender_event_wedgets/create_event_page.dart';
import 'facebook/Calender_event_wedgets/detals_ui.dart';
import 'facebook/Cources_profile.dart';
import 'facebook/calender.dart';
import 'facebook/myCalnderhome.dart';
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
              //  home: OnboardingScreen(),// //MyCalendarPage
              home: EventDetailsPage(),// SignupStepper /MyCalendarPage/ MyHomePageCources /MyHomePageCources
              // home: MyHomePageTest(title: 'Flutter Demo Home Page', key: UniqueKey()),


              debugShowCheckedModeBanner: false,
            ),

      ),

    );
  }
}



