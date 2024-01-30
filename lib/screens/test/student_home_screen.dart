
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rive_animation/screens/cources/root_app.dart';
import 'package:rive_animation/screens/cources/theme/color.dart';
import 'package:rive_animation/utils/data.dart';
import 'package:rive_animation/screens/cources/widgets_cources/category_box.dart';
import 'package:rive_animation/screens/cources/widgets_cources/feature_item.dart';
import 'package:rive_animation/screens/cources/widgets_cources/notification_box.dart';
import 'package:rive_animation/screens/cources/widgets_cources/recommend_item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:standard_searchbar/new/standard_search_bar.dart';

import '../../model/User1.dart';
import '../../model/course.dart';
import '../../model/society.dart';
import '../../services/auth_service.dart';
import '../../services/society_auth_service.dart';
import '../../widget/posts.dart';
import '../cources/widgets_cources/feature_Item_student.dart';
import '../society/root_app_society.dart';


class home_student2 extends StatefulWidget {
  const home_student2({Key? key}) : super(key: key);
  @override
  _home_student2State createState() => _home_student2State();
}

class _home_student2State extends State<home_student2> {
  late SocietyAuthService _societyAuthService =SocietyAuthService() ;
  late User userhome = User(
    id: '',
    email: '',
    token: '',
    password: '',
    phoneNumber: '',
    fullName: '',
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

  TextEditingController _searchController = TextEditingController();
  late List<Course> courses = [];
  // late final Map<String, dynamic> currentCourse;
  late Society _society = Society(
    id: '',
    name: '',
    email: '',
    password: '', // Add other fields with appropriate default values
    members: [],
    followers: [],
    events: [],
    location: '',
    mission: '',
    vision: '',
    courses: [],
    recommendedTopics: [],
    joinRequestsOpenDate: DateTime.now(),
    membershipRequestsOpenDate: DateTime.now(),
    rate: 0.0,
    imgUrl: '',
  );


  @override
  void initState() {
    print('inside initState');
    _societyAuthService = SocietyAuthService();
    loaduser();
    // Remove the following line to avoid calling getAllCourses here
    // getAllCourses();
    super.initState();
  }


  void loaduser() async {
    try {
      print('inside load user');
      final AuthService authService = AuthService();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String userId = prefs.getString('userId') ?? '';

      if (userId.isNotEmpty) {
        final user1 = await authService.getUserProfile(
          context: context,
          userId: userId,
        );
        setState(() {
          userhome = user1;
          print('Succesfully load user ');
          print(userhome);
        });
      }
    } catch (e) {
      print(e);
    }
  }
  Future<void> getAllCourses() async {
    try {
      print('start getAllCourses ');
      final response = await _societyAuthService.getAllCourses();
       print('');
      if (response['success']) {
        print('inside succes ');

        final List<Course> allCourses = response['courses'];
        print('courses is  --- : ${response['courses']}');
        if (mounted) {
          setState(() {
            courses = allCourses;
          });
        }
      } else {
        // Handle error when fetching courses
        print('Error fetching courses: ${response['message']}');
      }
    } catch (e) {
      print('Error fetching courses: $e');
    }
  }
  Future<void> _refresh() async {
  //  await _getAllCourses(); // Add this line to refresh courses
    // Rebuild the entire page by pushing a new instance of HomePage
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => RootAppSociety()),
    );
  }



  // @override
  // Widget build(BuildContext context) {
  //   print('Widget build');
  //   return Scaffold(
  //     backgroundColor: AppColor.appBgColor,
  //     body: RefreshIndicator(
  //       onRefresh: _refresh,
  //       child: FutureBuilder(
  //
  //         future: getAllCourses(),
  //         builder: (context, snapshot) {
  //           print('  builder: (context, snapshot) ');
  //           if (snapshot.connectionState == ConnectionState.waiting) {
  //             return Center(child: CircularProgressIndicator());
  //           } else if (snapshot.hasError) {
  //             return Center(child: Text('Error: ${snapshot.error}'));
  //           } else {
  //             return CustomScrollView(
  //               slivers: [
  //                 SliverAppBar(
  //                   backgroundColor: AppColor.appBarColor,
  //                   pinned: true,
  //                   snap: true,
  //                   floating: true,
  //                   title: _buildAppBar(),
  //                 ),
  //                 SliverList(
  //                   delegate: SliverChildBuilderDelegate(
  //                         (context, index) => _buildBody(),
  //                     childCount: 1,
  //                   ),
  //                 ),
  //               ],
  //             );
  //           }
  //         },
  //       ),
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    print('Widget build');
    return Scaffold(
      backgroundColor: AppColor.appBgColor,
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: AppColor.appBarColor,
              pinned: true,
              snap: true,
              floating: true,
              title: _buildAppBar(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) => _buildBody(),
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildAppBar() {
    print('inside  build appbar ');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        Text(
          'Good Morning, '+ userhome.fullName,
          style: TextStyle(
            color: AppColor.textColor,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        // Padding(
      ],
    );
  }

  Widget _buildBody() {
    print('inside build bodey');
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCategories(),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
            child: Text(
              "Courses",
              style: TextStyle(
                color: AppColor.textColor,
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
          ),
          _buildFeatured(),
          const SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Trending posts",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: AppColor.textColor,
                  ),
                ),
                Text(
                  "See all",
                  style: TextStyle(fontSize: 14, color: AppColor.darker),
                ),
              ],
            ),
          ),
          // _buildRecommended(),
          Posts(),
        ],
      ),
    );
  }

  Widget _buildFeatured() {
    print('buildFeatured');
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 290,
            enlargeCenterPage: true,
            disableCenter: true,
            viewportFraction: .75,
          ),
          items: List.generate(
            courses.length,
                (index) {
              Course course1 = courses[index];
              return FeatureItemStudent(
                course: course1,
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  // Handle "See all" tap
                },
                child: Row(
                  children: [
                    Text(
                      "See all",
                      style: TextStyle(fontSize: 14, color: AppColor.darker),
                    ),
                    Icon(Icons.arrow_forward_ios, size: 16, color: AppColor.darker),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
  _buildCategories() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          categories.length,
              (index) => Padding(
            padding: const EdgeInsets.only(right: 15),
            child: CategoryBox(
              selectedColor: Colors.white,
              data: categories[index],
              onTap: null,
            ),
          ),
        ),
      ),
    );
  }
//   Widget _buildRecommended() {
//     return SingleChildScrollView(
//       padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: List.generate(
//           recommends.length,
//               (index) => Padding(
//             padding: const EdgeInsets.only(right: 10),
//             child: RecommendItem(
//               data: recommends[index],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
}
