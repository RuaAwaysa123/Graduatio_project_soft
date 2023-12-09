// import 'dart:convert';
//
// class user {
//   final String id;
//   final String name;
//   final String email;
//   final String token;
//   final String password;
//   user({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.token,
//     required this.password,
//   });
//
//   Map<String, dynamic> toMap() {
//     return {
//       'name': name,
//       'email': email,
//       'token': token,
//       'password': password,
//     };
//   }
//
//   factory user.fromMap(Map<String, dynamic> map) {
//     return user(
//       id: map['_id'] ?? '',
//       name: map['name'] ?? '',
//       email: map['email'] ?? '',
//       token: map['token'] ?? '',
//       password: map['password'] ?? '',
//     );
//   }
//
//   String toJson() => json.encode(toMap());
//
//   factory user.fromJson(String source) => user.fromMap(json.decode(source));
//
// }

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
//     required this.password, required String major,
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
//       password: map['password'] ?? '', major: '',
//     );
//   }
//
//   String toJson() => json.encode(toMap());
//
//   factory User.fromJson(String source) => User.fromMap(json.decode(source));
// }


//*****************************************************************************************
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
  final String about;
  final String university;
  final String imgUrl;
  late final List<Interest> interests;
  late final List<Certificate> certificates;
  late final List<Skill> skills;
  late final List<Education> education;


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
    required this.about,
    required this.university,
    required this.interests,
    required this.certificates,
    required this.skills,
    required this.education,
    required this.imgUrl ,

  });

  // String get imageUrl => imageUrl ?? '';


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
      'about': about,
      'university': university,
      'imgUrl' : imgUrl,
      'interests': interests.map((interest) => interest.toMap()).toList(),
      'certificates': certificates.map((certificate) => certificate.toMap()).toList(),
      'skills': skills.map((skill) => skill.toMap()).toList(),
      'education': education.map((edu) => edu.toMap()).toList(),
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
      imgUrl: map['imgUrl'] ?? '',

      universityNumber: map['universityNumber'] ?? '',
      major: map['major'] ?? '',
      year: map['year'] ?? '',
      about: map['about'] ?? '',
      university: map['university'] ?? '',
      interests: (map['interests'] as List<dynamic>?)
          ?.map((interest) => Interest.fromMap(interest))
          .toList() ??
          [],
      certificates: (map['certificates'] as List<dynamic>?)
          ?.map((certificate) => Certificate.fromMap(certificate))
          .toList() ??
          [],
      skills: (map['skills'] as List<dynamic>?)
          ?.map((skill) => Skill.fromMap(skill))
          .toList() ??
          [],
      education: (map['education'] as List<dynamic>?)
          ?.map((edu) => Education.fromMap(edu))
          .toList() ??
          [],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}

class Interest {
  final String title;
  final String description;

  Interest({
    required this.title,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
    };
  }

  factory Interest.fromMap(Map<String, dynamic> map) {
    return Interest(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
    );
  }
}

class Certificate {
  final String certificateName;
  final String certificateURL;
  final String issueOrganization;

  Certificate({
    required this.certificateName,
    required this.certificateURL,
    required this.issueOrganization,
  });

  Map<String, dynamic> toMap() {
    return {
      'certificateName': certificateName,
      'certificateURL': certificateURL,
      'issueOrganization': issueOrganization,
    };
  }

  factory Certificate.fromMap(Map<String, dynamic> map) {
    return Certificate(
      certificateName: map['certificateName'] ?? '',
      certificateURL: map['certificateURL'] ?? '',
      issueOrganization: map['issueOrganization'] ?? '',
    );
  }
}

class Skill {
  final String id; // Add this line
  final String skillName;
  final int rating;

  Skill({
    required this.id, // Add this line
    required this.skillName,
    required this.rating,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id, // Add this line
      'skillName': skillName,
      'rating': rating,
    };
  }

  factory Skill.fromMap(Map<String, dynamic> map) {
    return Skill(
      id: map['id'] ?? '',
      skillName: map['skillName'] ?? '',
      rating: map['rating'] ?? 0,
    );
  }
}

class Education {
  final String educationId ;
  final String schoolName;
  final String startDate;
  final String endDate;

  Education( {
    required this.educationId,
    required this.schoolName,
    required this.startDate,
    required this.endDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'educationId' : educationId,
      'schoolName': schoolName,
      'startDate': startDate,
      'endDate': endDate,
    };
  }

  factory Education.fromMap(Map<String, dynamic> map) {
    return Education(
      educationId : map['educationId'] ?? '',
      schoolName: map['schoolName'] ?? '',
      startDate: map['startDate'] ?? '',
      endDate: map['endDate'] ?? '',
    );
  }
}
