// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:rive_animation/utils/utils.dart';
// import 'package:http/http.dart' as http;
// import 'package:provider/provider.dart';
// import 'package:rive_animation/model/user.dart';
// class AuthoService {
//   static String uri = 'http://localhost:3000';
//   void signupUser({
//     required BuildContext context,
//     required String email,
//     required String password,
//    required String name,
// }) async{
// try {
//   User user1 = User(
//     id: '',
//     name: '',
//     email: '',
//     token: '',
//     imagePath: '',
//     about: '',
//     location: '',
//     major: '',
//     phoneNumber: '',
//     university: '',
//     interests: [],
//     skills: [],
// //password: '',
//   );
//   http.Response res = await http.post(
//     Uri.parse('${uri}/api/signup'),
//     body: user1.toJson() ,
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//   ) ;
//
//   httpErrorHandle(
//     response: res,
//     context: context,
//     onSuccess: () {
//       showSnackBar(
//         context,
//         'Account created! Login with the same credentials!',
//       );
//     },
//   );
// }catch(e){
//   showSnackBar(context, e.toString());
// }
//
//   }
// }

//----------------------------------------------------------------------------

import 'package:flutter/material.dart';
import 'dart:convert';
// import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive_animation/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:rive_animation/model/User1.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../providers/user_provider.dart';
import '../screens/onboding/onboding_screen.dart';
import '../screens/profile/profile_page.dart';
import '../utils/Constants.dart';

class AuthService {
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    // required String name,
  }) async {
    try {
      User user = User(
        id: '',
       // name: name,
        password: password,
        email: email,
        token: '',
      );

      http.Response res = await http.post(
        Uri.parse('${Constants.uri}/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            'Account created! Login with the same credentials!',
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // void signInUser({
  //   required BuildContext context,
  //   required String email,
  //   required String password,
  // }) async {
  //   try {
  //     var userProvider = Provider.of<UserProvider>(context, listen: false);
  //     final navigator = Navigator.of(context);
  //     http.Response res = await http.post(
  //       Uri.parse('${Constants.uri}/api/signin'),
  //       body: jsonEncode({
  //         'email': email,
  //         'password': password,
  //       }),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //     );
  //     httpErrorHandle(
  //       response: res,
  //       context: context,
  //       onSuccess: () async {
  //         SharedPreferences prefs = await SharedPreferences.getInstance();
  //         userProvider.setUser(res.body);
  //         await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
  //         navigator.pushAndRemoveUntil(
  //           MaterialPageRoute(
  //             builder: (context) =>  ProfilePage(),
  //           ),
  //               (route) => false,
  //         );
  //       },
  //     );
  //   } catch (e) {
  //     showSnackBar(context, e.toString());
  //   }
  // }
  //
  // // get user data
  // void getUserData(
  //     BuildContext context,
  //     ) async {
  //   try {
  //     var userProvider = Provider.of<UserProvider>(context, listen: false);
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     String? token = prefs.getString('x-auth-token');
  //
  //     if (token == null) {
  //       prefs.setString('x-auth-token', '');
  //     }
  //
  //     var tokenRes = await http.post(
  //       Uri.parse('${Constants.uri}/tokenIsValid'),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //         'x-auth-token': token!,
  //       },
  //     );
  //
  //     var response = jsonDecode(tokenRes.body);
  //
  //     if (response == true) {
  //       http.Response userRes = await http.get(
  //         Uri.parse('${Constants.uri}/'),
  //         headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8', 'x-auth-token': token},
  //       );
  //
  //       userProvider.setUser(userRes.body);
  //     }
  //   } catch (e) {
  //     showSnackBar(context, e.toString());
  //   }
  // }
  //
  // void signOut(BuildContext context) async {
  //   final navigator = Navigator.of(context);
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('x-auth-token', '');
  //   navigator.pushAndRemoveUntil(
  //     MaterialPageRoute(
  //       builder: (context) => const OnboardingScreen(),
  //     ),
  //         (route) => false,
  //   );
  // }
}