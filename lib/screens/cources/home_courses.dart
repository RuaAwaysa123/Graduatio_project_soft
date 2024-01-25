//
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rive_animation/screens/cources/theme/color.dart';
import 'package:rive_animation/utils/data.dart';
import 'package:rive_animation/screens/cources/widgets_cources/category_box.dart';
import 'package:rive_animation/screens/cources/widgets_cources/feature_item.dart';
import 'package:rive_animation/screens/cources/widgets_cources/notification_box.dart';
import 'package:rive_animation/screens/cources/widgets_cources/recommend_item.dart';

import '../../model/society.dart';
import '../../services/society_auth_service.dart';
import 'All_Coueces_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SocietyAuthService _societyAuthService =SocietyAuthService() ;
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
    super.initState();
    _societyAuthService = SocietyAuthService();
    _loadSocietyDetails();
  }

  Future<void> _loadSocietyDetails() async {
    try {
      // Get society ID from shared preferences
      final societyId = await _societyAuthService.getSocietyId();

      // Print society ID for debugging
      print('Society ID: $societyId');

      // Check if society ID is available
      if (societyId != null && societyId.isNotEmpty) {
        // Retrieve society details using the society ID
        final result = await _societyAuthService.getSocietyDetails(societyId);
        print('the result is, ${result}!');
        print('---------------------------------------------------------------');
        print('the result of society details is , ${result['societyDetails']}!');


        if (result['success']) {
          // Update the state with the retrieved society details
          print('---------------------------------------------------------------');
          print("inside success ");

          setState(() {
            _society = Society.fromMap(result['societyDetails']);
            print('Good Morning, ${_society}!');
          });

          // Print society name for debugging
          print('Good Morning, ${_society.name}!');
        } else {
          // Print error message for debugging
          print('Error: ${result['message']}');
        }
      } else {
        // Print message if society ID is not available
        print('Society ID is not available');
      }
    } catch (e) {
      // Print error for debugging
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Use _society object to access society details in your UI
    return Scaffold(
      backgroundColor: AppColor.appBgColor,
      body: CustomScrollView(
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
          )
        ],
      ),
    );
  }


  Widget _buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(
                height: 5,
              ),
              Text(
                'Good Morning, ${_society.name}',
                style: TextStyle(
                  color: AppColor.textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        NotificationBox(
          notifiedNumber: 1,
        )
      ],
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //_buildCategories(),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
            child: Text(
              "Cources",
              style: TextStyle(
                color: AppColor.textColor,
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
          ),
          _buildFeatured(),
          const SizedBox(
            height: 15,
          ),
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
                      color: AppColor.textColor),
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
  _buildFeatured() {
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
            features.length,
                (index) => FeatureItem(
              data: features[index],
            ),
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
                  // Navigate to the page containing the featured items as a list
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FeaturedListPage(features: features),
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
  _buildRecommended() {
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
