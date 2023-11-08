import '../model/user.dart';

class UserPreferences {
  static final myUser = User(
    token:  'dfgbh',
    id: 'dfgbh',
    imagePath:
    'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
    name: 'Sarah Abs',
    email: 'sarah.abs@gmail.com',
    about:
    'Certified Personal Trainer and Nutritionist with years of experience in creating effective diets and training plans focused on achieving individual customers goals in a smooth way.',
    phoneNumber: '0592245351',
    location: 'nablus',
    university: '11924826',
    major: 'computer engineer',
  //  isDarkMode: false,
    skills: [
      Skill(name: 'Skill 1', rating: 4),
      Skill(name: 'Skill 2', rating: 5),
      Skill(name: 'Skill 3', rating: 5),
      // Add more skills here
    ],
        interests: [
      Interest(title: 'python', description: 'Description 1'),
      Interest(title: 'AI', description: 'Description 2'),
      Interest(title: 'painting', description: 'Description 2'),
      Interest(title: 'Design', description: 'Description 2'),
      Interest(title: 'Ropots', description: 'Description 2'),
      Interest(title: 'Arduino', description: 'Description 2'),
      Interest(title: 'Hardware', description: 'Description 2'),
      // Add more interests here
    ],

  );
}


//------------------------------------------------------------------------------------------
// import 'dart:convert';
//
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../model/user.dart';
//
//
// class UserPreferences {
//   static const _keyUser = 'user_data';
//
//   static User myUser = User(
//     imagePath:
//     'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
//     name: 'Sarah Abs',
//     email: 'sarah.abs@gmail.com',
//     about:
//     'Certified Personal Trainer and Nutritionist with years of experience in creating effective diets and training plans focused on achieving individual customer goals in a smooth way.',
//     phoneNumber: '0592245351',
//     location: 'nablus',
//     university: '11924826',
//     major: 'computer engineer',
//     isDarkMode: false,
//     skills: [
//       Skill(name: 'Skill 1', rating: 4),
//       Skill(name: 'Skill 2', rating: 5),
//       Skill(name: 'Skill 3', rating: 5),
//       // Add more skills here
//     ],
//     interests: [
//       Interest(title: 'python', description: 'Description 1'),
//       Interest(title: 'AI', description: 'Description 2'),
//       Interest(title: 'painting', description: 'Description 2'),
//       Interest(title: 'Design', description: 'Description 2'),
//       Interest(title: 'Ropots', description: 'Description 2'),
//       Interest(title: 'Arduino', description: 'Description 2'),
//       Interest(title: 'Hardware', description: 'Description 2'),
//       // Add more interests here
//     ],
//   );
//
//   static Future<void> saveUser(User user) async {
//     final preferences = await SharedPreferences.getInstance();
//     await preferences.setString(_keyUser, json.encode(user.toJson()));
//   }
//
//   static Future<User> getUser() async {
//     final preferences = await SharedPreferences.getInstance();
//     final userData = preferences.getString(_keyUser);
//     return userData != null ? User.fromJson(json.decode(userData)) : myUser;
//   }
// }
