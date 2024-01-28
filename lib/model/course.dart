// // // import 'dart:convert';
// // //
// // // import 'User1.dart';
// // //
// // // class Course {
// // //   final String id;
// // //   final String name;
// // //   final List<String> topics;
// // //   final int prequests;
// // //   final List<String> majors;
// // //   final String location;
// // //   final bool isOnline;
// // //   final DateTime startDate;
// // //   final String time;
// // //   final String credential;
// // //   final double price;
// // //   final String trainer;
// // //   final List<User> applicants;
// // //   final List<User> acceptedApplicants;
// // //   final List<User> rejectedApplicants;
// // //   final double rate;
// // //   final bool isSociety;
// // //   final String organization;
// // //   final String image;
// // //
// // //   Course({
// // //     required this.id,
// // //     required this.name,
// // //     required this.topics,
// // //     required this.prequests,
// // //     required this.majors,
// // //     required this.location,
// // //     required this.isOnline,
// // //     required this.startDate,
// // //     required this.time,
// // //     required this.credential,
// // //     required this.price,
// // //     required this.trainer,
// // //     required this.applicants,
// // //     required this.acceptedApplicants,
// // //     required this.rejectedApplicants,
// // //     required this.rate,
// // //     required this.isSociety,
// // //     required this.organization,
// // //     required this.image,
// // //   });
// // //
// // //   Map<String, dynamic> toMap() {
// // //     return {
// // //       'id': id,
// // //       'name': name,
// // //       'topics': topics,
// // //       'prequests': prequests,
// // //       'majors': majors,
// // //       'location': location,
// // //       'isOnline': isOnline,
// // //       'startDate': startDate.toIso8601String(),
// // //       'time': time,
// // //       'credential': credential,
// // //       'price': price,
// // //       'trainer': trainer,
// // //       'applicants': applicants,
// // //       'acceptedApplicants': acceptedApplicants,
// // //       'rejectedApplicants': rejectedApplicants,
// // //       'rate': rate,
// // //       'isSociety': isSociety,
// // //       'organization': organization,
// // //       'image': image,
// // //     };
// // //   }
// // //
// // //   factory Course.fromMap(Map<String, dynamic> map) {
// // //     return Course(
// // //       id: map['_id'] ?? '',
// // //       name: map['name'] ?? '',
// // //       topics: List<String>.from(map['topics'] ?? []),
// // //       prequests: map['prequests'] ?? 0,
// // //       majors: List<String>.from(map['majors'] ?? []),
// // //       location: map['location'] ?? '',
// // //       isOnline: map['isOnline'] ?? false,
// // //       startDate: DateTime.parse(map['startDate']),
// // //       time: map['time'] ?? '',
// // //       credential: map['credential'] ?? '',
// // //       price: map['price'] ?? 0.0,
// // //       trainer: map['trainer'] ?? '',
// // //       applicants: (map['applicants'] as List<dynamic>?)
// // //           ?.map((user) => User.fromMap(user))
// // //           .toList() ??
// // //           [],
// // //       // acceptedApplicants: List<String>.from(map['acceptedApplicants'] ?? []),
// // //       acceptedApplicants: (map['applicants'] as List<dynamic>?)
// // //           ?.map((user) => User.fromMap(user))
// // //           .toList() ??
// // //           [],
// // //       // rejectedApplicants: List<String>.from(map['rejectedApplicants'] ?? []),
// // //       rejectedApplicants: (map['applicants'] as List<dynamic>?)
// // //           ?.map((user) => User.fromMap(user))
// // //           .toList() ??
// // //           [],
// // //       rate: map['rate'] ?? 0.0,
// // //       isSociety: map['isSociety'] ?? false,
// // //       organization: map['organization'] ?? '',
// // //       image: map['image'] ?? '',
// // //     );
// // //   }
// // //
// // //   String toJson() => json.encode(toMap());
// // //
// // //   factory Course.fromJson(String source) => Course.fromMap(json.decode(source));
// // // }
// // import 'dart:convert';
// // import 'User1.dart';
// // class Course {
// //   final String id;
// //   final String name;
// //   final List<String> topics;
// //   final List<String> prequests;
// //   final List<String> majors;
// //   final String location;
// //   final bool isOnline;
// //   final DateTime startDate;
// //   final String time;
// //   final String credential;
// //   final double price;
// //   final String trainer;
// //   final List<User> applicants;
// //   final List<User> rejectedApplicants;
// //   final double rate;
// //   final bool isSociety;
// //   final String organization;
// //   final List<Session> sessions;
// //   final List<Rating> ratings;
// //   final String startTime;
// //   final String endTime;
// //   final List<String> days;
// //   final String image;
// //   final int maxnumofstudent;
// //
// //   Course({
// //     required this.id,
// //     required this.name,
// //     required this.topics,
// //     required this.prequests,
// //     required this.majors,
// //     required this.location,
// //     required this.isOnline,
// //     required this.startDate,
// //     required this.time,
// //     required this.credential,
// //     required this.price,
// //     required this.trainer,
// //     required this.applicants,
// //     required this.rejectedApplicants,
// //     required this.rate,
// //     required this.isSociety,
// //     required this.organization,
// //     required this.sessions,
// //     required this.ratings,
// //     required this.startTime,
// //     required this.endTime,
// //     required this.days,
// //     required this.image,
// //     required this.maxnumofstudent,
// //   });
// //
// //   Map<String, dynamic> toMap() {
// //     return {
// //       'id': id,
// //       'name': name,
// //       'topics': topics,
// //       'prequests': prequests,
// //       'majors': majors,
// //       'location': location,
// //       'isOnline': isOnline,
// //       'startDate': startDate.toIso8601String(),
// //       'time': time,
// //       'credential': credential,
// //       'price': price,
// //       'trainer': trainer,
// //       'applicants': applicants.map((user) => user.toMap()).toList(),
// //       'rejectedApplicants': rejectedApplicants.map((user) => user.toMap()).toList(),
// //       'rate': rate,
// //       'isSociety': isSociety,
// //       'organization': organization,
// //       'sessions': sessions.map((session) => session.toMap()).toList(),
// //       'ratings': ratings.map((rating) => rating.toMap()).toList(),
// //       'startTime': startTime,
// //       'endTime': endTime,
// //       'days': days,
// //       // 'days': jsonEncode(days),
// //       'image': image,
// //       'maxnumofstudent': maxnumofstudent,
// //     };
// //   }
// //
// //   factory Course.fromMap(Map<String, dynamic> map) {
// //     return Course(
// //       id: map['_id'] ?? '',
// //       name: map['name'] ?? '',
// //       // topics: List<String>.from(map['topics'] ?? []),
// //       // prequests: map['prequests'] ?? 0,
// //       // majors: List<String>.from(map['majors'] ?? []),
// //       topics: (map['topics'] as List<dynamic>?)
// //           ?.map((dynamic topic) => topic.toString())
// //           .toList() ??
// //           [],
// //
// //       prequests: (map['prequests'] as List<dynamic>?)
// //           ?.map((dynamic prerequisite) => prerequisite.toString())
// //           .toList() ??
// //           [],
// //
// //       majors: (map['majors'] as List<dynamic>?)
// //           ?.map((dynamic major) => major.toString())
// //           .toList() ??
// //           [],
// //       location: map['location'] ?? '',
// //       isOnline: map['isOnline'] ?? false,
// //       startDate: DateTime.parse(map['startDate']),
// //       time: map['time'] ?? '',
// //       credential: map['credential'] ?? '',
// //       // price: (map['price'] as num?)?.toDouble() ?? 0.0,
// //       price: (map['price'] as num?)?.toDouble() ?? 0.0,
// //
// //       trainer: map['trainer'] ?? '',
// //       applicants: (map['applicants'] as List<dynamic>?)
// //           ?.map((user) => User.fromMap(user))
// //           .toList() ??
// //           [],
// //       rejectedApplicants: (map['rejectedApplicants'] as List<dynamic>?)
// //           ?.map((user) => User.fromMap(user))
// //           .toList() ??
// //           [],
// //       rate: map['rate'] ?? 0.0,
// //       isSociety: map['isSociety'] ?? false,
// //       organization: map['organization'] ?? '',
// //       sessions: (map['sessions'] as List<dynamic>?)
// //           ?.map((session) => Session.fromMap(session))
// //           .toList() ??
// //           [],
// //       ratings: (map['ratings'] as List<dynamic>?)
// //           ?.map((rating) => Rating.fromMap(rating))
// //           .toList() ??
// //           [],
// //       startTime: map['startTime'] ?? '',
// //       endTime: map['endTime'] ?? '',
// //       days: List<String>.from(map['days'] ?? []),
// //       image: map['image'] ?? '',
// //       maxnumofstudent: map['maxnumofstudent'] ?? 0,
// //     );
// //   }
// //
// //   String toJson() => json.encode(toMap());
// //
// //   // factory Course.fromJson(String source) => Course.fromMap(json.decode(source));
// //   factory Course.fromJson(String source) => Course.fromMap(json.decode(source));
// //
// // }
// //
// //
// // class Session {
// //   final DateTime sessionDate;
// //   final List<Attendance> attendance;
// //
// //   Session({
// //     required this.sessionDate,
// //     required this.attendance,
// //   });
// //
// //   Map<String, dynamic> toMap() {
// //     return {
// //       'sessionDate': sessionDate.toIso8601String(),
// //       'attendance': attendance.map((a) => a.toMap()).toList(),
// //     };
// //   }
// //
// //   factory Session.fromMap(Map<String, dynamic> map) {
// //     return Session(
// //       sessionDate: DateTime.parse(map['sessionDate']),
// //       attendance: (map['attendance'] as List<dynamic>?)
// //           ?.map((a) => Attendance.fromMap(a))
// //           .toList() ??
// //           [],
// //     );
// //   }
// // }
// //
// // class Attendance {
// //   final String userId;
// //   final bool attended;
// //
// //   Attendance({
// //     required this.userId,
// //     required this.attended,
// //   });
// //
// //   Map<String, dynamic> toMap() {
// //     return {
// //       'userId': userId,
// //       'attended': attended,
// //     };
// //   }
// //
// //   factory Attendance.fromMap(Map<String, dynamic> map) {
// //     return Attendance(
// //       userId: map['userId'] ?? '',
// //       attended: map['attended'] ?? false,
// //     );
// //   }
// // }
// //
// // class Rating {
// //   final String societyId;
// //   final double rating;
// //
// //   Rating({
// //     required this.societyId,
// //     required this.rating,
// //   });
// //
// //   Map<String, dynamic> toMap() {
// //     return {
// //       'societyId': societyId,
// //       'rating': rating,
// //     };
// //   }
// //
// //   factory Rating.fromMap(Map<String, dynamic> map) {
// //     return Rating(
// //       societyId: map['societyId'] ?? '',
// //       // rating: map['rating'] ?? 0.0,
// //       rating: (map['rating'] as num?)?.toDouble() ?? 0.0,
// //     );
// //   }
// // }
// // import 'dart:convert';
// //
// // import 'User1.dart';
// //
// // class Course {
// //   final String id;
// //   final String name;
// //   final List<String> topics;
// //   final int prequests;
// //   final List<String> majors;
// //   final String location;
// //   final bool isOnline;
// //   final DateTime startDate;
// //   final String time;
// //   final String credential;
// //   final double price;
// //   final String trainer;
// //   final List<User> applicants;
// //   final List<User> acceptedApplicants;
// //   final List<User> rejectedApplicants;
// //   final double rate;
// //   final bool isSociety;
// //   final String organization;
// //   final String image;
// //
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

import 'dart:convert';

class Course {
  final String id;
  final String name;
  final List<String> topics;
  final List<String> prequests;
  final List<String> majors;
  final String location;
  final bool isOnline;
  final DateTime startDate;
  final String time;
  final String credential;
  final String trainer;
  final List<User> applicants;
  final List<User> rejectedApplicants;
  final bool isSociety;
  final int price ;
  final String organization;
  final List<Session> sessions;
  final List<Rating> ratings;
  final String startTime;
  final String endTime;
  final List<String> days;
  final String image;
  final int maxnumofstudent;

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
    required this.trainer,
    required this.applicants,
    required this.rejectedApplicants,
    required this.isSociety,
    required this.organization,
    required this.sessions,
    required this.ratings,
    required this.startTime,
    required this.endTime,
    required this.days,
    required this.image,
    required this.maxnumofstudent,
   required this.price,
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
      'trainer': trainer,
      'applicants': applicants.map((user) => user.toMap()).toList(),
      'rejectedApplicants': rejectedApplicants.map((user) => user.toMap()).toList(),
      'isSociety': isSociety,
      'organization': organization,
      'sessions': sessions.map((session) => session.toMap()).toList(),
      'ratings': ratings.map((rating) => rating.toMap()).toList(),
      'startTime': startTime,
      'endTime': endTime,
      'days': days,
      'image': image,
      'maxnumofstudent': maxnumofstudent,
      'price': price,
    };
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      id: map['_id'] != null ? map['_id'] : '',
      name: map['name'] != null ? map['name'] : '',
      topics: (map['topics'] as List<dynamic>?)?.map((dynamic topic) => topic.toString()).toList() ?? [],
      prequests: (map['prequests'] as List<dynamic>?)?.map((dynamic prerequisite) => prerequisite.toString()).toList() ?? [],
      majors: (map['majors'] as List<dynamic>?)?.map((dynamic major) => major.toString()).toList() ?? [],
      location: map['location'] ?? '',
      isOnline: map['isOnline'] ?? false,
      startDate: DateTime.parse(map['startDate']),
      time: map['time'] ?? '',
      credential: map['credential'] ?? '',
      trainer: map['trainer'] ?? '',
      applicants: (map['applicants'] as List<dynamic>?)?.map((user) => User.fromMap(user)).toList() ?? [],
      rejectedApplicants: (map['rejectedApplicants'] as List<dynamic>?)?.map((user) => User.fromMap(user)).toList() ?? [],
      isSociety: map['isSociety'] ?? false,
      organization: map['organization'] ?? '',
      sessions: (map['sessions'] as List<dynamic>?)?.map((session) => Session.fromMap(session)).toList() ?? [],
      ratings: (map['ratings'] as List<dynamic>?)?.map((rating) => Rating.fromMap(rating)).toList() ?? [],
      startTime: map['startTime'] ?? '',
      endTime: map['endTime'] ?? '',
      days: List<String>.from(map['days'] ?? []),
      image: map['image'] ?? '',
      maxnumofstudent: map['maxnumofstudent'] ?? 0,
      price: map['price'] ?? 0,
    );
  }

  factory Course.fromSimpleMap(Map<String, dynamic> map) {
    return Course(
      id: map['_id'] != null ? map['_id'] : '',
      name: map['name'] != null ? map['name'] : '',
      topics: [],
      prequests: [],
      majors: [],
      location: '',
      isOnline: false,
      startDate: DateTime.now(),
      time: '',
      credential: '',
      trainer: '',
      applicants: [],
      rejectedApplicants: [],
      isSociety: false,
      organization: '',
      sessions: [],
      ratings: [],
      startTime: '',
      endTime: '',
      days: [],
      image: '',
      maxnumofstudent: 0,
      price: 0 ,
    );
  }

  String toJson() => json.encode(toMap());

  factory Course.fromJson(String source) => Course.fromMap(json.decode(source));
}

// ... (rest of the existing code)


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

// class CourseImage {
//   final String type;
//   final List<int> data;
//
//   CourseImage({
//     required this.type,
//     required this.data,
//   });
//
//   factory CourseImage.fromMap(Map<String, dynamic> map) {
//     return CourseImage(
//       type: map['type'] ?? '',
//       data: List<int>.from(map['data'] ?? []),
//     );
//   }
// }

// class Course {
//   String name;
//   List<String> topics;
//   List<String> prequests;
//   List<String> majors;
//   String location;
//   bool isOnline;
//   DateTime startDate;
//   DateTime endDate;
//   String time;
//   String credential;
//   String trainer;
//   String description;
//   List<String> applicants;
//   List<String> rejectedApplicants;
//   bool isSociety;
//   String organization;
//   List<Session> sessions;
//   List<Rating> ratings;
//   String startTime;
//   String endTime;
//   List<String> days;
//   List<int> image;
//   int maxNumOfStudents;
//
//   Course({
//     required this.name,
//     required this.topics,
//     required this.prequests,
//     required this.majors,
//     required this.location,
//     required this.isOnline,
//     required this.startDate,
//     required this.endDate,
//     required this.time,
//     required this.credential,
//     required this.trainer,
//     required this.description,
//     required this.applicants,
//     required this.rejectedApplicants,
//     required this.isSociety,
//     required this.organization,
//     required this.sessions,
//     required this.ratings,
//     required this.startTime,
//     required this.endTime,
//     required this.days,
//     required this.image,
//     required this.maxNumOfStudents,
//   });
//
//   Course.fromJson(Map<String, dynamic> json)
//       : name = json['name'],
//         topics = List<String>.from(json['topics']),
//         prequests = List<String>.from(json['prequests']),
//         majors = List<String>.from(json['majors']),
//         location = json['location'],
//         isOnline = json['isOnline'],
//         startDate = DateTime.parse(json['startDate']),
//         endDate = DateTime.parse(json['endDate']),
//         time = json['time'],
//         credential = json['credential'],
//         trainer = json['trainer'],
//         description = json['description'],
//         applicants = List<String>.from(json['applicants']),
//         rejectedApplicants = List<String>.from(json['rejectedApplicants']),
//         isSociety = json['isSociety'],
//         organization = json['organization'],
//         sessions = (json['sessions'] as List<dynamic>)
//             .map((session) => Session.fromJson(session))
//             .toList(),
//         ratings = (json['ratings'] as List<dynamic>)
//             .map((rating) => Rating.fromJson(rating))
//             .toList(),
//         startTime = json['startTime'],
//         endTime = json['endTime'],
//         days = List<String>.from(json['days']),
//         image = List<int>.from(json['image']),
//         maxNumOfStudents = json['maxNumOfStudents'];
//
//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'topics': topics,
//       'prequests': prequests,
//       'majors': majors,
//       'location': location,
//       'isOnline': isOnline,
//       'startDate': startDate.toIso8601String(),
//       'endDate': endDate.toIso8601String(),
//       'time': time,
//       'credential': credential,
//       'trainer': trainer,
//       'description': description,
//       'applicants': applicants,
//       'rejectedApplicants': rejectedApplicants,
//       'isSociety': isSociety,
//       'organization': organization,
//       'sessions': sessions.map((session) => session.toJson()).toList(),
//       'ratings': ratings.map((rating) => rating.toJson()).toList(),
//       'startTime': startTime,
//       'endTime': endTime,
//       'days': days,
//       'image': image,
//       'maxNumOfStudents': maxNumOfStudents,
//     };
//   }
// }
//
// class Session {
//   DateTime sessionDate;
//   List<Attendance> attendance;
//
//   Session({
//     required this.sessionDate,
//     required this.attendance,
//   });
//
//   Session.fromJson(Map<String, dynamic> json)
//       : sessionDate = DateTime.parse(json['sessionDate']),
//         attendance = (json['attendance'] as List<dynamic>)
//             .map((attendee) => Attendance.fromJson(attendee))
//             .toList();
//
//   Map<String, dynamic> toJson() {
//     return {
//       'sessionDate': sessionDate.toIso8601String(),
//       'attendance': attendance.map((attendee) => attendee.toJson()).toList(),
//     };
//   }
// }
//
// class Attendance {
//   String userId;
//   bool attended;
//
//   Attendance({
//     required this.userId,
//     required this.attended,
//   });
//
//   Attendance.fromJson(Map<String, dynamic> json)
//       : userId = json['userId'],
//         attended = json['attended'];
//
//   Map<String, dynamic> toJson() {
//     return {
//       'userId': userId,
//       'attended': attended,
//     };
//   }
// }
//
// class Rating {
//   String societyId;
//   double rating;
//
//   Rating({
//     required this.societyId,
//     required this.rating,
//   });
//
//   Rating.fromJson(Map<String, dynamic> json)
//       : societyId = json['societyId'],
//         rating = json['rating'];
//
//   Map<String, dynamic> toJson() {
//     return {
//       'societyId': societyId,
//       'rating': rating,
//     };
//   }
// }
