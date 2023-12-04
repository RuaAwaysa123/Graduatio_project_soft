// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:rive_animation/screens/sign_up_screen/registration_success_screen.dart';
// import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';
//
// import '../Home/Button_Navigator.dart';
//
// class StudentRegistrationContinuation2Page extends StatefulWidget {
//   @override
//   _StudentRegistrationContinuation2PageState createState() =>
//       _StudentRegistrationContinuation2PageState();
// }
//
// class _StudentRegistrationContinuation2PageState
//     extends State<StudentRegistrationContinuation2Page> {
//
//   List<EducationInfo> educationList = [];
//   List<CertificateInfo> certificateList = [];
//
//   List<SkillInfo> skillList = [];
//   List<String> interests = [];
//   TextEditingController interestController = TextEditingController();
//
//   final ScrollController _listViewController = ScrollController();
//
//   double rating = 0.0; // Initial star rating value
//
//   TextEditingController skillNameController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Student Registration'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               // ... Other input fields
//               ElevatedButton(
//                 onPressed: () {
//                   _addEducation();
//                 },
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all(Colors.blue),
//                   minimumSize: MaterialStateProperty.all(
//                     Size(double.infinity, 40),
//                   ),
//                 ),
//                 child: Text('Add Education'),
//               ),
//               SizedBox(height: 8.0), // Add space
//               // Display education entries
//               // Text(
//               //   'Education Information:',
//               //   style: TextStyle(
//               //     fontSize: 18,
//               //     fontWeight: FontWeight.bold,
//               //   ),
//               // ),
//               SizedBox(height: 8.0),
//               Column(
//                 children: educationList
//                     .map((education) => _buildEducationItem(education))
//                     .toList(),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   _addCertificate();
//                 },
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all(Colors.blue.shade400),
//                   minimumSize: MaterialStateProperty.all(
//                     Size(double.infinity, 40),
//                   ),
//                 ),
//                 child: Text('Add Certificate'),
//               ),
//               SizedBox(height: 8.0), // Add space
//               // Display certificate entries
//               // Text(
//               //   'Certificate Information:',
//               //   style: TextStyle(
//               //     fontSize: 18,
//               //     fontWeight: FontWeight.bold,
//               //   ),
//               // ),
//               Column(
//                 children: certificateList
//                     .map((certificate) => _buildCertificateItem(certificate))
//                     .toList(),
//               ),
//               SizedBox(height: 16.0),
//               // Add skills
//               Text(
//                 'Add Skills',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blue,
//                 ),
//               ),
//               SizedBox(height: 8.0),
//               TextField(
//                 controller: skillNameController,
//                 decoration: InputDecoration(
//                   labelText: 'Skill Name',
//                   hintText: 'Enter skill name',
//                 ),
//               ),
//
//                   SizedBox(height: 16.0),
//               Row(
//                 children: [
//                   Text(
//                     'Experience Rate:',
//                     style: TextStyle(
//                       fontSize: 15 , // Adjust the font size as needed
//                       fontWeight: FontWeight.bold, // You can change the fontWeight
//                       color: Colors.black38, // Change the color of the text
//                     ),
//                   ),
//                   SizedBox(width: 15,),
//                   SmoothStarRating(
//                     allowHalfRating: false,
//                     onRatingChanged: (v) {
//                       rating = v;
//                       setState(() {});
//                     },
//                     starCount: 5,
//                     rating: rating,
//                     size: 30.0,
//                     filledIconData: Icons.star,
//                     halfFilledIconData: Icons.blur_on,
//                     color: Colors.amber,
//                     borderColor: Colors.amber,
//                     spacing: 0.0,
//                   ),
//                 ],
//               ),
//               SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: () {
//                   _addSkill();
//                 },
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all(Colors.blue),
//                   minimumSize: MaterialStateProperty.all(
//                     Size(double.infinity, 40),
//                   ),
//                 ),
//                 child: Text('Add Skill'),
//               ),
//               SizedBox(height: 16.0),
//               // Display skills
//               Text(
//                 'Skills Information:',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Column(
//                 children: skillList
//                     .map((skill) => _buildSkillItem(skill))
//                     .toList(),
//               ),
//
//               // Add Interests button
//               ElevatedButton(
//                 onPressed: () {
//                   _addInterests();
//                 },
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all(Colors.blue),
//                   minimumSize: MaterialStateProperty.all(
//                     Size(double.infinity, 40),
//                   ),
//                 ),
//                 child: Text('Add Interests'),
//               ),
//               SizedBox(height: 16.0),
//               // Display selected interests as Chips
//               Wrap(
//                 children: interests
//                     .map(
//                       (interest) => Chip(
//                     label: Text(interest),
//                     onDeleted: () {
//                       // Remove the interest when the "x" button is clicked
//                       _removeInterest(interest);
//                     },
//                   ),
//                 )
//                     .toList(),
//               ),
//
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => HomePage(),
//                     ),
//                   );
//
//
//                 },
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all(Colors.green),
//                   minimumSize: MaterialStateProperty.all(
//                     Size(double.infinity, 40),
//                   ),
//                 ),
//                 child: Text('Submit'),
//               ),
//
//
//
//             ],
//           ),
//         ),
//
//
//       ),
//
//
//     );
//
//
//   }
//
//   void _addInterests() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Add Interests'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: interestController,
//                 decoration: InputDecoration(
//                   labelText: 'Interest',
//                   hintText: 'Enter your interest',
//                 ),
//               ),
//             ],
//           ),
//           actions: [
//             ElevatedButton(
//               onPressed: () {
//                 String interest = interestController.text;
//                 if (interest.isNotEmpty) {
//                   setState(() {
//                     interests.add(interest);
//                   });
//                 }
//                 interestController.text = ''; // Clear the text field
//                 Navigator.of(context).pop();
//               },
//               child: Text('Add'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Cancel'),
//             ),
//
//
//           ],
//         );
//       },
//     );
//
//   }
//
//   void _removeInterest(String interest) {
//     setState(() {
//       interests.remove(interest);
//     });
//   }
//
//   void _addSkill() {
//     String skillName = skillNameController.text;
//     SkillInfo skill = SkillInfo(skillName: skillName, rating: rating);
//     setState(() {
//       skillList.add(skill);
//       skillNameController.text = ''; // Clear the text field
//       rating = 0.0; // Reset the rating
//     });
//   }
//
//   void _addEducation() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         TextEditingController schoolNameController = TextEditingController();
//         DateTime? startDate = DateTime.now();
//         DateTime? endDate = DateTime.now();
//
//         return AlertDialog(
//           title: Text('Add Education'),
//           content: Column( // Wrap the content with a Column
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: schoolNameController,
//                 decoration: InputDecoration(
//                   labelText: 'School Name',
//                   hintText: 'Enter school name',
//                 ),
//               ),
//               ListTile(
//                 title: Text("Start Date"),
//                 subtitle: Text("${startDate?.toLocal()}".split(' ')[0]),
//                 onTap: () async {
//                   DateTime? picked = await showDatePicker(
//                     context: context,
//                     initialDate: startDate ?? DateTime.now(),
//                     firstDate: DateTime(2000),
//                     lastDate: DateTime(2101),
//                   );
//                   if (picked != null)
//                     setState(() {
//                       startDate = picked;
//                     });
//                 },
//               ),
//               ListTile(
//                 title: Text("End Date"),
//                 subtitle: Text("${endDate?.toLocal()}".split(' ')[0]),
//                 onTap: () async {
//                   DateTime? picked = await showDatePicker(
//                     context: context,
//                     initialDate: endDate ?? DateTime.now(),
//                     firstDate: DateTime(2000),
//                     lastDate: DateTime(2101),
//                   );
//                   if (picked != null)
//                     setState(() {
//                       endDate = picked;
//                     });
//                 },
//               ),
//             ],
//           ),
//           actions: [
//             ElevatedButton(
//               onPressed: () {
//                 EducationInfo education = EducationInfo(
//                   schoolName: schoolNameController.text,
//                   startDate: startDate ?? DateTime.now(),
//                   endDate: endDate ?? DateTime.now(),
//                 );
//                 setState(() {
//                   educationList.add(education);
//                 });
//                 Navigator.of(context).pop();
//               },
//               child: Text('Add'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Cancel'),
//             ),
//           ],
//         );
//       },
//     );
//
//     // Scroll to the newly added item
//     _listViewController.animateTo(
//       _listViewController.position.maxScrollExtent,
//       duration: Duration(milliseconds: 500),
//       curve: Curves.easeInOut,
//     );
//   }
//
//   Widget _buildEducationItem(EducationInfo education) {
//     return Dismissible(
//       key: UniqueKey(),
//       onDismissed: (direction) {
//         setState(() {
//           educationList.remove(education);
//         });
//       },
//       background: Container(
//         color: Colors.red,
//         child: Icon(
//           Icons.delete,
//           color: Colors.white,
//           size: 40,
//         ),
//         alignment: Alignment.centerRight,
//         padding: EdgeInsets.only(right: 20),
//       ),
//       secondaryBackground: Container(
//         color: Colors.green,
//         child: Icon(
//           Icons.edit,
//           color: Colors.white,
//           size: 40,
//         ),
//         alignment: Alignment.centerLeft,
//         padding: EdgeInsets.only(left: 20),
//       ),
//       child: Card(
//         elevation: 2,
//         margin: EdgeInsets.symmetric(vertical: 8.0),
//         child: ListTile(
//           title: Text('School: ${education.schoolName}'),
//           subtitle: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('Start Date: ${education.startDate.toString()}'),
//               Text('End Date: ${education.endDate.toString()}'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _addCertificate() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         TextEditingController certificateNameController = TextEditingController();
//         TextEditingController certificateURLController = TextEditingController();
//         TextEditingController issueOrganizationController = TextEditingController();
//
//         return AlertDialog(
//           title: Text('Add Certificate'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: certificateNameController,
//                 decoration: InputDecoration(
//                   labelText: 'Certificate Name',
//                   hintText: 'Enter certificate name',
//                   prefixIcon: Icon(Icons.title), // Add prefix icon
//                 ),
//               ),
//               TextField(
//                 controller: certificateURLController,
//                 decoration: InputDecoration(
//                   labelText: 'Certificate URL',
//                   hintText: 'Enter certificate URL',
//                   prefixIcon: Icon(Icons.link), // Add prefix icon
//                 ),
//               ),
//               TextField(
//                 controller: issueOrganizationController,
//                 decoration: InputDecoration(
//                   labelText: 'Issue Organization',
//                   hintText: 'Enter issue organization',
//                   prefixIcon: Icon(Icons.business), // Add prefix icon
//                 ),
//               ),
//             ],
//           ),
//           actions: [
//             ElevatedButton(
//               onPressed: () {
//                 CertificateInfo certificate = CertificateInfo(
//                   certificateName: certificateNameController.text,
//                   certificateURL: certificateURLController.text,
//                   issueOrganization: issueOrganizationController.text,
//                 );
//                 setState(() {
//                   certificateList.add(certificate);
//                 });
//                 Navigator.of(context).pop();
//               },
//               child: Text('Add'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Cancel'),
//             ),
//           ],
//         );
//       },
//     );
//
//     // Scroll to the newly added item
//     _listViewController.animateTo(
//       _listViewController.position.maxScrollExtent,
//       duration: Duration(milliseconds: 500),
//       curve: Curves.easeInOut,
//     );
//   }
//
//   Widget _buildCertificateItem(CertificateInfo certificate) {
//     return Dismissible(
//       key: UniqueKey(),
//       onDismissed: (direction) {
//         setState(() {
//           certificateList.remove(certificate);
//         });
//       },
//       background: Container(
//         color: Colors.red,
//         child: Icon(
//           Icons.delete,
//           color: Colors.white,
//           size: 40,
//         ),
//         alignment: Alignment.centerRight,
//         padding: EdgeInsets.only(right: 20),
//       ),
//       secondaryBackground: Container(
//         color: Colors.blue,
//         child: Icon(
//           Icons.edit,
//           color: Colors.white,
//           size: 40,
//         ),
//         alignment: Alignment.centerLeft,
//         padding: EdgeInsets.only(left: 20),
//       ),
//       child: Card(
//         elevation: 2,
//         margin: EdgeInsets.symmetric(vertical: 8.0),
//         child: ListTile(
//           title: Text('Certificate Name: ${certificate.certificateName}'),
//           subtitle: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('Certificate URL: ${certificate.certificateURL}'),
//               Text('Issue Organization: ${certificate.issueOrganization}'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSkillItem(SkillInfo skill) {
//     return Dismissible(
//       key: UniqueKey(),
//       onDismissed: (direction) {
//         setState(() {
//           skillList.remove(skill);
//         });
//       },
//       background: Container(
//         color: Colors.red,
//         child: Icon(
//           Icons.delete,
//           color: Colors.white,
//           size: 40,
//         ),
//         alignment: Alignment.centerRight,
//         padding: EdgeInsets.only(right: 20),
//       ),
//       secondaryBackground: Container(
//         color: Colors.blue,
//         child: Icon(
//           Icons.edit,
//           color: Colors.white,
//           size: 40,
//         ),
//         alignment: Alignment.centerLeft,
//         padding: EdgeInsets.only(left: 20),
//       ),
//       child: Card(
//         elevation: 2,
//         margin: EdgeInsets.symmetric(vertical: 8.0),
//         child: ListTile(
//           title: Text('Skill: ${skill.skillName}'),
//           subtitle: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('Rating: ${skill.rating.toStringAsFixed(1)} out of 5'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//
// }
//
// class EducationInfo {
//   final String schoolName;
//   final DateTime startDate;
//   final DateTime endDate;
//
//   EducationInfo({
//     required this.schoolName,
//     required this.startDate,
//     required this.endDate,
//   });
// }
//
// class CertificateInfo {
//   final String certificateName;
//   final String certificateURL;
//   final String issueOrganization;
//
//   CertificateInfo({
//     required this.certificateName,
//     required this.certificateURL,
//     required this.issueOrganization,
//   });
//
//
//
// }
//
// class SkillInfo {
//   final String skillName;
//   final double rating;
//
//   SkillInfo({
//     required this.skillName,
//     required this.rating,
//   });
// }
//--------------------------------------------------------------------------


import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:rive_animation/screens/sign_up_screen/registration_success_screen.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';

import '../../model/User1.dart';
import '../../providers/user_provider.dart';
import '../../services/auth_service.dart';
import '../Home/Button_Navigator.dart';

class StudentRegistrationContinuation2Page extends StatefulWidget {
  @override
  _StudentRegistrationContinuation2PageState createState() =>
      _StudentRegistrationContinuation2PageState();
}

class _StudentRegistrationContinuation2PageState
    extends State<StudentRegistrationContinuation2Page> {

  List<EducationInfo> educationList = [];
  List<CertificateInfo> certificateList = [];

  List<SkillInfo> skillList = [];
  // List<InterestInfo> interests = [];
  List<String> interests = [];

  TextEditingController interestController = TextEditingController();

  final ScrollController _listViewController = ScrollController();

  double rating = 0.0; // Initial star rating value

  TextEditingController skillNameController = TextEditingController();

  final AuthService _authService = AuthService();

  // Function to add education
  void _addEducation1() async {
    EducationInfo? education = await _showEducationDialog();
    if (education != null) {
      // Assuming you have a userProvider instance available
      // User user = Provider.of<UserProvider>(context, listen: false).user;
      _authService.addEducation(
        context: context,
        userId: '65553b04c5b0a3f543d7241d',
        schoolName: education.schoolName,
        startDate: education.startDate.toString(),
        endDate: education.endDate.toString(),
      );
      setState(() {
        educationList.add(education);
      });
    }
  }


  Future<EducationInfo?> _showEducationDialog() async {
    TextEditingController schoolNameController = TextEditingController();
    DateTime startDate = DateTime.now();
    DateTime endDate = DateTime.now();

    return showDialog<EducationInfo>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Education'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: schoolNameController,
                decoration: InputDecoration(
                  labelText: 'School Name',
                  hintText: 'Enter school name',
                ),
              ),
              ListTile(
                title: Text("Start Date"),
                subtitle: Text("${startDate.toLocal()}".split(' ')[0]),
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: startDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (picked != null && picked != startDate) {
                    setState(() {
                      startDate = picked;
                    });
                  }
                },
              ),
              ListTile(
                title: Text("End Date"),
                subtitle: Text("${endDate.toLocal()}".split(' ')[0]),
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: endDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (picked != null && picked != endDate) {
                    setState(() {
                      endDate = picked;
                    });
                  }
                },
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(
                  EducationInfo(
                    schoolName: schoolNameController.text,
                    startDate: startDate,
                    endDate: endDate,
                  ),
                );
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }




  // Function to add certificate
  void _addCertificate1() async {
    CertificateInfo? certificate = await _showCertificateDialog();
    if (certificate != null) {
      User user = Provider.of<UserProvider>(context, listen: false).user;
      _authService.addCertificate(
        context: context,
        // userId: user.id,
        userId: '6552903da53ac82e5a38d783',
        certificateName: certificate.certificateName,
        certificateURL: certificate.certificateURL,
        issueOrganization: certificate.issueOrganization,
      );
    }
  }

  // Update _showCertificateDialog to use the same approach as _addCertificate
  Future<CertificateInfo?> _showCertificateDialog() async {
    TextEditingController certificateNameController = TextEditingController();
    TextEditingController certificateURLController = TextEditingController();
    TextEditingController issueOrganizationController = TextEditingController();

    return showDialog<CertificateInfo>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Certificate'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: certificateNameController,
                decoration: InputDecoration(
                  labelText: 'Certificate Name',
                  hintText: 'Enter certificate name',
                  prefixIcon: Icon(Icons.title), // Add prefix icon
                ),
              ),
              TextField(
                controller: certificateURLController,
                decoration: InputDecoration(
                  labelText: 'Certificate URL',
                  hintText: 'Enter certificate URL',
                  prefixIcon: Icon(Icons.link), // Add prefix icon
                ),
              ),
              TextField(
                controller: issueOrganizationController,
                decoration: InputDecoration(
                  labelText: 'Issue Organization',
                  hintText: 'Enter issue organization',
                  prefixIcon: Icon(Icons.business), // Add prefix icon
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                CertificateInfo certificate = CertificateInfo(
                  certificateName: certificateNameController.text,
                  certificateURL: certificateURLController.text,
                  issueOrganization: issueOrganizationController.text,
                );
                setState(() {
                  certificateList.add(certificate);
                });
                Navigator.of(context).pop(certificate);
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  // ***************************************************
  // Modify _showSkillDialog to directly add skill without a separate dialog
  // Future<void> _addSkill1() async {
  //
  //
  //   await showDialog<void>(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Add Skill'),
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             TextField(
  //               controller: skillNameController,
  //               decoration: InputDecoration(
  //                 labelText: 'Skill Name',
  //                 hintText: 'Enter skill name',
  //               ),
  //             ),
  //             SizedBox(height: 16.0),
  //             Row(
  //               children: [
  //                 Text(
  //                   'Rating:',
  //                   style: TextStyle(
  //                     fontSize: 15,
  //                     fontWeight: FontWeight.bold,
  //                     color: Colors.black38,
  //                   ),
  //                 ),
  //                 SizedBox(width: 15),
  //                 SmoothStarRating(
  //                   allowHalfRating: false,
  //                   onRatingChanged: (v) {
  //                     rating = v;
  //                   },
  //                   starCount: 5,
  //                   rating: rating,
  //                   size: 30.0,
  //                   filledIconData: Icons.star,
  //                   halfFilledIconData: Icons.blur_on,
  //                   color: Colors.amber,
  //                   borderColor: Colors.amber,
  //                   spacing: 0.0,
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //         actions: [
  //           ElevatedButton(
  //             onPressed: () {
  //               // Add the skill directly without a separate dialog
  //               String skillName = skillNameController.text;
  //               SkillInfo skill = SkillInfo(skillName: skillName, rating: rating);
  //               setState(() {
  //                 skillList.add(skill);
  //               });
  //               Navigator.of(context).pop();
  //             },
  //             child: Text('Add'),
  //           ),
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: Text('Cancel'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  //************************************************************


  // Function to add skill
  void _addSkill1() async {
    SkillInfo? skill = await _showSkillDialog();
    if (skill != null) {
      User user = Provider.of<UserProvider>(context, listen: false).user;
      _authService.addSkill(
        context: context,
        userId: '6552903da53ac82e5a38d783',
        skillName: skill.skillName,
        rating: skill.rating.toString(),
      );
    }
  }
  //
  Future<SkillInfo?> _showSkillDialog() async {
    TextEditingController skillNameController = TextEditingController();
    double rating = 0.0;

    return showDialog<SkillInfo>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Skill'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: skillNameController,
                decoration: InputDecoration(
                  labelText: 'Skill Name',
                  hintText: 'Enter skill name',
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Text(
                    'Rating:',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38,
                    ),
                  ),
                  SizedBox(width: 15),
                  SmoothStarRating(
                    allowHalfRating: false,
                    onRatingChanged: (v) {
                      rating = v;
                    },
                    starCount: 5,
                    rating: rating,
                    size: 30.0,
                    filledIconData: Icons.star,
                    halfFilledIconData: Icons.blur_on,
                    color: Colors.amber,
                    borderColor: Colors.amber,
                    spacing: 0.0,
                  ),
                ],
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(
                  SkillInfo(
                    skillName: skillNameController.text,
                    rating: rating,
                  ),
                );
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }


  // Function to add interest
  void _addInterests1() async {
    InterestInfo? interest = await _showInterestDialog();
    if (interest != null) {
      User user = Provider.of<UserProvider>(context, listen: false).user;
      _authService.addInterest(
        context: context,
        userId: '6552903da53ac82e5a38d783',
        title: interest.title,
        description: interest.description,
      );
    }
  }

  Future<InterestInfo?> _showInterestDialog() async {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    return showDialog<InterestInfo>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Interest'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  hintText: 'Enter interest title',
                ),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  hintText: 'Enter interest description',
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                InterestInfo interest = InterestInfo(
                  title: titleController.text,
                  description: descriptionController.text,
                );
                setState(() {
                  interests.add(interest.title); // Assuming you want to display only titles
                });
                Navigator.of(context).pop(interest);
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Registration'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // ... Other input fields
              ElevatedButton(
                onPressed: () {
                  _addEducation1();
                  // _addEducation();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  minimumSize: MaterialStateProperty.all(
                    Size(double.infinity, 40),
                  ),
                ),
                child: Text('Add Education'),
              ),
              SizedBox(height: 8.0), // Add space
              // Display education entries
              // Text(
              //   'Education Information:',
              //   style: TextStyle(
              //     fontSize: 18,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              SizedBox(height: 8.0),
              Column(
                children: educationList
                    .map((education) => _buildEducationItem(education))
                    .toList(),
              ),
              ElevatedButton(
                onPressed: () {
                  _addCertificate1();
                  // _addCertificate();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue.shade400),
                  minimumSize: MaterialStateProperty.all(
                    Size(double.infinity, 40),
                  ),
                ),
                child: Text('Add Certificate'),
              ),
              SizedBox(height: 8.0), // Add space
              // Display certificate entries
              // Text(
              //   'Certificate Information:',
              //   style: TextStyle(
              //     fontSize: 18,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              Column(
                children: certificateList
                    .map((certificate) => _buildCertificateItem(certificate))
                    .toList(),
              ),
              SizedBox(height: 16.0),
              // Add skills
              Text(
                'Add Skills',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 8.0),
              TextField(
                controller: skillNameController,
                decoration: InputDecoration(
                  labelText: 'Skill Name',
                  hintText: 'Enter skill name',
                ),
              ),

              SizedBox(height: 16.0),
              Row(
                children: [
                  Text(
                    'Experience Rate:',
                    style: TextStyle(
                      fontSize: 15 , // Adjust the font size as needed
                      fontWeight: FontWeight.bold, // You can change the fontWeight
                      color: Colors.black38, // Change the color of the text
                    ),
                  ),
                  SizedBox(width: 15,),
                  SmoothStarRating(
                    allowHalfRating: false,
                    onRatingChanged: (v) {
                      rating = v;
                      setState(() {});
                    },
                    starCount: 5,
                    rating: rating,
                    size: 30.0,
                    filledIconData: Icons.star,
                    halfFilledIconData: Icons.blur_on,
                    color: Colors.amber,
                    borderColor: Colors.amber,
                    spacing: 0.0,
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  _addSkill1();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  minimumSize: MaterialStateProperty.all(
                    Size(double.infinity, 40),
                  ),
                ),
                child: Text('Add Skill'),
              ),
              SizedBox(height: 16.0),
              // Display skills
              Text(
                'Skills Information:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: skillList
                    .map((skill) => _buildSkillItem(skill))
                    .toList(),
              ),

              // Add Interests button
              ElevatedButton(
                onPressed: () {
                  _addInterests1();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  minimumSize: MaterialStateProperty.all(
                    Size(double.infinity, 40),
                  ),
                ),
                child: Text('Add Interests'),
              ),
              SizedBox(height: 16.0),
              // Display selected interests as Chips
              Wrap(
                children: interests
                    .map(
                      (interest) => Chip(
                    label: Text(interest),
                    onDeleted: () {
                      // Remove the interest when the "x" button is clicked
                      _removeInterest(interest);
                    },
                  ),
                )
                    .toList(),
              ),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegistrationSuccessScreen(userType: '1',),
                    ),
                  );


                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  minimumSize: MaterialStateProperty.all(
                    Size(double.infinity, 40),
                  ),
                ),
                child: Text('Submit'),
              ),



            ],
          ),
        ),


      ),


    );


  }

  void _addInterests() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Interests'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: interestController,
                decoration: InputDecoration(
                  labelText: 'Interest',
                  hintText: 'Enter your interest',
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                String interest = interestController.text;
                if (interest.isNotEmpty) {
                  setState(() {
                    interests.add(interest);
                  });
                }
                interestController.text = ''; // Clear the text field
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),


          ],
        );
      },
    );

  }

  void _removeInterest(String interest) {
    setState(() {
      interests.remove(interest);
    });
  }

  void _addSkill() {
    String skillName = skillNameController.text;
    SkillInfo skill = SkillInfo(skillName: skillName, rating: rating);
    setState(() {
      skillList.add(skill);
      skillNameController.text = ''; // Clear the text field
      rating = 0.0; // Reset the rating
    });
  }

  void _addEducation() {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController schoolNameController = TextEditingController();
        DateTime? startDate = DateTime.now();
        DateTime? endDate = DateTime.now();

        return AlertDialog(
          title: Text('Add Education'),
          content: Column( // Wrap the content with a Column
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: schoolNameController,
                decoration: InputDecoration(
                  labelText: 'School Name',
                  hintText: 'Enter school name',
                ),
              ),
              ListTile(
                title: Text("Start Date"),
                subtitle: Text("${startDate?.toLocal()}".split(' ')[0]),
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: startDate ?? DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (picked != null)
                    setState(() {
                      startDate = picked;
                    });
                },
              ),
              ListTile(
                title: Text("End Date"),
                subtitle: Text("${endDate?.toLocal()}".split(' ')[0]),
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: endDate ?? DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (picked != null)
                    setState(() {
                      endDate = picked;
                    });
                },
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                EducationInfo education = EducationInfo(
                  schoolName: schoolNameController.text,
                  startDate: startDate ?? DateTime.now(),
                  endDate: endDate ?? DateTime.now(),
                );
                setState(() {
                  educationList.add(education);
                });
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );

    // Scroll to the newly added item
    _listViewController.animateTo(
      _listViewController.position.maxScrollExtent,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  Widget _buildEducationItem(EducationInfo education) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        setState(() {
          educationList.remove(education);
        });
      },
      background: Container(
        color: Colors.red,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
      ),
      secondaryBackground: Container(
        color: Colors.green,
        child: Icon(
          Icons.edit,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 20),
      ),
      child: Card(
        elevation: 2,
        margin: EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          title: Text('School: ${education.schoolName}'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Start Date: ${education.startDate.toString()}'),
              Text('End Date: ${education.endDate.toString()}'),
            ],
          ),
        ),
      ),
    );
  }

  void _addCertificate() {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController certificateNameController = TextEditingController();
        TextEditingController certificateURLController = TextEditingController();
        TextEditingController issueOrganizationController = TextEditingController();

        return AlertDialog(
          title: Text('Add Certificate'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: certificateNameController,
                decoration: InputDecoration(
                  labelText: 'Certificate Name',
                  hintText: 'Enter certificate name',
                  prefixIcon: Icon(Icons.title), // Add prefix icon
                ),
              ),
              TextField(
                controller: certificateURLController,
                decoration: InputDecoration(
                  labelText: 'Certificate URL',
                  hintText: 'Enter certificate URL',
                  prefixIcon: Icon(Icons.link), // Add prefix icon
                ),
              ),
              TextField(
                controller: issueOrganizationController,
                decoration: InputDecoration(
                  labelText: 'Issue Organization',
                  hintText: 'Enter issue organization',
                  prefixIcon: Icon(Icons.business), // Add prefix icon
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                CertificateInfo certificate = CertificateInfo(
                  certificateName: certificateNameController.text,
                  certificateURL: certificateURLController.text,
                  issueOrganization: issueOrganizationController.text,
                );
                setState(() {
                  certificateList.add(certificate);
                });
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );

    // Scroll to the newly added item
    _listViewController.animateTo(
      _listViewController.position.maxScrollExtent,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  Widget _buildCertificateItem(CertificateInfo certificate) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        setState(() {
          certificateList.remove(certificate);
        });
      },
      background: Container(
        color: Colors.red,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
      ),
      secondaryBackground: Container(
        color: Colors.blue,
        child: Icon(
          Icons.edit,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 20),
      ),
      child: Card(
        elevation: 2,
        margin: EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          title: Text('Certificate Name: ${certificate.certificateName}'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Certificate URL: ${certificate.certificateURL}'),
              Text('Issue Organization: ${certificate.issueOrganization}'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkillItem(SkillInfo skill) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        setState(() {
          skillList.remove(skill);
        });
      },
      background: Container(
        color: Colors.red,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
      ),
      secondaryBackground: Container(
        color: Colors.blue,
        child: Icon(
          Icons.edit,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 20),
      ),
      child: Card(
        elevation: 2,
        margin: EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          title: Text('Skill: ${skill.skillName}'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Rating: ${skill.rating.toStringAsFixed(1)} out of 5'),
            ],
          ),
        ),
      ),
    );
  }


}

class EducationInfo {
  final String schoolName;
  final DateTime startDate;
  final DateTime endDate;

  EducationInfo({
    required this.schoolName,
    required this.startDate,
    required this.endDate,
  });
}

class CertificateInfo {
  final String certificateName;
  final String certificateURL;
  final String issueOrganization;

  CertificateInfo({
    required this.certificateName,
    required this.certificateURL,
    required this.issueOrganization,
  });



}

class SkillInfo {
  final String skillName;
  final double rating;

  SkillInfo({
    required this.skillName,
    required this.rating,
  });
}
class InterestInfo {
  final String title;
  final String description;

  InterestInfo({
    required this.title,
    required this.description,
  });
}
