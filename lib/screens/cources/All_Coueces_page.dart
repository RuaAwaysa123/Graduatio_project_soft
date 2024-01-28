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
//
//
//
//   @override
//   void initState() {
//     super.initState();
//     _societyAuthService = SocietyAuthService();
//     _loadSocietyDetails();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//
//         title: Text("Featured Items"),
//       ),
//       body: ListView.builder(
//         itemCount: ,
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
import 'package:flutter/material.dart';
import 'package:rive_animation/model/course.dart';
import 'package:rive_animation/screens/cources/widgets_cources/feature_item.dart';
import '../../services/society_auth_service.dart';
import 'Cource_info.dart';

class FeaturedListPage extends StatefulWidget {
  late final List<dynamic> courses;
  FeaturedListPage({required this.courses});

  @override
  _FeaturedListPageState createState() => _FeaturedListPageState();
}

class _FeaturedListPageState extends State<FeaturedListPage> {
  late SocietyAuthService _societyAuthService = SocietyAuthService();

  Future<void> _refresh() async {
    // Implement your refresh logic here if needed
    // You can call any method or load data again
    // For now, let's just delay for 1 second
    await Future.delayed(Duration(seconds: 1));
    // Set the state to rebuild the UI
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Featured Items"),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: ListView.builder(
          itemCount: widget.courses.length,
          itemBuilder: (context, index) {
            final Map<String, dynamic> currentCourse = widget.courses[index];
            Course course = Course.fromMap(currentCourse);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: FeatureItem(course: course),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddCourse(),
            ),
          );
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
