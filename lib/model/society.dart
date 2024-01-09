// import 'dart:convert';
//
// class Society {
//   final String id;
//   final String name;
//   final String email;
//   final String password;
//   final List<String> members;
//   final List<String> followers;
//   final List<String> events;
//   final String location;
//   final String mission;
//   final String vision;
//   final List<String> courses;
//   final List<String> recommendedTopics;
//   final DateTime joinRequestsOpenDate;
//   final DateTime membershipRequestsOpenDate;
//   final double rate;
//   final String imgUrl;
//
//   Society({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.password,
//     required this.members,
//     required this.followers,
//     required this.events,
//     required this.location,
//     required this.mission,
//     required this.vision,
//     required this.courses,
//     required this.recommendedTopics,
//     required this.joinRequestsOpenDate,
//     required this.membershipRequestsOpenDate,
//     required this.rate,
//     required this.imgUrl,
//   });
//
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'name': name,
//       'email': email,
//       'password': password,
//       'members': members,
//       'followers': followers,
//       'events': events,
//       'location': location,
//       'mission': mission,
//       'vision': vision,
//       'courses': courses,
//       'recommendedTopics': recommendedTopics,
//       'joinRequestsOpenDate': joinRequestsOpenDate.toIso8601String(),
//       'membershipRequestsOpenDate': membershipRequestsOpenDate.toIso8601String(),
//       'rate': rate,
//       'imgUrl': imgUrl,
//     };
//   }
//
//   factory Society.fromMap(Map<String, dynamic> map) {
//     return Society(
//       id: map['_id'] ?? '',
//       name: map['name'] ?? '',
//       email: map['email'] ?? '',
//       password: map['password'] ?? '',
//       members: List<String>.from(map['members'] ?? []),
//       followers: List<String>.from(map['followers'] ?? []),
//       events: List<String>.from(map['events'] ?? []),
//       location: map['location'] ?? '',
//       mission: map['mission'] ?? '',
//       vision: map['vision'] ?? '',
//       courses: List<String>.from(map['courses'] ?? []),
//       recommendedTopics: List<String>.from(map['recommendedTopics'] ?? []),
//       joinRequestsOpenDate: DateTime.parse(map['joinRequestsOpenDate']),
//       membershipRequestsOpenDate: DateTime.parse(map['membershipRequestsOpenDate']),
//       rate: map['rate'] ?? 0.0,
//       imgUrl: map['imgUrl'] ?? '',
//     );
//   }
//
//   String toJson() => json.encode(toMap());
//
//   factory Society.fromJson(String source) => Society.fromMap(json.decode(source));
// }
import 'dart:convert';
import 'dart:html';
import 'event.dart';
import 'User1.dart';
import 'course.dart';

class Society {
  final String id;
  final String name;
  final String email;
  final String password;
  final List<User> members;
  final List<User> followers;
  final List<Event> events;
  final String location;
  final String mission;
  final String vision;
  final List<Course> courses;
  final List<String> recommendedTopics;
  final DateTime joinRequestsOpenDate;
  final DateTime membershipRequestsOpenDate;
  final double rate;
  final String imgUrl;

  Society({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.members,
    required this.followers,
    required this.events,
    required this.location,
    required this.mission,
    required this.vision,
    required this.courses,
    required this.recommendedTopics,
    required this.joinRequestsOpenDate,
    required this.membershipRequestsOpenDate,
    required this.rate,
    required this.imgUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'members': members.map((user) => user.toMap()).toList(),
      'followers': followers.map((user) => user.toMap()).toList(),
      'events': events.map((event) => event.toMap()).toList(), // Use event.toMap() here
      'location': location,
      'mission': mission,
      'vision': vision,
      'courses': courses.map((course) => course.toMap()).toList(),
      'recommendedTopics': recommendedTopics,
      'joinRequestsOpenDate': joinRequestsOpenDate.toIso8601String(),
      'membershipRequestsOpenDate': membershipRequestsOpenDate.toIso8601String(),
      'rate': rate,
      'imgUrl': imgUrl,
    };
  }


  factory Society.fromMap(Map<String, dynamic> map) {
    return Society(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      members: (map['members'] as List<dynamic>?)
          ?.map((user) => User.fromMap(user))
          .toList() ??
          [],
      followers: (map['followers'] as List<dynamic>?)
          ?.map((user) => User.fromMap(user))
          .toList() ??
          [],
      events: (map['events'] as List<dynamic>?)
          ?.map((event) => Event.fromMap(event))
          .toList() ??
          [],
      location: map['location'] ?? '',
      mission: map['mission'] ?? '',
      vision: map['vision'] ?? '',
      courses: (map['courses'] as List<dynamic>?)
          ?.map((course) => Course.fromMap(course))
          .toList() ??
          [],
      recommendedTopics: List<String>.from(map['recommendedTopics'] ?? []),
      joinRequestsOpenDate: DateTime.parse(map['joinRequestsOpenDate']),
      membershipRequestsOpenDate: DateTime.parse(map['membershipRequestsOpenDate']),
      rate: map['rate'] ?? 0.0,
      imgUrl: map['imgUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Society.fromJson(String source) => Society.fromMap(json.decode(source));
}

