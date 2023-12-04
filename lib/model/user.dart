import 'dart:convert';

class User {
  final String id;

  final String token;

   final String imagePath;
  final String name;
  final String email;
   final String about;
  //final bool isDarkMode;
  final String location;
  final String phoneNumber;
  final String major;
  final String university;
  final List<Skill> skills;
  final List<Interest> interests;

  const User({
    required this.token,
    required this.id,
    required this.imagePath,
    required this.name,
    required this.email,
    required this.about,
  //  required this.isDarkMode,
    required this.location,
    required this.major,
    required this.phoneNumber,
    required this.university,
    required this.interests,
    required this.skills,
  });

  Map<String, dynamic> toMap() {
    return {
          'id' : id,
    'imagePath': imagePath,
    'name': name,
    'email': email,
    'about': about,
    'university': university,
    // 'interests': interests.map((interest) => interest.toJson()).toList(),
   // 'isDarkMode': isDarkMode,
    'location': location,
    'major': major,
    // 'skills': skills.map((skill) => skill.toJson()).toList(),
    'phoneNumber': phoneNumber,
    //  'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
          id: map['_id'] ?? '',
    name: map['name'] ?? '',
    email: map['email'] ?? '',
    token: map['token'] ?? '',
    // password: map['password'] ?? '',
    phoneNumber: map['phoneNumber'] ?? '',
      imagePath : map['imagePath'] ?? '',
      university: map['university'] ?? '',
      location: map['location'] ?? '',
      major: map['major'] ?? '',
      about: map['about'],
      interests: [],
      skills: [], //isDarkMode: null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}



// }







class Skill {
  final String name;
  final int rating;

  Skill({required this.name, required this.rating});
}

class Interest {
  final String title;
  final String description;

  Interest({required this.title, required this.description});}














//------------------------------------------------------------------------------

// Map<String, dynamic> toMap() {
//   return {
//     'token': token,
//     'id' : id,
//     'imagePath': imagePath,
//     'name': name,
//     'email': email,
//     'about': about,
//     'university': university,
//     'interests': interests.map((interest) => interest.toJson()).toList(),
//     'isDarkMode': isDarkMode,
//     'location': location,
//     'major': major,
//     'skills': skills.map((skill) => skill.toJson()).toList(),
//     'phoneNumber': phoneNumber,
//   };
// }

// factory User.fromMap(Map<String, dynamic> map) {
//   return User(
//     id: map['_id'] ?? '',
//     name: map['name'] ?? '',
//     email: map['email'] ?? '',
//     token: map['token'] ?? '',
//     // password: map['password'] ?? '',
//     phoneNumber: map['phoneNumber'] ?? '',
//       imagePath : map['imagePath'] ?? '',
//       university: map['university'] ?? '',
//       location: map['location'] ?? '',
//       major: map['major'] ?? '', about: '', isDarkMode: null, interests: [], skills: [],
//   );
// }
//
// String toJson() => json.encode(toMap());
//
// factory User.fromJson(String source) => User.fromMap(json.decode(source));
// }



//------------------------------------------------------------------------
// import 'dart:convert';
//
// class User {
//
//   late final String imagePath;
//     final String id  ;
//   final String token ;
//
//   String name;
//   String email;
//   String about;
//   String university;
//   List<Interest> interests;
//   bool isDarkMode;
//   String location;
//   String major;
//   List<Skill> skills;
//   String phoneNumber;
//
//   User({
//     required this.token ,
//     required this.id,
//     required this.imagePath,
//     required this.name,
//     required this.email,
//     required this.about,
//     required this.university,
//     required this.interests,
//     required this.isDarkMode,
//     required this.location,
//     required this.major,
//     required this.skills,
//     required this.phoneNumber,
//   });
//
//   Map<String, dynamic> toJson() {
//     return {
//      'token': token,
//       'id' : id,
//       'imagePath': imagePath,
//       'name': name,
//       'email': email,
//       'about': about,
//       'university': university,
//       'interests': interests.map((interest) => interest.toJson()).toList(),
//       'isDarkMode': isDarkMode,
//       'location': location,
//       'major': major,
//       'skills': skills.map((skill) => skill.toJson()).toList(),
//       'phoneNumber': phoneNumber,
//     };
//   }
//
//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       token : json['token'] ,
//       id : json['id'],
//       imagePath: json['imagePath'],
//       name: json['name'],
//       email: json['email'],
//       about: json['about'],
//       university: json['university'],
//       interests: (json['interests'] as List<dynamic>)
//           .map((interest) => Interest.fromJson(interest))
//           .toList(),
//       isDarkMode: json['isDarkMode'],
//       location: json['location'],
//       major: json['major'],
//       skills: (json['skills'] as List<dynamic>)
//           .map((skill) => Skill.fromJson(skill))
//           .toList(),
//       phoneNumber: json['phoneNumber'],
//     );
//   }
// }

// class Skill {
//   final String name;
//   final int rating;
//
//   Skill({required this.name, required this.rating});
//
//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'rating': rating,
//     };
//   }
//
//   factory Skill.fromJson(Map<String, dynamic> json) {
//     return Skill(
//       name: json['name'],
//       rating: json['rating'],
//     );
//   }
// }
//
// class Interest {
//   final String title;
//   final String description;
//
//   Interest({required this.title, required this.description});
//
//
//   Map<String, dynamic> toJson() {
//     return {
//       'title': title,
//       'description': description,
//     };
//   }
//
//   factory Interest.fromJson(Map<String, dynamic> json) {
//     return Interest(
//       title: json['title'],
//       description: json['description'],
//     );
//   }
// }
//
