import 'package:flutter/material.dart';
import 'package:rive_animation/screens/profile_test/pages/post_Screen.dart';
import '../../../facebook/calender.dart';
import '../widgets/user_activity_info.dart';
import '../widgets/user_info_widget.dart';
import '../widgets/user_profile_image.dart';
import 'articles_Screen.dart';
import 'gallery_Screen.dart';

class MyHomePageTest extends StatefulWidget {
  MyHomePageTest({required Key key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageTestState createState() => _MyHomePageTestState();
}

class _MyHomePageTestState extends State<MyHomePageTest> {
  int _selectedEvent = 0;

  List<Widget> _pages = [GalleryScreen(), PostScreentest(), ArticlesScreen()];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildUserImage(size),

              // * 3 user Name
              buildUserInfo(),

              //* 4 total no. of posts, followers, following (Row Widget)
              buildUserActivity(),

              // * 5 follow and message button (Row widget)
              buildUserEvents(size),

              // *
              _pages[_selectedEvent],
            ],
          ),
        ),
      ),
    );
  }



  Container buildUserEvents(Size size) {
    return Container(
      // color: Colors.grey.shade100,
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: size.width / 1.8,
              padding: EdgeInsets.all(8),
              child: MaterialButton(
                elevation: 0.5,
                shape: RoundedRectangleBorder(
                    // borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blue.shade700)),
                color:
                    _selectedEvent == 0 ? Colors.blue.shade700 : Colors.white,
                onPressed: () {
                  setState(() {
                    _selectedEvent = 0;
                  });
                },
                child: Text("Events",
                    style: TextStyle(
                      color: _selectedEvent == 0
                          ? Colors.white
                          : Colors.blue.shade700,
                    )),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: size.width / 1.8,
              padding: EdgeInsets.all(8),
              child: MaterialButton(
                elevation: 0.5,
                shape: RoundedRectangleBorder(
                    // borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blue.shade700)),
                color:
                    _selectedEvent == 1 ? Colors.blue.shade700 : Colors.white,
                onPressed: () {
                  setState(() {
                    _selectedEvent = 1;
                  });
                },
                child: Text("Posts",
                    style: TextStyle(
                      color: _selectedEvent == 1
                          ? Colors.white
                          : Colors.blue.shade700,
                    )),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: size.width / 1.8,
              padding: EdgeInsets.all(8),
              child: MaterialButton(
                elevation: 0.5,
                shape: RoundedRectangleBorder(
                    // borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blue.shade700)),
                color:
                    _selectedEvent == 2 ? Colors.blue.shade700 : Colors.white,
                onPressed: () {
                  setState(() {
                    _selectedEvent = 2;
                  });
                },
                child: Text("Members",
                    style: TextStyle(
                      color: _selectedEvent == 2
                          ? Colors.white
                          : Colors.blue.shade700,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
