// // import 'dart:convert';
// //
// // class user {
// //   final String id;
// //   final String name;
// //   final String email;
// //   final String token;
// //   final String password;
// //   user({
// //     required this.id,
// //     required this.name,
// //     required this.email,
// //     required this.token,
// //     required this.password,
// //   });
// //
// //   Map<String, dynamic> toMap() {
// //     return {
// //       'name': name,
// //       'email': email,
// //       'token': token,
// //       'password': password,
// //     };
// //   }
// //
// //   factory user.fromMap(Map<String, dynamic> map) {
// //     return user(
// //       id: map['_id'] ?? '',
// //       name: map['name'] ?? '',
// //       email: map['email'] ?? '',
// //       token: map['token'] ?? '',
// //       password: map['password'] ?? '',
// //     );
// //   }
// //
// //   String toJson() => json.encode(toMap());
// //
// //   factory user.fromJson(String source) => user.fromMap(json.decode(source));
// //
// // }
//
// import 'dart:convert';
//
// class User {
//   final String id;
//  // final String name;
//   final String email;
//   final String token;
//   final String password;
//   User({
//     required this.id,
//    // required this.name,
//     required this.email,
//     required this.token,
//     required this.password,
//   });
//
//   Map<String, dynamic> toMap() {
//     return {
//      // 'name': name,
//       'email': email,
//       'token': token,
//       'password': password,
//     };
//   }
//
//   factory User.fromMap(Map<String, dynamic> map) {
//     return User(
//       id: map['_id'] ?? '',
//      // name: map['name'] ?? '',
//       email: map['email'] ?? '',
//       token: map['token'] ?? '',
//       password: map['password'] ?? '',
//     );
//   }
//
//   String toJson() => json.encode(toMap());
//
//   factory User.fromJson(String source) => User.fromMap(json.decode(source));
// }

import 'dart:convert';

class User {
  final String id;
  final String email;
  final String token;
  final String password;
  final String phoneNumber;
  final String firstName;
  final String lastName;
  final String location;
  final String universityNumber;
  final String major;
  final String year;

  User({
    required this.id,
    required this.email,
    required this.token,
    required this.password,
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
    required this.location,
    required this.universityNumber,
    required this.major,
    required this.year,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'token': token,
      'password': password,
      'phoneNumber': phoneNumber,
      'firstName': firstName,
      'lastName': lastName,
      'location': location,
      'universityNumber': universityNumber,
      'major': major,
      'year': year,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      email: map['email'] ?? '',
      token: map['token'] ?? '',
      password: map['password'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      location: map['location'] ?? '',
      universityNumber: map['universityNumber'] ?? '',
      major: map['major'] ?? '',
      year: map['year'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
