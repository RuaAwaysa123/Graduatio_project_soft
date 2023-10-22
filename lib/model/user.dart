class User {
  final String imagePath;
  final String name;
  final String email;
  final String about;
  final bool isDarkMode;
  final String location;
  final String phoneNumber;
  final String major;
  final String university;
  final List<Skill> skills;

  const User({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.about,
    required this.isDarkMode,
  required this.location,
    required this.major,
  required this.phoneNumber,
  required this.university,

    required this.skills,
  });
}

class Skill {
  final String name;
  final int rating;

  Skill({required this.name, required this.rating});
}