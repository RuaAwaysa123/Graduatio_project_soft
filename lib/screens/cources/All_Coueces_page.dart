// // import 'package:flutter/material.dart';
// // import 'package:rive_animation/screens/cources/widgets_cources/feature_item.dart';
// //
// // import '../../widget/chat_wedgets/widgets.dart';
// // import '../../widget/constans/colors.dart';
// // import 'Cource_info.dart';
// //
// // class FeaturedListPage extends StatelessWidget {
// //   final List features;
// //
// //   FeaturedListPage({required this.features});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: primary ,
// //         title: Text("All cources" ,),
// //       ),
// //       body: ListView.builder(
// //         itemCount: features.length,
// //         itemBuilder: (context, index) {
// //           return Padding(
// //             padding: const EdgeInsets.all(8.0),
// //             child: FeatureItem(data: features[index]),
// //           );
// //         },
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         backgroundColor: Colors.blue,
// //         onPressed: () {
// //           // Create an instance of AddFeaturePage and navigate to it
// //           Navigator.push(
// //             context,
// //             MaterialPageRoute(
// //               builder: (context) => AddCourse(), // Use AddFeaturePage() instead of AddFeaturePage
// //           //
// //             ),
// //           );
// //         },
// //         child: Icon(Icons.add, color: Colors.white),
// //       ),
// //     );
// //   }
// // }
// // import 'package:flutter/material.dart';
// // import 'package:rive_animation/screens/cources/widgets_cources/feature_item.dart';
// //
// // import '../../widget/chat_wedgets/widgets.dart';
// // import 'Cource_info.dart';
// //
// //
// //
// // class FeaturedListPage extends StatelessWidget {
// //   final List features;
// //   FeaturedListPage({required this.features});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Colors.white,
// //         title: Text("Featured Items" ,),
// //       ),
// //       body: ListView.builder(
// //         itemCount: features.length,
// //         itemBuilder: (context, index) {
// //           return Padding(
// //             padding: const EdgeInsets.all(8.0),
// //             child: FeatureItem(data: features[index]),
// //           );
// //         },
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         backgroundColor: Colors.blue,
// //         onPressed: () {
// //           // Create an instance of AddFeaturePage and navigate to it
// //           Navigator.push(
// //             context,
// //             MaterialPageRoute(
// //               builder: (context) => AddCourse(), // Use AddFeaturePage() instead of AddFeaturePage
// //             ),
// //           );
// //         },
// //         child: Icon(Icons.add, color: Colors.white),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:rive_animation/model/course.dart';
// import 'package:rive_animation/screens/cources/widgets_cources/feature_item.dart';
//
// import '../../model/society.dart';
// import '../../services/society_auth_service.dart';
// import '../../widget/chat_wedgets/widgets.dart';
// import 'Cource_info.dart';
//
// class FeaturedListPage extends StatefulWidget {
//   late final List<dynamic> courses;
//   FeaturedListPage({required this.courses});
//
//   @override
//   _FeaturedListPageState createState() => _FeaturedListPageState();
// }
//
// class _FeaturedListPageState extends State<FeaturedListPage> {
//   late SocietyAuthService _societyAuthService =SocietyAuthService() ;
//
//   late Society _society = Society(
//     id: '',
//     name: '',
//     email: '',
//     password: '', // Add other fields with appropriate default values
//     members: [],
//     followers: [],
//     events: [],
//     location: '',
//     mission: '',
//     vision: '',
//     courses: [],
//     recommendedTopics: [],
//     joinRequestsOpenDate: DateTime.now(),
//     membershipRequestsOpenDate: DateTime.now(),
//     rate: 0.0,
//     imgUrl: '',
//   );
//
//
//   @override
//   void initState() {
//     super.initState();
//     _societyAuthService = SocietyAuthService();
//     _loadSocietyDetails();
//   }
//
//   Future<void> _loadSocietyDetails() async {
//     try {
//       // Get society ID from shared preferences
//       final societyId = await _societyAuthService.getSocietyId();
//
//       // Print society ID for debugging
//       print('Society ID: $societyId');
//
//       // Check if society ID is available
//       if (societyId != null && societyId.isNotEmpty) {
//         // Retrieve society details using the society ID
//         final result = await _societyAuthService.getSocietyDetails(societyId);
//         // print('the result is (((((((((((((((((((((((((, ${result['societyDetails']['corses[0]']}!');
//         print('---------------------------------------------------------------');
//         print('the result of society details is , ${result['societyDetails']}!');
//
//
//         if (result['success']) {
//           // Update the state with the retrieved society details
//           print('---------------------------------------------------------------');
//           print("inside success ");
//
//           setState(() {
//             _society = Society.fromMap(result['societyDetails']);
//             print('Good Morning, ${_society}!');
//             print('---------------------------------------------------------------');
//             print('_Society name  ++++++++++++++++++++++++++ : , ${_society.name}!');
//           });
//
//           // Print society name for debugging
//           print('Good Morning, ${_society.name}!');
//         } else {
//           // Print error message for debugging
//           print('Error: ${result['message']}');
//         }
//       } else {
//         // Print message if society ID is not available
//         print('Society ID is not available');
//       }
//     } catch (e) {
//       // Print error for debugging
//       print('Error: $e');
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//
//         title: Text("Featured Items"),
//       ),
//       body: ListView.builder(
//         itemCount: _society.courses.length,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//
//            // child: FeatureItem(course: _society.courses[index]),//widget.features[index]
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.blue,
//         onPressed: () {
//           // Create an instance of AddFeaturePage and navigate to it
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => AddCourse(), // Use AddFeaturePage() instead of AddFeaturePage
//             ),
//           );
//         },
//         child: Icon(Icons.add, color: Colors.white),
//       ),
//     );
//   }
// }
