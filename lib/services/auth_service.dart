// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:rive_animation/utils/utils.dart';
// import 'package:http/http.dart' as http;
// import 'package:provider/provider.dart';
// import 'package:rive_animation/model/User1.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../providers/user_provider.dart';
// import '../screens/Home/Button_Navigator.dart';
// import '../screens/onboding/onboding_screen.dart';
// import '../screens/profile/profile_page.dart';
// import '../utils/Constants.dart';
//
// class AuthService {
//   void signUpUser({
//     required BuildContext context,
//     required String email,
//     required String password,
//     required String fullName ,
//     String phoneNumber = '',
//     String location = '',
//     String universityNumber = '',
//     String major = '',
//     String year = '',
//   }) async {
//     try {
//       User user = User(
//         id: '',
//         email: email,
//         password: password,
//         token: '',
//         phoneNumber: phoneNumber,
//         fullName: '',
//         // firstName: firstName,
//         // lastName: lastName,
//         location: location,
//         universityNumber: universityNumber,
//         major: major,
//         year: year,
//         about: '',
//         university: '',
//          interests: [], certificates: [], skills: [], education: [], imgUrl: '',
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
//   void signupContinue({
//     required BuildContext context,
//     required String email,
//    String password = '',
//     required phoneNumber,
//     // required firstName ,
//     // required lastName ,
//     required location ,
//     required universityNumber ,
//     required major ,
//     required year ,
//   }) async {
//     try {
//       http.Response res = await http.post(
//         Uri.parse('${Constants.uri}/api/signup_continue'),
//         body: jsonEncode({
//           'email': email,
//           'password': password,
//           'phoneNumber': phoneNumber,
//           // 'firstName': firstName,
//           // 'lastName': lastName,
//           'location': location,
//           'universityNumber': universityNumber,
//           'major': major,
//           'year': year,
//         }),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//       );
//
//       httpErrorHandle(
//         response: res,
//         context: context,
//         onSuccess: () {
//           // Show success message or navigate to the next screen
//           showSnackBar(
//             context,
//             'Continuation data saved!',
//           );
//         },
//       );
//     } catch (e) {
//       showSnackBar(context, e.toString());
//     }
//   }
//
//   void addEducation({
//     required BuildContext context,
//     required String userId,
//     required String schoolName,
//     required DateTime startDate,
//     required DateTime endDate, required educationId,
//   }) async {
//     try {
//       http.Response res = await http.post(
//         Uri.parse('${Constants.uri}/api/addEducation'),
//         body: jsonEncode({
//           'userId': userId,
//           'schoolName': schoolName,
//           'startDate': startDate,
//           'endDate': endDate,
//         }),
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
//             'Education information added successfully!',
//           );
//         },
//       );
//     } catch (e) {
//       showSnackBar(context, e.toString());
//     }
//   }
//
//   // Add Certificate Information
//   void addCertificate({
//     required BuildContext context,
//     required String userId,
//     required String certificateName,
//     required String certificateURL,
//     required String issueOrganization,
//   }) async {
//     try {
//       http.Response res = await http.post(
//         Uri.parse('${Constants.uri}/api/addCertificate'),
//         body: jsonEncode({
//           'userId': userId,
//           'certificateName': certificateName,
//           'certificateURL': certificateURL,
//           'issueOrganization': issueOrganization,
//         }),
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
//             'Certificate information added successfully!',
//           );
//         },
//       );
//     } catch (e) {
//       showSnackBar(context, e.toString());
//     }
//   }
//
//   // Add Skill Information
//   void addSkill({
//     required BuildContext context,
//     required String userId,
//     required String skillName,
//     required String rating,
//   }) async {
//     try {
//       http.Response res = await http.post(
//         Uri.parse('${Constants.uri}/api/addSkill'),
//         body: jsonEncode({
//           'userId': userId,
//           'skillName': skillName,
//           'rating': rating,
//         }),
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
//             'Skill information added successfully!',
//           );
//         },
//       );
//     } catch (e) {
//       showSnackBar(context, e.toString());
//     }
//   }
//
//   // Add Interest Information
//   void addInterest({
//     required BuildContext context,
//     required String userId,
//     required String title,
//     required String description,
//   }) async {
//     try {
//       http.Response res = await http.post(
//         Uri.parse('${Constants.uri}/api/addInterest'),
//         body: jsonEncode({
//           'userId': userId,
//           'title': title,
//           'description': description,
//         }),
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
//             'Interest information added successfully!',
//           );
//         },
//       );
//     } catch (e) {
//       showSnackBar(context, e.toString());
//     }
//   }
//
//   Future<User> getUserProfile({
//     required BuildContext context,
//     required String userId,
//   }) async {
//     try {
//       http.Response res = await http.get(
//         Uri.parse('${Constants.uri}/api/user/$userId'),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//       );
//
//       if (res.statusCode == 200) {
//         final Map<String, dynamic> responseData = json.decode(res.body);
//         User user = User.fromMap(responseData);
//
//         return user;
//       } else {
//         httpErrorHandle(
//           response: res,
//           context: context,
//           onSuccess: () {
//             // Handle success if needed
//           },
//         );
//         return User(
//           id: '',
//           email: '',
//           token: '',
//           password: '',
//           phoneNumber: '',
//           fullName: '',
//           // firstName: '',
//           // lastName: '',
//           location: '',
//           universityNumber: '',
//           major: '',
//           year: '',
//           about: '',
//           university: '',
//           interests: [],
//           certificates: [],
//           skills: [],
//           education: [], imgUrl: '',
//         );
//       }
//     } catch (e) {
//       showSnackBar(context, e.toString());
//       return User(
//         id: '',
//         email: '',
//         token: '',
//         password: '',
//         phoneNumber: '',
//         fullName: '',
//         // firstName: '',
//         // lastName: '',
//         location: '',
//         universityNumber: '',
//         major: '',
//         year: '',
//         about: '',
//         university: '',
//         interests: [],
//         certificates: [],
//         skills: [],
//         education: [], imgUrl: '',
//       );
//     }
//   }
//
//   //-------------------------------------------------
// // Inside AuthService class
//   Future<void> loginUser({
//     required BuildContext context,
//     required String email,
//     required String password,
//   }) async {
//     try {
//       http.Response res = await http.post(
//         Uri.parse('${Constants.uri}/api/login'),
//         body: jsonEncode({
//           'email': email,
//           'password': password,
//         }),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//       );
//
//       if (res.statusCode == 200) {
//         final Map<String, dynamic> responseData = json.decode(res.body);
//
//         if (responseData.containsKey('token') && responseData.containsKey('userId')) {
//           String? token = responseData['token'];
//           String? userId = responseData['userId'];
//
//           if (token != null && userId != null) {
//             SharedPreferences prefs = await SharedPreferences.getInstance();
//             prefs.setString('token', token);
//             prefs.setString('userId', userId);
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 // builder: (context) => ProfilePage(),
//                   builder: (context) => RootApp1(),
//               ),
//             );
//           } else {
//             showSnackBar(context, 'Invalid response format');
//           }
//         } else {
//           showSnackBar(context, 'Invalid credentials');
//         }
//       } else {
//         httpErrorHandle(
//           response: res,
//           context: context,
//           onSuccess: () {
//             // Handle success if needed
//           },
//         );
//       }
//     } catch (e) {
//       showSnackBar(context, e.toString());
//     }
//   }
//
//   Future<void> updateProfilePicture({
//     required String userId,
//     required File? profilePicture,
//   }) async {
//     try {
//       if (profilePicture == null) {
//         // Handle case when no new profile picture is selected
//         return;
//       }
//
//       String apiUrl = '${Constants.uri}/api/updateProfilePicture/$userId';
//
//       var request = http.MultipartRequest('POST', Uri.parse(apiUrl))
//         ..files.add(await http.MultipartFile.fromPath('profilePicture', profilePicture.path));
//
//       var response = await request.send();
//
//       if (response.statusCode == 200) {
//         // Success, handle the response if needed
//         print('Profile picture updated successfully');
//       } else {
//         // Handle the error
//         print('Failed to update profile picture: ${response.reasonPhrase}');
//       }
//     } catch (e) {
//       // Handle exceptions
//       print('Error updating profile picture: $e');
//     }
//   }
//
//   // Get Certificate Information
//   Future<List<Certificate>> getCertificates({
//     required BuildContext context,
//     required String userId,
//   }) async {
//     try {
//       http.Response res = await http.get(
//         Uri.parse('${Constants.uri}/api/getCertificates/$userId'),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//       );
//
//       if (res.statusCode == 200) {
//         final List<dynamic> responseData = json.decode(res.body);
//         List<Certificate> certificates = responseData
//             .map((certificate) => Certificate.fromMap(certificate))
//             .toList();
//         return certificates;
//       } else {
//         httpErrorHandle(
//           response: res,
//           context: context,
//           onSuccess: () {
//             // Handle success if needed
//           },
//         );
//         return [];
//       }
//     } catch (e) {
//       showSnackBar(context, e.toString());
//       return [];
//     }
//   }
//
//   // Get Education Information
//   Future<List<Education>> getEducation({
//     required BuildContext context,
//     required String userId,
//   }) async {
//     try {
//       http.Response res = await http.get(
//         Uri.parse('${Constants.uri}/api/getEducation/$userId'),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//       );
//
//       if (res.statusCode == 200) {
//         final List<dynamic> responseData = json.decode(res.body);
//         List<Education> education = responseData
//             .map((edu) => Education.fromMap(edu))
//             .toList();
//         return education;
//       } else {
//         httpErrorHandle(
//           response: res,
//           context: context,
//           onSuccess: () {
//             // Handle success if needed
//           },
//         );
//         return [];
//       }
//     } catch (e) {
//       showSnackBar(context, e.toString());
//       return [];
//     }
//   }
//
//   // Get Skills Information
//   Future<List<Skill>> getSkills({
//     required BuildContext context,
//     required String userId,
//   }) async {
//     try {
//       http.Response res = await http.get(
//         Uri.parse('${Constants.uri}/api/getSkills/$userId'),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//       );
//
//       if (res.statusCode == 200) {
//         final List<dynamic> responseData = json.decode(res.body);
//         List<Skill> skills = responseData
//             .map((skill) => Skill.fromMap(skill))
//             .toList();
//         return skills;
//       } else {
//         httpErrorHandle(
//           response: res,
//           context: context,
//           onSuccess: () {
//             // Handle success if needed
//           },
//         );
//         return [];
//       }
//     } catch (e) {
//       showSnackBar(context, e.toString());
//       return [];
//     }
//   }
//
//   // Get Interests Information
//   Future<List<Interest>> getInterests({
//     required BuildContext context,
//     required String userId,
//   }) async {
//     try {
//       http.Response res = await http.get(
//         Uri.parse('${Constants.uri}/api/getInterests/$userId'),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//       );
//
//       if (res.statusCode == 200) {
//         final List<dynamic> responseData = json.decode(res.body);
//         List<Interest> interests = responseData
//             .map((interest) => Interest.fromMap(interest))
//             .toList();
//         return interests;
//       } else {
//         httpErrorHandle(
//           response: res,
//           context: context,
//           onSuccess: () {
//             // Handle success if needed
//           },
//         );
//         return [];
//       }
//     } catch (e) {
//       showSnackBar(context, e.toString());
//       return [];
//     }
//   }
//
//   // Update About Information
//   Future<void> updateAbout({
//     required BuildContext context,
//     required String userId,
//     required String about,
//   }) async {
//     try {
//       http.Response res = await http.put(
//         Uri.parse('${Constants.uri}/api/updateAbout/$userId'),
//         body: jsonEncode({
//           'about': about,
//         }),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//       );
//
//       httpErrorHandle(
//         response: res,
//         context: context,
//         onSuccess: () {
//           // Handle success if needed
//           showSnackBar(
//             context,
//             'About information updated successfully!',
//           );
//         },
//       );
//     } catch (e) {
//       showSnackBar(context, e.toString());
//     }
//   }
//
//   // Update Skill Information
//   Future<void> updateSkill({
//     required BuildContext context,
//     required String userId,
//     required String skillId,
//     required String skillName,
//     required String rating,
//   }) async {
//     try {
//       http.Response res = await http.put(
//         Uri.parse('${Constants.uri}/api/updateSkill/$userId/$skillId'),
//         body: jsonEncode({
//           'skillName': skillName,
//           'rating': rating,
//         }),
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
//             'Skill information updated successfully!',
//           );
//         },
//       );
//     } catch (e) {
//       showSnackBar(context, e.toString());
//     }
//   }
//
//   // Delete Skill Information
//   void deleteSkill({
//     required BuildContext context,
//     required String userId,
//     required String skillId,
//   }) async {
//     try {
//       http.Response res = await http.delete(
//         Uri.parse('${Constants.uri}/api/deleteSkill/$userId/$skillId'),
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
//             'Skill information deleted successfully!',
//           );
//         },
//       );
//     } catch (e) {
//       showSnackBar(context, e.toString());
//     }
//   }
//   // Update Interest Information
//   void updateInterest({
//     required BuildContext context,
//     required String userId,
//     required String interestId,
//     required String title,
//     required String description,
//   }) async {
//     try {
//       http.Response res = await http.put(
//         Uri.parse('${Constants.uri}/api/updateInterest/$userId/$interestId'),
//         body: jsonEncode({
//           'title': title,
//           'description': description,
//         }),
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
//             'Interest information updated successfully!',
//           );
//         },
//       );
//     } catch (e) {
//       showSnackBar(context, e.toString());
//     }
//   }
//
//   // Delete Interest Information
//   void deleteInterest({
//     required BuildContext context,
//     required String userId,
//     required String interestId,
//   }) async {
//     try {
//       http.Response res = await http.delete(
//         Uri.parse('${Constants.uri}/api/deleteInterest/$userId/$interestId'),
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
//             'Interest information deleted successfully!',
//           );
//         },
//       );
//     } catch (e) {
//       showSnackBar(context, e.toString());
//     }
//   }
//
//   // Update Certificate Information
//   void updateCertificate({
//     required BuildContext context,
//     required String userId,
//     required String certificateId,
//     required String certificateName,
//     required String certificateURL,
//     required String issueOrganization,
//   }) async {
//     try {
//       http.Response res = await http.put(
//         Uri.parse('${Constants.uri}/api/updateCertificate/$userId/$certificateId'),
//         body: jsonEncode({
//           'certificateName': certificateName,
//           'certificateURL': certificateURL,
//           'issueOrganization': issueOrganization,
//         }),
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
//             'Certificate information updated successfully!',
//           );
//         },
//       );
//     } catch (e) {
//       showSnackBar(context, e.toString());
//     }
//   }
//
//   // Delete Certificate Information
//   void deleteCertificate({
//     required BuildContext context,
//     required String userId,
//     required String certificateId,
//   }) async {
//     try {
//       http.Response res = await http.delete(
//         Uri.parse('${Constants.uri}/api/deleteCertificate/$userId/$certificateId'),
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
//             'Certificate information deleted successfully!',
//           );
//         },
//       );
//     } catch (e) {
//       showSnackBar(context, e.toString());
//     }
//   }
//
//
// }
import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:rive_animation/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:rive_animation/model/User1.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../providers/user_provider.dart';
import '../screens/Home/Button_Navigator.dart';
import '../screens/onboding/onboding_screen.dart';
import '../screens/profile/profile_page.dart';
import '../utils/Constants.dart';

class AuthService {
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String fullName ,
    String phoneNumber = '',
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
        fullName:fullName ,
        // firstName: firstName,
        // lastName: lastName,
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
    // required firstName ,
    // required lastName ,
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
          // 'firstName': firstName,
          // 'lastName': lastName,
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
    required DateTime startDate,
    required DateTime endDate, required educationId,
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
          fullName: '',
          // firstName: '',
          // lastName: '',
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
        fullName: '',
        // firstName: '',
        // lastName: '',
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
                // builder: (context) => ProfilePage(),
                builder: (context) => RootApp1(),
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

  // Get Certificate Information
  Future<List<Certificate>> getCertificates({
    required BuildContext context,
    required String userId,
  }) async {
    try {
      http.Response res = await http.get(
        Uri.parse('${Constants.uri}/api/getCertificates/$userId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (res.statusCode == 200) {
        final List<dynamic> responseData = json.decode(res.body);
        List<Certificate> certificates = responseData
            .map((certificate) => Certificate.fromMap(certificate))
            .toList();
        return certificates;
      } else {
        httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            // Handle success if needed
          },
        );
        return [];
      }
    } catch (e) {
      showSnackBar(context, e.toString());
      return [];
    }
  }

  // Get Education Information
  Future<List<Education>> getEducation({
    required BuildContext context,
    required String userId,
  }) async {
    try {
      http.Response res = await http.get(
        Uri.parse('${Constants.uri}/api/getEducation/$userId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (res.statusCode == 200) {
        final List<dynamic> responseData = json.decode(res.body);
        List<Education> education = responseData
            .map((edu) => Education.fromMap(edu))
            .toList();
        return education;
      } else {
        httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            // Handle success if needed
          },
        );
        return [];
      }
    } catch (e) {
      showSnackBar(context, e.toString());
      return [];
    }
  }

  // Get Skills Information
  Future<List<Skill>> getSkills({
    required BuildContext context,
    required String userId,
  }) async {
    try {
      http.Response res = await http.get(
        Uri.parse('${Constants.uri}/api/getSkills/$userId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (res.statusCode == 200) {
        final List<dynamic> responseData = json.decode(res.body);
        List<Skill> skills = responseData
            .map((skill) => Skill.fromMap(skill))
            .toList();
        return skills;
      } else {
        httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            // Handle success if needed
          },
        );
        return [];
      }
    } catch (e) {
      showSnackBar(context, e.toString());
      return [];
    }
  }

  // Get Interests Information
  Future<List<Interest>> getInterests({
    required BuildContext context,
    required String userId,
  }) async {
    try {
      http.Response res = await http.get(
        Uri.parse('${Constants.uri}/api/getInterests/$userId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (res.statusCode == 200) {
        final List<dynamic> responseData = json.decode(res.body);
        List<Interest> interests = responseData
            .map((interest) => Interest.fromMap(interest))
            .toList();
        return interests;
      } else {
        httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            // Handle success if needed
          },
        );
        return [];
      }
    } catch (e) {
      showSnackBar(context, e.toString());
      return [];
    }
  }

  // Update About Information
  Future<void> updateAbout({
    required BuildContext context,
    required String userId,
    required String about,
  }) async {
    try {
      http.Response res = await http.put(
        Uri.parse('${Constants.uri}/api/updateAbout/$userId'),
        body: jsonEncode({
          'about': about,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          // Handle success if needed
          showSnackBar(
            context,
            'About information updated successfully!',
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // Update Skill Information
  Future<void> updateSkill({
    required BuildContext context,
    required String userId,
    required String skillId,
    required String skillName,
    required String rating,
  }) async {
    try {
      http.Response res = await http.put(
        Uri.parse('${Constants.uri}/api/updateSkill/$userId/$skillId'),
        body: jsonEncode({
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
            'Skill information updated successfully!',
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // Delete Skill Information
  void deleteSkill({
    required BuildContext context,
    required String userId,
    required String skillId,
  }) async {
    try {
      http.Response res = await http.delete(
        Uri.parse('${Constants.uri}/api/deleteSkill/$userId/$skillId'),
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
            'Skill information deleted successfully!',
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
  // Update Interest Information
  void updateInterest({
    required BuildContext context,
    required String userId,
    required String interestId,
    required String title,
    required String description,
  }) async {
    try {
      http.Response res = await http.put(
        Uri.parse('${Constants.uri}/api/updateInterest/$userId/$interestId'),
        body: jsonEncode({
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
            'Interest information updated successfully!',
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // Delete Interest Information
  void deleteInterest({
    required BuildContext context,
    required String userId,
    required String interestId,
  }) async {
    try {
      http.Response res = await http.delete(
        Uri.parse('${Constants.uri}/api/deleteInterest/$userId/$interestId'),
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
            'Interest information deleted successfully!',
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // Update Certificate Information
  void updateCertificate({
    required BuildContext context,
    required String userId,
    required String certificateId,
    required String certificateName,
    required String certificateURL,
    required String issueOrganization,
  }) async {
    try {
      http.Response res = await http.put(
        Uri.parse('${Constants.uri}/api/updateCertificate/$userId/$certificateId'),
        body: jsonEncode({
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
            'Certificate information updated successfully!',
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // Delete Certificate Information
  void deleteCertificate({
    required BuildContext context,
    required String userId,
    required String certificateId,
  }) async {
    try {
      http.Response res = await http.delete(
        Uri.parse('${Constants.uri}/api/deleteCertificate/$userId/$certificateId'),
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
            'Certificate information deleted successfully!',
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }


}