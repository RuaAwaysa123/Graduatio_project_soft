// class User {
//   final String imagePath;
//   final String name;
//   final String email;
//   final String about;
//   final bool isDarkMode;
//   final String location;
//   final String phoneNumber;
//   final String major;
//   final String university;
//   final List<Skill> skills;
//   final List<Interest> interests;
//   const User({
//     required this.imagePath,
//     required this.name,
//     required this.email,
//     required this.about,
//     required this.isDarkMode,
//   required this.location,
//     required this.major,
//   required this.phoneNumber,
//   required this.university,
//     required this.skills,
//     required this.interests,
//   });
// }

class User {
  final String imagePath;
  late final String name;
  final String email;
  final String about;
  final String university;
  final List<Interest> interests;
  final bool isDarkMode;
  final String location;
  final String major;
  final List<Skill> skills;
  final String phoneNumber;

  User({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.about,
    required this.university,
    required this.interests,
    required this.isDarkMode,
    required this.location,
    required this.major,
    required this.skills,
    required this.phoneNumber,
  });
}


class Skill {
  final String name;
  final int rating;

  Skill({required this.name, required this.rating});
}
class Interest{
  final String title;
  final String description;

  Interest({required this.title, required this.description});
}
