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

      final responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        // Save society ID in shared preferences or a constant accessible from all pages
        final societyId = responseData['societyId']; // Assuming the API returns the societyId
        _saveSocietyId(societyId);

        return {'success': true, 'message': 'Society logged in successfully'};
      } else {
        return {'success': false, 'message': responseData['msg'] ?? 'Error logging in society'};
      }
    } catch (e) {
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
}

