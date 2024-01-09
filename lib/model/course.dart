import 'dart:convert';

import 'User1.dart';

class Course {
  final String id;
  final String name;
  final List<String> topics;
  final int prequests;
  final List<String> majors;
  final String location;
  final bool isOnline;
  final DateTime startDate;
  final DateTime endDate;
  final String time;
  final String credential;
  final double price;
  final String trainer;
  final List<User> applicants;
  final List<User> acceptedApplicants;
  final List<User> rejectedApplicants;
  final double rate;
  final bool isSociety;
  final String organization;
  final String image;

  Course({
    required this.id,
    required this.name,
    required this.topics,
    required this.prequests,
    required this.majors,
    required this.location,
    required this.isOnline,
    required this.startDate,
    required this.endDate,
    required this.time,
    required this.credential,
    required this.price,
    required this.trainer,
    required this.applicants,
    required this.acceptedApplicants,
    required this.rejectedApplicants,
    required this.rate,
    required this.isSociety,
    required this.organization,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'topics': topics,
      'prequests': prequests,
      'majors': majors,
      'location': location,
      'isOnline': isOnline,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'time': time,
      'credential': credential,
      'price': price,
      'trainer': trainer,
      'applicants': applicants,
      'acceptedApplicants': acceptedApplicants,
      'rejectedApplicants': rejectedApplicants,
      'rate': rate,
      'isSociety': isSociety,
      'organization': organization,
      'image': image,
    };
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      topics: List<String>.from(map['topics'] ?? []),
      prequests: map['prequests'] ?? 0,
      majors: List<String>.from(map['majors'] ?? []),
      location: map['location'] ?? '',
      isOnline: map['isOnline'] ?? false,
      startDate: DateTime.parse(map['startDate']),
      endDate: DateTime.parse(map['endDate']),
      time: map['time'] ?? '',
      credential: map['credential'] ?? '',
      price: map['price'] ?? 0.0,
      trainer: map['trainer'] ?? '',
      applicants: (map['applicants'] as List<dynamic>?)
          ?.map((user) => User.fromMap(user))
          .toList() ??
          [],
      // acceptedApplicants: List<String>.from(map['acceptedApplicants'] ?? []),
      acceptedApplicants: (map['applicants'] as List<dynamic>?)
          ?.map((user) => User.fromMap(user))
          .toList() ??
          [],
      // rejectedApplicants: List<String>.from(map['rejectedApplicants'] ?? []),
      rejectedApplicants: (map['applicants'] as List<dynamic>?)
          ?.map((user) => User.fromMap(user))
          .toList() ??
          [],
      rate: map['rate'] ?? 0.0,
      isSociety: map['isSociety'] ?? false,
      organization: map['organization'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Course.fromJson(String source) => Course.fromMap(json.decode(source));
}
