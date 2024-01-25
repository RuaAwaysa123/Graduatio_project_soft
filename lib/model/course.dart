// import 'dart:convert';
//
// import 'User1.dart';
//
// class Course {
//   final String id;
//   final String name;
//   final List<String> topics;
//   final int prequests;
//   final List<String> majors;
//   final String location;
//   final bool isOnline;
//   final DateTime startDate;
//   final String time;
//   final String credential;
//   final double price;
//   final String trainer;
//   final List<User> applicants;
//   final List<User> acceptedApplicants;
//   final List<User> rejectedApplicants;
//   final double rate;
//   final bool isSociety;
//   final String organization;
//   final String image;
//
//   Course({
//     required this.id,
//     required this.name,
//     required this.topics,
//     required this.prequests,
//     required this.majors,
//     required this.location,
//     required this.isOnline,
//     required this.startDate,
//     required this.time,
//     required this.credential,
//     required this.price,
//     required this.trainer,
//     required this.applicants,
//     required this.acceptedApplicants,
//     required this.rejectedApplicants,
//     required this.rate,
//     required this.isSociety,
//     required this.organization,
//     required this.image,
//   });
//
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'name': name,
//       'topics': topics,
//       'prequests': prequests,
//       'majors': majors,
//       'location': location,
//       'isOnline': isOnline,
//       'startDate': startDate.toIso8601String(),
//       'time': time,
//       'credential': credential,
//       'price': price,
//       'trainer': trainer,
//       'applicants': applicants,
//       'acceptedApplicants': acceptedApplicants,
//       'rejectedApplicants': rejectedApplicants,
//       'rate': rate,
//       'isSociety': isSociety,
//       'organization': organization,
//       'image': image,
//     };
//   }
//
//   factory Course.fromMap(Map<String, dynamic> map) {
//     return Course(
//       id: map['_id'] ?? '',
//       name: map['name'] ?? '',
//       topics: List<String>.from(map['topics'] ?? []),
//       prequests: map['prequests'] ?? 0,
//       majors: List<String>.from(map['majors'] ?? []),
//       location: map['location'] ?? '',
//       isOnline: map['isOnline'] ?? false,
//       startDate: DateTime.parse(map['startDate']),
//       time: map['time'] ?? '',
//       credential: map['credential'] ?? '',
//       price: map['price'] ?? 0.0,
//       trainer: map['trainer'] ?? '',
//       applicants: (map['applicants'] as List<dynamic>?)
//           ?.map((user) => User.fromMap(user))
//           .toList() ??
//           [],
//       // acceptedApplicants: List<String>.from(map['acceptedApplicants'] ?? []),
//       acceptedApplicants: (map['applicants'] as List<dynamic>?)
//           ?.map((user) => User.fromMap(user))
//           .toList() ??
//           [],
//       // rejectedApplicants: List<String>.from(map['rejectedApplicants'] ?? []),
//       rejectedApplicants: (map['applicants'] as List<dynamic>?)
//           ?.map((user) => User.fromMap(user))
//           .toList() ??
//           [],
//       rate: map['rate'] ?? 0.0,
//       isSociety: map['isSociety'] ?? false,
//       organization: map['organization'] ?? '',
//       image: map['image'] ?? '',
//     );
//   }
//
//   String toJson() => json.encode(toMap());
//
//   factory Course.fromJson(String source) => Course.fromMap(json.decode(source));
// }
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
  final String time;
  final String credential;
  final double price;
  final String trainer;
  final List<User> applicants;
  final List<User> rejectedApplicants;
  final double rate;
  final bool isSociety;
  final String organization;
  final List<Session> sessions;
  final List<Rating> ratings;
  final String startTime;
  final String endTime;
  final List<String> days;
  final String image;
  final int maxnumof;

  Course({
    required this.id,
    required this.name,
    required this.topics,
    required this.prequests,
    required this.majors,
    required this.location,
    required this.isOnline,
    required this.startDate,
    required this.time,
    required this.credential,
    required this.price,
    required this.trainer,
    required this.applicants,
    required this.rejectedApplicants,
    required this.rate,
    required this.isSociety,
    required this.organization,
    required this.sessions,
    required this.ratings,
    required this.startTime,
    required this.endTime,
    required this.days,
    required this.image,
    required this.maxnumof,
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
      'time': time,
      'credential': credential,
      'price': price,
      'trainer': trainer,
      'applicants': applicants.map((user) => user.toMap()).toList(),
      'rejectedApplicants': rejectedApplicants.map((user) => user.toMap()).toList(),
      'rate': rate,
      'isSociety': isSociety,
      'organization': organization,
      'sessions': sessions.map((session) => session.toMap()).toList(),
      'ratings': ratings.map((rating) => rating.toMap()).toList(),
      'startTime': startTime,
      'endTime': endTime,
      'days': days,
      'image': image,
      'maxnumof': maxnumof,
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
      time: map['time'] ?? '',
      credential: map['credential'] ?? '',
      price: map['price'] ?? 0.0,
      trainer: map['trainer'] ?? '',
      applicants: (map['applicants'] as List<dynamic>?)
          ?.map((user) => User.fromMap(user))
          .toList() ??
          [],
      rejectedApplicants: (map['rejectedApplicants'] as List<dynamic>?)
          ?.map((user) => User.fromMap(user))
          .toList() ??
          [],
      rate: map['rate'] ?? 0.0,
      isSociety: map['isSociety'] ?? false,
      organization: map['organization'] ?? '',
      sessions: (map['sessions'] as List<dynamic>?)
          ?.map((session) => Session.fromMap(session))
          .toList() ??
          [],
      ratings: (map['ratings'] as List<dynamic>?)
          ?.map((rating) => Rating.fromMap(rating))
          .toList() ??
          [],
      startTime: map['startTime'] ?? '',
      endTime: map['endTime'] ?? '',
      days: List<String>.from(map['days'] ?? []),
      image: map['image'] ?? '',
      maxnumof: map['maxnumof'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Course.fromJson(String source) => Course.fromMap(json.decode(source));
}

class Session {
  final DateTime sessionDate;
  final List<Attendance> attendance;

  Session({
    required this.sessionDate,
    required this.attendance,
  });

  Map<String, dynamic> toMap() {
    return {
      'sessionDate': sessionDate.toIso8601String(),
      'attendance': attendance.map((a) => a.toMap()).toList(),
    };
  }

  factory Session.fromMap(Map<String, dynamic> map) {
    return Session(
      sessionDate: DateTime.parse(map['sessionDate']),
      attendance: (map['attendance'] as List<dynamic>?)
          ?.map((a) => Attendance.fromMap(a))
          .toList() ??
          [],
    );
  }
}

class Attendance {
  final String userId;
  final bool attended;

  Attendance({
    required this.userId,
    required this.attended,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'attended': attended,
    };
  }

  factory Attendance.fromMap(Map<String, dynamic> map) {
    return Attendance(
      userId: map['userId'] ?? '',
      attended: map['attended'] ?? false,
    );
  }
}

class Rating {
  final String societyId;
  final double rating;

  Rating({
    required this.societyId,
    required this.rating,
  });

  Map<String, dynamic> toMap() {
    return {
      'societyId': societyId,
      'rating': rating,
    };
  }

  factory Rating.fromMap(Map<String, dynamic> map) {
    return Rating(
      societyId: map['societyId'] ?? '',
      rating: map['rating'] ?? 0.0,
    );
  }
}
