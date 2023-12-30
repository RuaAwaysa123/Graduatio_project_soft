import 'package:flutter/material.dart';
import 'package:rive_animation/widget/popular_topics.dart';
import 'package:rive_animation/widget/posts.dart';
import 'package:rive_animation/widget/top_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/User1.dart';
import '../../services/auth_service.dart';
//import 'package:themify_flutter/themify_flutter.dart';

class HomePage1 extends StatefulWidget {

  @override
  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  // Define a list of popular topics

  List<String> popularTopics = ['Topic 1', 'Topic 2', 'Topic 3'];
  late User userhome = User(
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
  @override
  void initState() {
    super.initState();
    loaduser();
  }

  void loaduser() async {
    try {
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
        });
      }
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
          child: ListView(
            children: <Widget>[
              Container(
                height: 160,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.blue,  //Theme.of(context).primaryColor,
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Hi "+userhome.fullName,
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Expanded( // Wrap the Row with Expanded
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Find Topics you like to read",
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 14.0,
                              ),
                            ),
                            Icon(
                              Icons.search,
                              size: 20,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35.0),
                  topRight: Radius.circular(35.0)
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TopBar(),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      "Popular Topics",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                    ),
                  ),
                  PopularTopics(),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, top: 20.0, bottom: 10.0),
                    child: Text(
                      "Trending Posts",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Posts()
                ],
              )
            )
          ],
        )
      ),
    );
  }
}

