import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rive_animation/screens/cources/root_app.dart';
import 'package:rive_animation/screens/cources/theme/color.dart';
import 'package:rive_animation/utils/data.dart';
import 'package:rive_animation/screens/cources/widgets_cources/category_box.dart';
import 'package:rive_animation/screens/cources/widgets_cources/feature_item.dart';
import 'package:rive_animation/screens/cources/widgets_cources/notification_box.dart';
import 'package:rive_animation/screens/cources/widgets_cources/recommend_item.dart';
import 'package:standard_searchbar/new/standard_search_bar.dart';

import '../../model/course.dart';
import '../../model/society.dart';
import '../../services/society_auth_service.dart';
import '../society/root_app_society.dart';
import 'All_Coueces_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SocietyAuthService _societyAuthService =SocietyAuthService() ;
  List<dynamic> coursestest = [];
  List<dynamic> filteredCourses = [];
  TextEditingController _searchController = TextEditingController();

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
    print('inside initState -');
    _societyAuthService = SocietyAuthService();
    _loadSocietyDetails();
    super.initState();
  }


  Future<void> _loadSocietyDetails() async {
    try {
      final societyId = await _societyAuthService.getSocietyId();
      if (societyId != null) {
        final result = await _societyAuthService.getSocietyDetails(societyId);
        if (result['success'] == true) {
          final societyDetails = result['societyDetails'];
          // _society = Society.fromMap(societyDetails);
          print('the result of society details is , $societyDetails');
          print('---------------------------------------------------------------');

          if (societyDetails != null) {
            print('inside success ');
            print('*****************society details from result ,  $societyDetails');
            // _society = Society.fromMap(societyDetails);
            // Now you can access properties safely
            final List<dynamic> courses = societyDetails['course'];
            coursestest = courses;
            // print('course length is ###################  ${courses.length} ');

            if (courses.isNotEmpty) {
              // print('current course is course is ************************##################### ');
              // print('Course at index################# 0:');

              // final Map<String, dynamic> currentCourse = courses[0];
              final Map<String, dynamic>  currentCourse = courses[0];

              if (currentCourse != null) {
                print('Name: inside load #################### ${currentCourse['name']}');
                print('Society ID: ${currentCourse['organization']}');
                print('image is  ===>>> ${currentCourse['name']}');
                // Access other properties as needed
              }
            }
          }
        } else {
          print('Error: ${result['message']}');
        }
      }
    } catch (e) {
      print('Error loading society details: $e');
    }
  }
  Future<void> _refresh() async {
    await _loadSocietyDetails();
    // Rebuild the entire page by pushing a new instance of HomePage
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => RootAppSociety()),
    );
  }
  void _filterCourses(String query) {
    if (query.isNotEmpty) {
      List<dynamic> searchResult = coursestest
          .where((course) =>
          course['name'].toString().toLowerCase().contains(query.toLowerCase()))
          .toList();
      setState(() {
        filteredCourses = searchResult;
      });
    } else {
      setState(() {
        filteredCourses = List.from(coursestest);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBgColor,
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: FutureBuilder(
          future: _loadSocietyDetails(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return CustomScrollView(
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
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        Text(
          'Good Morning, ${_society.name}',
          style: TextStyle(
            color: AppColor.textColor,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search for courses',
            ),
            onChanged: _filterCourses,
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                  "Recommended",
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
          _buildRecommended(),
        ],
      ),
    );
  }

  Widget _buildFeatured() {
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
            filteredCourses.isNotEmpty ? filteredCourses.length : coursestest.length,
                (index) {
              final Map<String, dynamic> currentCourse1 =
              filteredCourses.isNotEmpty ? filteredCourses[index] : coursestest[index];
              Course course1 = Course.fromMap(currentCourse1);
              return FeatureItem(
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FeaturedListPage(courses: coursestest),
                    ),
                  );
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

  Widget _buildRecommended() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          recommends.length,
              (index) => Padding(
            padding: const EdgeInsets.only(right: 10),
            child: RecommendItem(
              data: recommends[index],
            ),
          ),
        ),
      ),
    );
  }
}