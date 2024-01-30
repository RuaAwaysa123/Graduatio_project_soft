// import 'package:animated_theme_switcher/animated_theme_switcher.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// import 'package:rive_animation/screens/profile/edit_profile_page.dart';
// // import 'package:rive_animation/utils/user_preferences.dart';
// import 'package:rive_animation/widget/appbar_widget.dart';
// import 'package:rive_animation/widget/button_widget.dart';
// import 'package:rive_animation/widget/numbers_widget.dart';
// import 'package:rive_animation/widget/profile_widget.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../model/User1.dart';
// import '../../services/auth_service.dart';
// import 'components/AddEducationDialog.dart';
// import 'components/CertificateDialog.dart';
// import 'components/addInterests.dart';
// import 'components/add_skill_dialog.dart';
// import 'components/interest_select.dart';
//
//
// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   late User userProfile = User(
//     id: '',
//     email: '',
//     token: '',
//     password: '',
//     phoneNumber: '',
//     fullName: '',
//     // firstName: '',
//     // lastName: '',
//     location: '',
//     universityNumber: '',
//     major: '',
//     year: '',
//     about: '',
//     university: '',
//     interests: [],
//     certificates: [],
//     skills: [],
//     education: [],
//     imgUrl: '',
//   );
//   List<Interest> selectedInterests = [];
//   @override
//   void initState() {
//     super.initState();
//     loadUserProfile();
//   }
//
//   void loadUserProfile() async {
//     try {
//       final AuthService authService = AuthService();
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       String userId = prefs.getString('userId') ?? '';
//
//       if (userId.isNotEmpty) {
//         final loadedProfile = await authService.getUserProfile(
//           context: context,
//           userId: userId,
//         );
//         setState(() {
//           userProfile = loadedProfile;
//         });
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ThemeSwitchingArea(
//       child: Builder(
//         builder: (context) => Scaffold(
//           appBar: buildAppBar(context),
//           body: ListView(
//             physics: BouncingScrollPhysics(),
//             children: [
//               // ProfileWidget(
//               //   imageProvider: _pickedImage != null ? FileImage(_pickedImage!) : NetworkImage(userProfile.imgUrl),
//               //   isEdit: true,
//               //   onClicked: () {
//               //     Navigator.of(context).push(
//               //       MaterialPageRoute(builder: (context) => EditProfilePage()),
//               //     );
//               //   },
//               // ),
//
//               const SizedBox(height: 24),
//               buildName(userProfile),
//               const SizedBox(height: 24),
//              // Center(child: buildUpgradeButton()),
//               const SizedBox(height: 24),
//              // NumbersWidget(),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(primary: Colors.blue),
//                     child: Row(
//                       children: const [
//                         Icon(Icons.message),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Text('Message me')
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       // You can navigate to the calendar page here
//                     },
//                     style: ElevatedButton.styleFrom(primary: Colors.grey[900]),
//                     child: Row(
//                       children: const [
//                         Icon(Icons.calendar_month_outlined),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Text('Calendar')
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(primary: Colors.grey[900]),
//                     child: const Icon(Icons.more_horiz),
//                   )
//                 ],
//               ),
//               Divider(
//                 thickness: 1,
//                 height: 10,
//                 color: Colors.blue,
//               ),
//               const SizedBox(height: 10),
//               buildAboutme(userProfile),
//               const SizedBox(height: 30),
//               buildAbout(userProfile),
//               const SizedBox(height: 10),
//               buildSkills(context, userProfile),
//               const SizedBox(height: 10),
//               buildInterestsChips(userProfile),
//               const SizedBox(height: 10),
//               buildCertificates(userProfile),
//              // buildCertificates(userProfile),
//               const SizedBox(height: 10),
//               buildEducation(context, userProfile),
//               const SizedBox(height: 10),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget buildName(User user1) => Column(
//     children: [
//       Text(
//         user1.fullName,
//         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
//       ),
//       const SizedBox(height: 4),
//       Text(
//         user1.email,
//         style: TextStyle(color: Colors.grey),
//       ),
//     ],
//   );
//
//   Widget buildUpgradeButton() => ButtonWidget(
//     text: 'Upgrade To PRO',
//     onClicked: () {},
//   );
//
//   Widget buildAbout(User user1) => Container(
//     padding: EdgeInsets.symmetric(horizontal: 48),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'About',
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 16),
//         Text(
//           user1.about,
//           style: TextStyle(fontSize: 16, height: 1.4),
//         ),
//       ],
//     ),
//   );
//
//   Widget buildAboutme(User user1) => Container(
//     padding: EdgeInsets.symmetric(horizontal: 48),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'About Me',
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 16),
//         Row(
//           children: [
//             Icon(FontAwesomeIcons.phone, size: 18, color: Colors.blue),
//             SizedBox(width: 8),
//             Text(
//               user1.phoneNumber,
//               style: TextStyle(fontSize: 16, height: 1.4),
//             ),
//           ],
//         ),
//         const SizedBox(height: 8),
//         Row(
//           children: [
//             Icon(FontAwesomeIcons.graduationCap, size: 18, color: Colors.blue),
//             SizedBox(width: 8),
//             Text(
//               user1.major,
//               style: TextStyle(fontSize: 16, height: 1.4),
//             ),
//           ],
//         ),
//         const SizedBox(height: 8),
//         Row(
//           children: [
//             Icon(FontAwesomeIcons.university, size: 18, color: Colors.blue),
//             SizedBox(width: 8),
//             Text(
//               "Al Najah National Univercity " ,
//               //user1.university,
//               style: TextStyle(fontSize: 16, height: 1.4),
//             ),
//           ],
//         ),
//         const SizedBox(height: 8),
//         Row(
//           children: [
//             Icon(FontAwesomeIcons.locationPin, size: 18, color: Colors.blue),
//             SizedBox(width: 8),
//             Text(
//               user1.location,
//               style: TextStyle(fontSize: 16, height: 1.4),
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
//
//   Widget buildSkills(BuildContext context, User user) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 48),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Skills',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 16),
//           for (var skill in user.skills)
//             Container(
//               margin: EdgeInsets.only(bottom: 10),
//               padding: EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 color: Colors.deepPurple[50],
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//
//                       const SizedBox(width: 10),
//                       Text(skill.skillName),
//                       // const SizedBox(width: 10),
//                       // Text(skill.id),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       IconButton(
//                         icon: Icon(Icons.edit , color: Colors.green),
//                         onPressed: () {
//                           // Add your edit logic here
//                           updateSkillDialog(context, userProfile, skill);
//                         },
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.delete , color: Colors.red),
//                         onPressed: () {
//                           // Add your delete logic here
//                           // Call your deleteSkill function
//                           AuthService().deleteSkill(
//                             context: context,
//                             userId: user.id,
//                             skillId: skill.id,
//                           );
//                           // Remove the skill from the UI
//                           setState(() {
//                             user.skills.remove(skill);
//                           });
//                         },
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           const SizedBox(height: 16),
//           ElevatedButton(
//             onPressed: () {
//               showDialog(
//                 context: context,
//                 builder: (context) => AddSkillDialog(
//                   onSkillAdded: (newSkill) {
//                     setState(() {
//                       // add skill
//                     });
//                   },
//                 ),
//               );
//             },
//             child: Text('Add New Skill'),
//           )
//         //  buildSkillRating(skill.rating) ,
//         ],
//       ),
//     );
//   }
//
//
//   Widget buildSkillRating(int rating) {
//     List<Widget> stars = [];
//     for (int i = 0; i < 5; i++) {
//       if (i < rating) {
//         stars.add(Icon(Icons.star, color: Colors.yellow));
//       } else {
//         stars.add(Icon(Icons.star_border, color: Colors.yellow));
//       }
//     }
//     return Row(children: stars);
//   }
//
//   Widget buildInterestsChips(User user) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 48),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Interests',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 16),
//           Wrap(
//             children: selectedInterests.map((interest) {
//               return Chip(
//                 label: Text(interest.title),
//                 onDeleted: () {
//                   setState(() {
//                     selectedInterests.remove(interest);
//                   });
//                 },
//               );
//             }).toList(),
//           ),
//           const SizedBox(height: 16),
//           ElevatedButton(
//             onPressed: () async {
//
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => InterestSelectionPage(),
//                 ),
//               );
//
//             },
//             child: Text('Add Interest'),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void updateSkillDialog(BuildContext context, User user, Skill skill) {
//     TextEditingController skillNameController = TextEditingController(text: skill.skillName);
//     TextEditingController ratingController = TextEditingController(text: skill.rating.toString());
//
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Edit Skill'),
//         content: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextField(
//               controller: skillNameController,
//               decoration: InputDecoration(labelText: 'Skill Name'),
//             ),
//             TextField(
//               controller: ratingController,
//               decoration: InputDecoration(labelText: 'Rating'),
//             ),
//           ],
//         ),
//         actions: [
//           ElevatedButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: Text('Cancel'),
//           ),
//           ElevatedButton(
//             onPressed: () async {
//               // Perform the skill update here
//               await AuthService().updateSkill(
//                 context: context,
//                 userId: user.id,
//                 skillId: skill.id,
//                 skillName: skillNameController.text,
//                 rating: ratingController.text,
//               );
//
//               // Close the dialog
//               Navigator.of(context).pop();
//
//               // Reload the user profile to reflect the changes
//               loadUserProfile();
//             },
//             child: Text('Update'),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget buildCertificates(User user) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 48),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Certificates',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 16),
//           for (var certificate in user.certificates)
//             Container(
//               margin: EdgeInsets.only(bottom: 10),
//               padding: EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 color: Colors.blue[50],
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Text("Certificate Name : " ,
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 12,
//               ),),
//                           Text(certificate.certificateName),],
//                       ),
//
//                       Row(
//                         children: [
//                           Text("Issue Organization : " ,
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 12,
//                             ),
//                           ),
//                           Text(certificate.issueOrganization),
//                         ],
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       IconButton(
//                       icon: Icon(Icons.edit , color: Colors.green,),
//                       onPressed: () {
//                         // Implement your edit logic here
//                         updateCertificateDialog(context, user, certificate);
//                       },
//                     ),
//                       IconButton(
//                         icon: Icon(Icons.delete , color: Colors.red),
//                         onPressed: () {
//                           // Implement your pin logic here
//                         },
//                       ),
//
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           const SizedBox(height: 16),
//           ElevatedButton(
//             onPressed: () async {
//               showDialog(
//                 context: context,
//                 builder: (context) => AddCertificateDialog(
//                   onCertificateAdded: (newCertificate) {
//                     setState(() {
//                       user.certificates.add(newCertificate);
//                     });
//                   },
//                 ),
//               );
//             },
//             child: Text('Add New Certificate'),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // ...
//
//   void updateCertificateDialog(BuildContext context, User user, Certificate certificate) {
//     // Implement the update certificate dialog here
//     // You can use a similar approach to the update skill dialog
//   }
// }
// Widget buildEducation(BuildContext context, User user) {
//   return Container(
//     padding: EdgeInsets.symmetric(horizontal: 48),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Education',
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 16),
//         for (var education in user.education)
//           Container(
//             margin: EdgeInsets.only(bottom: 10),
//             padding: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: Colors.deepPurple[50],
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       education.schoolName,
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18,
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       '${education.startDate.year} - ${education.endDate.year}',
//                       style: TextStyle(
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     IconButton(
//                       icon: Icon(Icons.edit, color: Colors.green),
//                       onPressed: () {
//                         // Add your edit logic here
//                         updateEducationDialog(context, user, education);
//                       },
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.delete, color: Colors.red),
//                       onPressed: () {
//                         // Add your delete logic here
//                         // Call your deleteEducation function
//                         AuthService().addEducation(
//                           context: context,
//                           userId: user.id,
//                           schoolName: education.schoolName,
//                           startDate: education.startDate,
//                           endDate: education.endDate,
//                           educationId: "",
//
//                         );
//                         // Remove the education from the UI
//                         // setState(() {
//                         //   user.education.remove(education);
//                         // });
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         const SizedBox(height: 16),
//         ElevatedButton(
//           onPressed: () {
//             showDialog(
//               context: context,
//               builder: (context) => AddEducationDialog(
//                 onEducationAdded: (newEducation) {
//                   // setState(() {
//                   //   // Add education
//                   // });
//                 },
//               ),
//             );
//           },
//           child: Text('Add New Education'),
//         ),
//       ],
//     ),
//   );
// }
//
//
//
//
// void updateEducationDialog(BuildContext context, User user, Education education) {
//   // Similar to the updateSkillDialog, create a dialog to update education information.
// }
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:rive_animation/screens/profile/edit_profile_page.dart';
// import 'package:rive_animation/utils/user_preferences.dart';
import 'package:rive_animation/widget/appbar_widget.dart';
import 'package:rive_animation/widget/button_widget.dart';
import 'package:rive_animation/widget/numbers_widget.dart';
import 'package:rive_animation/widget/profile_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/User1.dart';
import '../../services/auth_service.dart';
import 'assets.dart';
import 'components/AddEducationDialog.dart';
import 'components/CertificateDialog.dart';
import 'components/addInterests.dart';
import 'components/add_skill_dialog.dart';
import 'components/interest_select.dart';


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late User userProfile = User(
    id: '',
    email: '',
    token: '',
    password: '',
    phoneNumber: '',
    fullName: '',
    // firstName: '',
    // lastName: '',
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
    imgUrl: '',
  );
  List<Interest> selectedInterests = [];
  @override
  void initState() {
    super.initState();
    loadUserProfile();
  }

  void loadUserProfile() async {
    try {
      final AuthService authService = AuthService();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String userId = prefs.getString('userId') ?? '';

      if (userId.isNotEmpty) {
        final loadedProfile = await authService.getUserProfile(
          context: context,
          userId: userId,
        );
        setState(() {
          userProfile = loadedProfile;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {

    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) => Scaffold(
          appBar:
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            actions: <Widget>[
              IconButton(
                icon: const Icon(
                  FontAwesomeIcons.commentDots,
                  color: Colors.black54,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.black54,
                ),
                onPressed: () {},
              )
            ],
          ),
          //buildAppBar(context),
          body: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              _buildHeader(userProfile),
              // ProfileWidget(
              //   imageProvider: _pickedImage != null ? FileImage(_pickedImage!) : NetworkImage(userProfile.imgUrl),
              //   isEdit: true,
              //   onClicked: () {
              //     Navigator.of(context).push(
              //       MaterialPageRoute(builder: (context) => EditProfilePage()),
              //     );
              //   },
              // ),

              const SizedBox(height: 24),
              Container(
                margin: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(color: Colors.grey.shade200),
                child:  Text(
                    userProfile.about
                ),
              ),
              //buildName(userProfile),
              SizedBox(height: 5),
              // Center(child: buildUpgradeButton()),
              // const SizedBox(height: 24),
              // NumbersWidget(),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     ElevatedButton(
              //       onPressed: () {},
              //       style: ElevatedButton.styleFrom(primary: Colors.blue),
              //       child: Row(
              //         // children: const [
              //         //   Icon(Icons.message),
              //         //   SizedBox(
              //         //     width: 10,
              //         //   ),
              //         //   Text('Message me')
              //         // ],
              //       ),
              //     ),
              //     const SizedBox(
              //       width: 10,
              //     ),
              //     ElevatedButton(
              //       onPressed: () {
              //         // You can navigate to the calendar page here
              //       },
              //       style: ElevatedButton.styleFrom(primary: Colors.grey[900]),
              //       child: Row(
              //         children: const [
              //           Icon(Icons.calendar_month_outlined),
              //           SizedBox(
              //             width: 10,
              //           ),
              //           Text('Calendar')
              //         ],
              //       ),
              //     ),
              //     const SizedBox(
              //       width: 10,
              //     ),
              //     ElevatedButton(
              //       onPressed: () {},
              //       style: ElevatedButton.styleFrom(primary: Colors.grey[900]),
              //       child: const Icon(Icons.more_horiz),
              //     )
              //   ],
              // ),
              // Divider(
              //   thickness: 1,
              //   height: 10,
              //   color: Colors.blue,
              // ),
              const SizedBox(height: 10),
              buildAboutme(userProfile),
              // const SizedBox(height: 30),
              // buildAbout(userProfile),
              const SizedBox(height: 10),
              buildSkills(context, userProfile),
              const SizedBox(height: 10),
              buildInterestsChips(userProfile),
              const SizedBox(height: 10),
              buildCertificates(userProfile),
              // buildCertificates(userProfile),
              const SizedBox(height: 10),
              buildEducation(context, userProfile),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );

  }

  Widget buildName(User user1) => Column(
    children: [
      Text(
        user1.fullName,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      const SizedBox(height: 4),
      Text(
        user1.email,
        style: TextStyle(color: Colors.grey),
      ),
    ],
  );

  Widget buildUpgradeButton() => ButtonWidget(
    text: 'Upgrade To PRO',
    onClicked: () {},
  );

  // Widget buildAbout(User user1) => Container(
  //   // padding: EdgeInsets.symmetric(horizontal: 48),
  //   margin: const EdgeInsets.all(48.0),
  //   padding: const EdgeInsets.all(48.0),
  //   child: Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         'About',
  //         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  //       ),
  //       const SizedBox(height: 16),
  //       Text(
  //         user1.about,
  //         style: TextStyle(fontSize: 16, height: 1.4),
  //       ),
  //     ],
  //   ),
  // );
  // Widget buildAbout(User user1) => Container(
  //   width: 10, // Set the desired width
  //   height: 20, // Set the desired height
  //   margin: const EdgeInsets.all(16.0), // Adjust margin as needed
  //   padding: const EdgeInsets.all(16.0), // Adjust padding as needed
  //   decoration: BoxDecoration(
  //     borderRadius: BorderRadius.circular(10.0), // Set border radius
  //     color: Colors.white, // Set background color
  //     boxShadow: [
  //       BoxShadow(
  //         //color: Colors.blue.withOpacity(0.5), // Set shadow color
  //         spreadRadius: 2,
  //         blurRadius: 5,
  //         offset: Offset(0, 2), // changes position of shadow
  //       ),
  //     ],
  //   ),
  //   child: Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         'About',
  //         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  //       ),
  //       const SizedBox(height: 16),
  //       Text(
  //         user1.about,
  //         style: TextStyle(fontSize: 16, height: 1.4),
  //       ),
  //     ],
  //   ),
  // );

  Widget buildAboutme(User user1) => Container(
    margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0 ,  ), // Adjust horizontal and vertical margin

    // padding: const EdgeInsets.all(16.0),
    decoration: BoxDecoration(color: Colors.blue[50]),
    padding: EdgeInsets.symmetric(horizontal: 48.0, vertical: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact info',
          style: TextStyle(fontSize: 15, ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Icon(FontAwesomeIcons.phone, size: 18, color: Colors.blue),
            SizedBox(width: 8),
            Text(
              user1.phoneNumber,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(FontAwesomeIcons.graduationCap, size: 18, color: Colors.blue),
            SizedBox(width: 8),
            Text(
              user1.major,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(FontAwesomeIcons.university, size: 18, color: Colors.blue),
            SizedBox(width: 8),
            Text(
              "Al Najah National Univercity " ,
              //user1.university,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(FontAwesomeIcons.locationPin, size: 18, color: Colors.blue),
            SizedBox(width: 8),
            Text(
              user1.location,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      ],
    ),
  );

  Widget buildSkills(BuildContext context, User user) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Skills',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          for (var skill in user.skills)
            Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue[50] ,   //Colors.deepPurple[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(skill.skillName),
                      const SizedBox(width: 10),
                      buildSkillRating(skill.rating),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit , color: Colors.green),
                        onPressed: () {
                          // Add your edit logic here
                          updateSkillDialog(context, userProfile, skill);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete , color: Colors.red),
                        onPressed: () {
                          // Add your delete logic here
                          // Call your deleteSkill function
                          AuthService().deleteSkill(
                            context: context,
                            userId: user.id,
                            skillId: skill.id,
                          );
                          // Remove the skill from the UI
                          setState(() {
                            user.skills.remove(skill);
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AddSkillDialog(
                  onSkillAdded: (newSkill) {
                    setState(() {

                    });
                  },
                ),
              );
            },
            child: Text('Add New Skill'),
          )
          //  buildSkillRating(skill.rating) ,
        ],
      ),
    );
  }


  Widget buildSkillRating(int rating) {
    List<Widget> stars = [];
    for (int i = 0; i < 5; i++) {
      if (i < rating) {
        stars.add(Icon(Icons.star, color: Colors.yellow));
      } else {
        stars.add(Icon(Icons.star_border, color: Colors.yellow));
      }
    }
    return Row(children: stars);
  }

  Widget buildInterestsChips(User user) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Interests',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Wrap(
            children: selectedInterests.map((interest) {
              return Chip(
                label: Text(interest.title),
                onDeleted: () {
                  setState(() {
                    selectedInterests.remove(interest);
                  });
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InterestSelectionPage(),
                ),
              );

            },
            child: Text('Add Interest'),
          ),
        ],
      ),
    );
  }

  void updateSkillDialog(BuildContext context, User user, Skill skill) {
    TextEditingController skillNameController = TextEditingController(text: skill.skillName);
    TextEditingController ratingController = TextEditingController(text: skill.rating.toString());

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Skill'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: skillNameController,
              decoration: InputDecoration(labelText: 'Skill Name'),
            ),
            TextField(
              controller: ratingController,
              decoration: InputDecoration(labelText: 'Rating'),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              // Perform the skill update here
              await AuthService().updateSkill(
                context: context,
                userId: user.id,
                skillId: skill.id,
                skillName: skillNameController.text,
                rating: ratingController.text,
              );

              // Close the dialog
              Navigator.of(context).pop();

              // Reload the user profile to reflect the changes
              loadUserProfile();
            },
            child: Text('Update'),
          ),
        ],
      ),
    );
  }

  Widget buildCertificates(User user) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Certificates',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          for (var certificate in user.certificates)
            Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Certificate Name : " ,
                            style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12,
                            ),),
                          Text(certificate.certificateName),],
                      ),

                      Row(
                        children: [
                          Text("Issue Organization : " ,
                            style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12,
                            ),
                          ),
                          Text(certificate.issueOrganization),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit , color: Colors.green,),
                        onPressed: () {
                          // Implement your edit logic here
                          updateCertificateDialog(context, user, certificate);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete , color: Colors.red),
                        onPressed: () {
                          // Implement your pin logic here
                        },
                      ),

                    ],
                  ),
                ],
              ),
            ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              showDialog(
                context: context,
                builder: (context) => AddCertificateDialog(
                  onCertificateAdded: (newCertificate) {
                    setState(() {
                      user.certificates.add(newCertificate);
                    });
                  },
                ),
              );
            },
            child: Text('Add New Certificate'),
          ),
        ],
      ),
    );
  }

  // ...

  void updateCertificateDialog(BuildContext context, User user, Certificate certificate) {
    // Implement the update certificate dialog here
    // You can use a similar approach to the update skill dialog
  }

  Row _buildHeader(User user1) {
    return Row(
      children: <Widget>[
        const SizedBox(width: 20.0),
        SizedBox(
          width: 80.0,
          height: 80.0,
          child: CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey,
            backgroundImage: AssetImage('assets/your_image_asset.jpg'), // Replace 'your_image_asset.jpg' with your actual image asset path
          ),
        ),
        const SizedBox(width: 20.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              user1.fullName,
              //style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 10.0),
            Text(user1.major),
            SizedBox(height: 5.0),
            Row(
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.map,
                  size: 12.0,
                  color: Colors.black54,
                ),
                SizedBox(width: 10.0),
                Text(
                  user1.location,
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

}
Widget buildEducation(BuildContext context, User user) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 48),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Education',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        for (var education in user.education)
          Container(
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.deepPurple[50],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      education.schoolName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${education.startDate.year} - ${education.endDate.year}',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.green),
                      onPressed: () {
                        // Add your edit logic here
                        updateEducationDialog(context, user, education);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        // Add your delete logic here
                        // Call your deleteEducation function
                        AuthService().addEducation(
                          context: context,
                          userId: user.id,
                          schoolName: education.schoolName,
                          startDate: education.startDate,
                          endDate: education.endDate,
                          educationId: "",

                        );
                        // Remove the education from the UI
                        // setState(() {
                        //   user.education.remove(education);
                        // });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AddEducationDialog(
                onEducationAdded: (newEducation) {
                  // setState(() {
                  //   // Add education
                  // });
                },
              ),
            );
          },
          child: Text('Add New Education'),
        ),
      ],
    ),
  );
}




void updateEducationDialog(BuildContext context, User user, Education education) {
  // Similar to the updateSkillDialog, create a dialog to update education information.
}
