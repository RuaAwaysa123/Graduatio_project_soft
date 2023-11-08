// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:rive_animation/model/user.dart';
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     // throw UnimplementedError();
//     return Scaffold(
//       // backgroundColor:  Color(0xED6E95F6),
//       bottomNavigationBar: CurvedNavigationBar(
//          backgroundColor:  Colors.white,
//         color: Color(0xED6E95F6),
//         items: [
//           Icon(Icons.home, size: 30),
//           Icon(Icons.search, size: 30),
//           Icon(Icons.chat, size: 30),
//           Icon(Icons.notification_add, size: 30),
//         ],
//         onTap: (index) {
//           //Handle button tap
//         },
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:rive_animation/model/user.dart';
import '../test/home_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage1(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Color(0xED6E95F6),
        items: [
          Icon(Icons.home, size: 30),
          Icon(Icons.search, size: 30),
          Icon(Icons.chat, size: 30),
          Icon(Icons.notifications, size: 30),
        ],
        onTap: (index) {
          if (index == 0) {
            // If the home icon is pressed, navigate to HomePage1
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return HomePage1();
            }));
          } else {
            setState(() {
              _currentIndex = index;
            });
          }
        },
      ),
    );
  }
}
