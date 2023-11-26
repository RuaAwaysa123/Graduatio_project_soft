// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';
// //import 'package:rive_animation/model/User1.dart';
//
// //import '../model/User1.dart';
// import '../model/user.dart';
//
// class UserProvider extends ChangeNotifier {
//
// User _user = User(
// id: '',
// name: '',
// email: '',
// token: '',
//   imagePath: '',
//   about: '',
//   location: '',
//   major: '',
//   phoneNumber: '',
//   university: '',
//   interests: [],
//   skills: [],
// //password: '',
// );
// User get user  => _user ;
//
// void setUser(String user1 ){
//   _user = User.fromJson(user1);
//   notifyListeners() ;
// }
//
// }
//-------------------------------------------------------------------
// import 'package:flutter/material.dart';
//
// import '../model/User1.dart';
//
//
// class UserProvider extends ChangeNotifier {
//   User _user = User(
//     id: '',
//     email: '',
//     token: '',
//     password: '',
//     phoneNumber: '',
//     firstName: '',
//     lastName: '',
//     location: '',
//     universityNumber: '',
//     major: '',
//     year: '',
//     // about: '', university: '',
//   );
//
//   User get user => _user;
//
//   void setUser(String user) {
//     _user = User.fromJson(user);
//     notifyListeners();
//   }
//
//   void setUserFromModel(User user) {
//     _user = user;
//     notifyListeners();
//   }
// }



//-------------------------------------------------------------------------------------
//



//********************************************************************************8


//**********************************************************************************************
import 'package:flutter/material.dart';


import '../model/User1.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: '',
    email: '',
    token: '',
    password: '',
    phoneNumber: '',
    firstName: '',
    lastName: '',
    location: '',
    universityNumber: '',
    major: '',
    year: '',
    about: '',
    university: '',
    interests: [],
    certificates: [],
    skills: [],
    education: [],
  );

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }

  void setInterests(List<Interest> interests) {
    _user.interests = interests;
    notifyListeners();
  }

  void setCertificates(List<Certificate> certificates) {
    _user.certificates = certificates;
    notifyListeners();
  }

  void setSkills(List<Skill> skills) {
    _user.skills = skills;
    notifyListeners();
  }

  void setEducation(List<Education> education) {
    _user.education = education;
    notifyListeners();
  }
}



