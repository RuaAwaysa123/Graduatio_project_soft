import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/Constants.dart';

class SocietyAuthService {
   static String baseUrl = Constants.uri ;// Replace with your API base URL

  // Future<Map<String, dynamic>> signUpSociety({
  //   required String name,
  //   required String email,
  //   required String password,
  // }) async {
  //   final url = Uri.parse('${Constants.uri}/api/signup_society');
  //
  //   try {
  //     final response = await http.post(
  //       url,
  //       headers: {'Content-Type': 'application/json'},
  //       body: jsonEncode({
  //         'name': name,
  //         'email': email,
  //         'password': password,
  //       }),
  //     );
  //
  //     final responseData = json.decode(response.body);
  //
  //     if (response.statusCode == 200) {
  //       return {'success': true, 'message': 'Society signed up successfully'};
  //     } else {
  //       return {'success': false, 'message': responseData['error'] ?? 'Error signing up society'};
  //     }
  //   } catch (e) {
  //     return {'success': false, 'message': 'Error signing up society: $e'};
  //   }
  // }
   Future<Map<String, dynamic>> signUpSociety({
     required String name,
     required String email,
     required String password,
   }) async {
     final url = Uri.parse('$baseUrl/api/signup_society');

     try {
       final response = await http.post(
         url,
         headers: {'Content-Type': 'application/json'},
         body: jsonEncode({
           'name': name,
           'email': email,
           'password': password,
         }),
       );

       final responseData = json.decode(response.body);

       if (response.statusCode == 200) {
         final societyId = responseData['_id']; // Use the correct field for societyId
         _saveSocietyId(societyId); // Save societyId to shared preferences

         return {
           'success': true,
           'message': 'Society signed up successfully',
           'societyId': societyId,
         };
       } else {
         return {'success': false, 'message': responseData['error'] ?? 'Error signing up society'};
       }
     } catch (e) {
       return {'success': false, 'message': 'Error signing up society: $e'};
     }
   }


   Future<Map<String, dynamic>> signUpSocietyStep2({
    required String societyId,
    required String mission,
    required String vision,
    required String location,
  }) async {
    final url = Uri.parse('$baseUrl/api/signup_society_step2/$societyId');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'mission': mission,
          'vision': vision,
          'location': location,
        }),
      );

      final responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        return {'success': true, 'message': 'Society information updated successfully'};
      } else {
        return {'success': false, 'message': responseData['error'] ?? 'Error updating society information'};
      }
    } catch (e) {
      return {'success': false, 'message': 'Error updating society information: $e'};
    }
  }


  // Future<Map<String, dynamic>> loginSociety({
  //   required String email,
  //   required String password,
  // }) async {
  //   final url = Uri.parse('$baseUrl/api/login_society');
  //
  //   try {
  //     final response = await http.post(
  //       url,
  //       headers: {'Content-Type': 'application/json'},
  //       body: jsonEncode({
  //         'email': email,
  //         'password': password,
  //       }),
  //     );
  //
  //     final responseData = json.decode(response.body);
  //
  //     if (response.statusCode == 200) {
  //       // Save society ID in shared preferences or a constant accessible from all pages
  //       final societyId = responseData['_id']; // Assuming the API returns the societyId
  //       _saveSocietyId(societyId);
  //
  //       return {'success': true, 'message': 'Society logged in successfully'};
  //     } else {
  //       return {'success': false, 'message': responseData['msg'] ?? 'Error logging in society'};
  //     }
  //   } catch (e) {
  //     return {'success': false, 'message': 'Error logging in society: $e'};
  //   }
  // }
   Future<Map<String, dynamic>> loginSociety({
     required String email,
     required String password,
   }) async {
     final url = Uri.parse('$baseUrl/api/login_society');

     try {
       final response = await http.post(
         url,
         headers: {'Content-Type': 'application/json'},
         body: jsonEncode({
           'email': email,
           'password': password,
         }),
       );

       print('Response Body: ${response.body}'); // Add this line for debugging

       final responseData = json.decode(response.body);

       if (response.statusCode == 200) {
         // Save society ID in shared preferences or a constant accessible from all pages
         final societyId = responseData['_id'] ?? ''; // Assuming the API returns the societyId
         _saveSocietyId(societyId);

         return {'success': true, 'message': 'Society logged in successfully'};
       } else {
         return {'success': false, 'message': responseData['msg'] ?? 'Error logging in society'};
       }
     } catch (e) {
       print('Error logging in society: $e');
       return {'success': false, 'message': 'Error logging in society: $e'};
     }
   }

  // Function to save society ID in shared preferences
  Future<void> _saveSocietyId(String societyId) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('societyId', societyId);
  }

  // Function to get society ID from shared preferences
  Future<String?> getSocietyId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('societyId');
  }

   Future<Map<String, dynamic>> uploadSocietyImage({
     required String societyId,
     required File imageFile,
   }) async {
     final url = Uri.parse('$baseUrl/api/upload_society_image/$societyId');

     try {
       final request = http.MultipartRequest('POST', url)
         ..files.add(
           http.MultipartFile.fromBytes(
             'image',
             await File(imageFile.path).readAsBytes(),
             filename: 'society_image.jpg',
           ),
         );

       final response = await request.send();

       if (response.statusCode == 200) {
         return {'success': true, 'message': 'Society image uploaded successfully'};
       } else {
         return {'success': false, 'message': 'Error uploading society image'};
       }
     } catch (e) {
       return {'success': false, 'message': 'Error uploading society image: $e'};
     }
   }
   Future<Map<String, dynamic>> createEvent({
     required String societyId,
     required String name,
     required List<String> topics,
     required List<String> majors,
     required String location,
     required bool isOnline,
     required DateTime dateTime,
     required double price,
     required List<String> audience,
     required String description,
     required File imageFile,
   }) async {
     final url = Uri.parse('$baseUrl/api/create_event/$societyId');

     try {
       final request = http.MultipartRequest('POST', url)
         ..fields.addAll({
           'name': name,
           'topics': jsonEncode(topics),
           'majors': jsonEncode(majors),
           'location': location,
           'isOnline': isOnline.toString(),
           'dateTime': dateTime.toIso8601String(),
           'price': price.toString(),
           'audience': jsonEncode(audience),
           'description': description,
         })
         ..files.add(
           http.MultipartFile.fromBytes(
             'image',
             await File(imageFile.path).readAsBytes(),
             filename: 'event_image.jpg',
           ),
         );

       final response = await request.send();

       if (response.statusCode == 200) {
         return {'success': true, 'message': 'Event created successfully'};
       } else {
         return {'success': false, 'message': 'Error creating event'};
       }
     } catch (e) {
       return {'success': false, 'message': 'Error creating event: $e'};
     }
   }

   //Update event
   Future<Map<String, dynamic>> updateEvent({
     required String societyId,
     required String eventId,
     required String name,
     required List<String> topics,
     required List<String> majors,
     required String location,
     required bool isOnline,
     required DateTime dateTime,
     required double price,
     required List<String> audience,
     required String description,
     required File imageFile,
   }) async {
     final url = Uri.parse('$baseUrl/api/update_event/$societyId/$eventId');

     try {
       final request = http.MultipartRequest('POST', url)
         ..fields.addAll({
           'name': name,
           'topics': jsonEncode(topics),
           'majors': jsonEncode(majors),
           'location': location,
           'isOnline': isOnline.toString(),
           'dateTime': dateTime.toIso8601String(),
           'price': price.toString(),
           'audience': jsonEncode(audience),
           'description': description,
         })
         ..files.add(
           http.MultipartFile.fromBytes(
             'image',
             await File(imageFile.path).readAsBytes(),
             filename: 'event_image.jpg',
           ),
         );

       final response = await request.send();

       if (response.statusCode == 200) {
         return {'success': true, 'message': 'Event updated successfully'};
       } else {
         return {'success': false, 'message': 'Error updating event'};
       }
     } catch (e) {
       return {'success': false, 'message': 'Error updating event: $e'};
     }
   }
// delete event
  Future<Map<String, dynamic>> deleteEvent({
    required String societyId,
    required String eventId,
  }) async {
    final url = Uri.parse('$baseUrl/api/delete_event/$societyId/$eventId');

    try {
      final response = await http.delete(url);

      if (response.statusCode == 200) {
        return {'success': true, 'message': 'Event deleted successfully'};
      } else {
        return {'success': false, 'message': 'Error deleting event'};
      }
    } catch (e) {
      return {'success': false, 'message': 'Error deleting event: $e'};
    }
  }
// creat course
  Future<Map<String, dynamic>> createCourse({
    required String societyId,
    required String name,
    required List<String> topics,
    required int prequisites,
    required List<String> majors,
    required String location,
    required bool isOnline,
    required DateTime startDate,
    required DateTime endDate,
    required String time,
    required String credential,
    required double price,
    required String trainer,
    required File imageFile,
  }) async {
    final url = Uri.parse('$baseUrl/api/create_course/$societyId');

    try {
      final request = http.MultipartRequest('POST', url)
        ..fields.addAll({
          'name': name,
          'topics': jsonEncode(topics),
          'prequisites': prequisites.toString(),
          'majors': jsonEncode(majors),
          'location': location,
          'isOnline': isOnline.toString(),
          'startDate': startDate.toIso8601String(),
          'endDate': endDate.toIso8601String(),
          'time': time,
          'credential': credential,
          'price': price.toString(),
          'trainer': trainer,
        })
        ..files.add(
          http.MultipartFile.fromBytes(
            'image',
            await File(imageFile.path).readAsBytes(),
            filename: 'course_image.jpg',
          ),
        );

      final response = await request.send();

      if (response.statusCode == 200) {
        return {'success': true, 'message': 'Course created successfully'};
      } else {
        return {'success': false, 'message': 'Error creating course'};
      }
    } catch (e) {
      return {'success': false, 'message': 'Error creating course: $e'};
    }
  }
//update course
  Future<Map<String, dynamic>> updateCourse({
    required String societyId,
    required String courseId,
    required String name,
    required List<String> topics,
    required int prequisites,
    required List<String> majors,
    required String location,
    required bool isOnline,
    required DateTime startDate,
    required DateTime endDate,
    required String time,
    required String credential,
    required double price,
    required String trainer,
    required File imageFile,
  }) async {
    final url = Uri.parse('$baseUrl/api/update_course/$societyId/$courseId');

    try {
      final request = http.MultipartRequest('POST', url)
        ..fields.addAll({
          'name': name,
          'topics': jsonEncode(topics),
          'prequisites': prequisites.toString(),
          'majors': jsonEncode(majors),
          'location': location,
          'isOnline': isOnline.toString(),
          'startDate': startDate.toIso8601String(),
          'endDate': endDate.toIso8601String(),
          'time': time,
          'credential': credential,
          'price': price.toString(),
          'trainer': trainer,
        })
        ..files.add(
          http.MultipartFile.fromBytes(
            'image',
            await File(imageFile.path).readAsBytes(),
            filename: 'course_image.jpg',
          ),
        );

      final response = await request.send();

      if (response.statusCode == 200) {
        return {'success': true, 'message': 'Course updated successfully'};
      } else {
        return {'success': false, 'message': 'Error updating course'};
      }
    } catch (e) {
      return {'success': false, 'message': 'Error updating course: $e'};
    }
  }

  // delete course
  Future<Map<String, dynamic>> deleteCourse({
    required String societyId,
    required String courseId,
  }) async {
    final url = Uri.parse('$baseUrl/api/delete_course/$societyId/$courseId');

    try {
      final response = await http.delete(url);

      if (response.statusCode == 200) {
        return {'success': true, 'message': 'Course deleted successfully'};
      } else {
        return {'success': false, 'message': 'Error deleting course'};
      }
    } catch (e) {
      return {'success': false, 'message': 'Error deleting course: $e'};
    }
  }

}

