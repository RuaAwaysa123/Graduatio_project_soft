// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:rive_animation/utils/utils.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:provider/provider.dart';
// // import 'package:rive_animation/model/user.dart';
// // class AuthoService {
// //   static String uri = 'http://localhost:3000';
// //   void signupUser({
// //     required BuildContext context,
// //     required String email,
// //     required String password,
// //    required String name,
// // }) async{
// // try {
// //   User user1 = User(
// //     id: '',
// //     name: '',
// //     email: '',
// //     token: '',
// //     imagePath: '',
// //     about: '',
// //     location: '',
// //     major: '',
// //     phoneNumber: '',
// //     university: '',
// //     interests: [],
// //     skills: [],
// // //password: '',
// //   );
// //   http.Response res = await http.post(
// //     Uri.parse('${uri}/api/signup'),
// //     body: user1.toJson() ,
// //     headers: <String, String>{
// //       'Content-Type': 'application/json; charset=UTF-8',
// //     },
// //   ) ;
// //
// //   httpErrorHandle(
// //     response: res,
// //     context: context,
// //     onSuccess: () {
// //       showSnackBar(
// //         context,
// //         'Account created! Login with the same credentials!',
// //       );
// //     },
// //   );
// // }catch(e){
// //   showSnackBar(context, e.toString());
// // }
// //
// //   }
// // }
//
// //----------------------------------------------------------------------------
//
// import 'package:flutter/material.dart';
// import 'dart:convert';
// // import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:rive_animation/utils/utils.dart';
// import 'package:http/http.dart' as http;
// import 'package:provider/provider.dart';
// import 'package:rive_animation/model/User1.dart';
//
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../providers/user_provider.dart';
// import '../screens/onboding/onboding_screen.dart';
// import '../screens/profile/profile_page.dart';
// import '../utils/Constants.dart';
//
// class AuthService {
//   void signUpUser({
//     required BuildContext context,
//     required String email,
//     required String password,
//     // required String name,
//   }) async {
//     try {
//       User user = User(
//         id: '',
//        // name: name,
//         password: password,
//         email: email,
//         token: '',
//       );
//
//       http.Response res = await http.post(
//         Uri.parse('${Constants.uri}/api/signup'),
//         body: user.toJson(),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//       );
//
//       httpErrorHandle(
//         response: res,
//         context: context,
//         onSuccess: () {
//           showSnackBar(
//             context,
//             'Account created! Login with the same credentials!',
//           );
//         },
//       );
//     } catch (e) {
//       showSnackBar(context, e.toString());
//     }
//   }
//
//   // void signInUser({
//   //   required BuildContext context,
//   //   required String email,
//   //   required String password,
//   // }) async {
//   //   try {
//   //     var userProvider = Provider.of<UserProvider>(context, listen: false);
//   //     final navigator = Navigator.of(context);
//   //     http.Response res = await http.post(
//   //       Uri.parse('${Constants.uri}/api/signin'),
//   //       body: jsonEncode({
//   //         'email': email,
//   //         'password': password,
//   //       }),
//   //       headers: <String, String>{
//   //         'Content-Type': 'application/json; charset=UTF-8',
//   //       },
//   //     );
//   //     httpErrorHandle(
//   //       response: res,
//   //       context: context,
//   //       onSuccess: () async {
//   //         SharedPreferences prefs = await SharedPreferences.getInstance();
//   //         userProvider.setUser(res.body);
//   //         await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
//   //         navigator.pushAndRemoveUntil(
//   //           MaterialPageRoute(
//   //             builder: (context) =>  ProfilePage(),
//   //           ),
//   //               (route) => false,
//   //         );
//   //       },
//   //     );
//   //   } catch (e) {
//   //     showSnackBar(context, e.toString());
//   //   }
//   // }
//   //
//   // // get user data
//   // void getUserData(
//   //     BuildContext context,
//   //     ) async {
//   //   try {
//   //     var userProvider = Provider.of<UserProvider>(context, listen: false);
//   //     SharedPreferences prefs = await SharedPreferences.getInstance();
//   //     String? token = prefs.getString('x-auth-token');
//   //
//   //     if (token == null) {
//   //       prefs.setString('x-auth-token', '');
//   //     }
//   //
//   //     var tokenRes = await http.post(
//   //       Uri.parse('${Constants.uri}/tokenIsValid'),
//   //       headers: <String, String>{
//   //         'Content-Type': 'application/json; charset=UTF-8',
//   //         'x-auth-token': token!,
//   //       },
//   //     );
//   //
//   //     var response = jsonDecode(tokenRes.body);
//   //
//   //     if (response == true) {
//   //       http.Response userRes = await http.get(
//   //         Uri.parse('${Constants.uri}/'),
//   //         headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8', 'x-auth-token': token},
//   //       );
//   //
//   //       userProvider.setUser(userRes.body);
//   //     }
//   //   } catch (e) {
//   //     showSnackBar(context, e.toString());
//   //   }
//   // }
//   //
//   // void signOut(BuildContext context) async {
//   //   final navigator = Navigator.of(context);
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   prefs.setString('x-auth-token', '');
//   //   navigator.pushAndRemoveUntil(
//   //     MaterialPageRoute(
//   //       builder: (context) => const OnboardingScreen(),
//   //     ),
//   //         (route) => false,
//   //   );
//   // }
// }

//**********************************************************************************
import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';
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
    String phoneNumber = '',
    String firstName = '',
    String lastName = '',
    String location = '',
    String universityNumber = '',
    String major = '',
    String year = '',
  }) async {
    try {
      User user = User(
        id: '',
        email: email,
        password: password,
        token: '',
        phoneNumber: phoneNumber,
        firstName: firstName,
        lastName: lastName,
        location: location,
        universityNumber: universityNumber,
        major: major,
        year: year,
        about: '',
        university: '',
         interests: [], certificates: [], skills: [], education: [], imgUrl: '',
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

  void signupContinue({
    required BuildContext context,
    required String email,
   String password = '',
    required phoneNumber,
    required firstName ,
    required lastName ,
    required location ,
    required universityNumber ,
    required major ,
    required year ,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('${Constants.uri}/api/signup_continue'),
        body: jsonEncode({
          'email': email,
          'password': password,
          'phoneNumber': phoneNumber,
          'firstName': firstName,
          'lastName': lastName,
          'location': location,
          'universityNumber': universityNumber,
          'major': major,
          'year': year,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          // Show success message or navigate to the next screen
          showSnackBar(
            context,
            'Continuation data saved!',
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void addEducation({
    required BuildContext context,
    required String userId,
    required String schoolName,
    required String startDate,
    required String endDate,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('${Constants.uri}/api/addEducation'),
        body: jsonEncode({
          'userId': userId,
          'schoolName': schoolName,
          'startDate': startDate,
          'endDate': endDate,
        }),
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
            'Education information added successfully!',
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // Add Certificate Information
  void addCertificate({
    required BuildContext context,
    required String userId,
    required String certificateName,
    required String certificateURL,
    required String issueOrganization,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('${Constants.uri}/api/addCertificate'),
        body: jsonEncode({
          'userId': userId,
          'certificateName': certificateName,
          'certificateURL': certificateURL,
          'issueOrganization': issueOrganization,
        }),
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
            'Certificate information added successfully!',
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // Add Skill Information
  void addSkill({
    required BuildContext context,
    required String userId,
    required String skillName,
    required String rating,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('${Constants.uri}/api/addSkill'),
        body: jsonEncode({
          'userId': userId,
          'skillName': skillName,
          'rating': rating,
        }),
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
            'Skill information added successfully!',
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // Add Interest Information
  void addInterest({
    required BuildContext context,
    required String userId,
    required String title,
    required String description,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('${Constants.uri}/api/addInterest'),
        body: jsonEncode({
          'userId': userId,
          'title': title,
          'description': description,
        }),
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
            'Interest information added successfully!',
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // login user
  // void loginUser({
  //   required BuildContext context,
  //   required String email,
  //   required String password,
  // }) async {
  //   try {
  //     http.Response res = await http.post(
  //       Uri.parse('${Constants.uri}/api/login'),
  //       body: jsonEncode({
  //         'email': email,
  //         'password': password,
  //       }),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //     );
  //
  //     if (res.statusCode == 200) {
  //       // Successful login
  //       final Map<String, dynamic> responseData = json.decode(res.body);
  //       String token = responseData['token'];
  //       // You can save the token to shared preferences or any other storage
  //       SharedPreferences prefs = await SharedPreferences.getInstance();
  //       prefs.setString('token', token);
  //
  //       // Navigate to the profile page or any other screen after successful login
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => ProfilePage(),
  //         ),
  //       );
  //     } else {
  //       // Handle errors for unsuccessful login
  //       httpErrorHandle(
  //         response: res,
  //         context: context,
  //         onSuccess: () {
  //           // Handle success if needed
  //         },
  //       );
  //     }
  //   } catch (e) {
  //     showSnackBar(context, e.toString());
  //   }
  // }
  // Future<User> loginUser({
  //   required BuildContext context,
  //   required String email,
  //   required String password,
  // }) async {
  //   try {
  //     http.Response res = await http.post(
  //       Uri.parse('${Constants.uri}/api/login'),
  //       body: jsonEncode({
  //         'email': email,
  //         'password': password,
  //       }),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //     );
  //
  //     if (res.statusCode == 200) {
  //       // Successful login
  //       final Map<String, dynamic> responseData = json.decode(res.body);
  //       String token = responseData['token'];
  //
  //       // Retrieve the user data from the response
  //       User user = User.fromMap(responseData['user']);
  //
  //       // You can save the token to shared preferences or any other storage
  //       SharedPreferences prefs = await SharedPreferences.getInstance();
  //       prefs.setString('token', token);
  //
  //       // Return the user object
  //       return user;
  //     } else {
  //       // Handle errors for unsuccessful login
  //       httpErrorHandle(
  //         response: res,
  //         context: context,
  //         onSuccess: () {
  //           // Handle success if needed
  //         },
  //       );
  //       // Return a dummy user object or throw an exception
  //       return User(id: '', email: '', token: '', password: '', phoneNumber: '', firstName: '', lastName: '', location: '', universityNumber: '', major: '', year: '', about: '', university: '', interests: [], certificates: [], skills: [], education: []);
  //     }
  //   } catch (e) {
  //     showSnackBar(context, e.toString());
  //     // Return a dummy user object or throw an exception
  //     return User(id: '', email: '', token: '', password: '', phoneNumber: '', firstName: '', lastName: '', location: '', universityNumber: '', major: '', year: '', about: '', university: '', interests: [], certificates: [], skills: [], education: []);
  //   }
  // }


  Future<User> getUserProfile({
    required BuildContext context,
    required String userId,
  }) async {
    try {
      http.Response res = await http.get(
        Uri.parse('${Constants.uri}/api/user/$userId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (res.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(res.body);
        User user = User.fromMap(responseData);

        return user;
      } else {
        httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            // Handle success if needed
          },
        );
        return User(
          id: '',
          email: '',
          token: '',
          password: '',
          phoneNumber: '',
          firstName: '',
          lastName: '',
          location: '',
          universityNumber: '',
          major: '',
          year: '',
          about: '',
          university: '',
          interests: [],
          certificates: [],
          skills: [],
          education: [], imgUrl: '',
        );
      }
    } catch (e) {
      showSnackBar(context, e.toString());
      return User(
        id: '',
        email: '',
        token: '',
        password: '',
        phoneNumber: '',
        firstName: '',
        lastName: '',
        location: '',
        universityNumber: '',
        major: '',
        year: '',
        about: '',
        university: '',
        interests: [],
        certificates: [],
        skills: [],
        education: [], imgUrl: '',
      );
    }
  }

  //-------------------------------------------------
// Inside AuthService class
  Future<void> loginUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('${Constants.uri}/api/login'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (res.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(res.body);

        if (responseData.containsKey('token') && responseData.containsKey('userId')) {
          String? token = responseData['token'];
          String? userId = responseData['userId'];

          if (token != null && userId != null) {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString('token', token);
            prefs.setString('userId', userId);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(),
              ),
            );
          } else {
            showSnackBar(context, 'Invalid response format');
          }
        } else {
          showSnackBar(context, 'Invalid credentials');
        }
      } else {
        httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            // Handle success if needed
          },
        );
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> updateProfilePicture({
    required String userId,
    required File? profilePicture,
  }) async {
    try {
      if (profilePicture == null) {
        // Handle case when no new profile picture is selected
        return;
      }

      String apiUrl = '${Constants.uri}/api/updateProfilePicture/$userId';

      var request = http.MultipartRequest('POST', Uri.parse(apiUrl))
        ..files.add(await http.MultipartFile.fromPath('profilePicture', profilePicture.path));

      var response = await request.send();

      if (response.statusCode == 200) {
        // Success, handle the response if needed
        print('Profile picture updated successfully');
      } else {
        // Handle the error
        print('Failed to update profile picture: ${response.reasonPhrase}');
      }
    } catch (e) {
      // Handle exceptions
      print('Error updating profile picture: $e');
    }
  }
}
