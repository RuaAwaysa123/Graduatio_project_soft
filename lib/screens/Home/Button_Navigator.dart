// // import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:rive_animation/model/user.dart';
// // class HomePage extends StatefulWidget {
// //   @override
// //   _HomePageState createState() => _HomePageState();
// // }
// //
// // class _HomePageState extends State<HomePage> {
// //   @override
// //   Widget build(BuildContext context) {
// //     // TODO: implement build
// //     // throw UnimplementedError();
// //     return Scaffold(
// //       // backgroundColor:  Color(0xED6E95F6),
// //       bottomNavigationBar: CurvedNavigationBar(
// //          backgroundColor:  Colors.white,
// //         color: Color(0xED6E95F6),
// //         items: [
// //           Icon(Icons.home, size: 30),
// //           Icon(Icons.search, size: 30),
// //           Icon(Icons.chat, size: 30),
// //           Icon(Icons.notification_add, size: 30),
// //         ],
// //         onTap: (index) {
// //           //Handle button tap
// //         },
// //       ),
// //     );
// //   }
// // }
//
//
// import 'package:flutter/material.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:rive_animation/model/user.dart';
// import '../test/home_screen.dart';
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   int _currentIndex = 0;
//
//   final List<Widget> _pages = [
//     HomePage1(),
//
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_currentIndex],
//       bottomNavigationBar: CurvedNavigationBar(
//         backgroundColor: Colors.white,
//         // color: Color(0xED6E95F6),
//         color: Colors.blue,
//         items: [
//           Icon(Icons.home, size: 30, color: Colors.white,),
//           Icon(Icons.message_rounded, size: 30 ,color:Colors.white,),
//           Icon(Icons.notifications, size: 30 ,  color: Colors.white),
//           Icon(Icons.person, size: 30 ,color: Colors.white,),
//         ],
//         onTap: (index) {
//           if (index == 0) {
//             // If the home icon is pressed, navigate to HomePage1
//             Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//               return HomePage1();
//             }));
//           } else {
//             setState(() {
//               _currentIndex = index;
//             });
//           }
//         },
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:rive_animation/screens/cources/account.dart';
import 'package:rive_animation/screens/cources/chat_course.dart';
import 'package:rive_animation/screens/cources/theme/color.dart';
import 'package:rive_animation/utils/constant.dart';
import 'package:rive_animation/screens/cources/widgets_cources/bottombar_item.dart';

import '../../chat_groups/home_page.dart';
import '../cources/widgets_cources/notification_box.dart';
import '../profile/profile_page.dart';
import '../test/home_screen.dart';
import 'notifcation_tap.dart';


class RootApp1 extends StatefulWidget {
  const RootApp1({Key? key}) : super(key: key);

  @override
  _RootApp1State createState() => _RootApp1State();
}

class _RootApp1State extends State<RootApp1> with TickerProviderStateMixin {
  int _activeTab = 0;
  List _barItems = [
    {
      "icon": "assets/icons/home.svg",
      "active_icon": "assets/icons/home.svg",
      "page": HomePage1(),
    },
    {
      "icon": "assets/icons/notification.svg",
      "active_icon": "assets/icons/notification.svg",
      "page": NotificationTap(),
    },
    {
      "icon": "assets/icons/loupe.svg",
      "active_icon": "assets/icons/loupe.svg",
      "page": Container(),
    },
    {
      "icon": "assets/icons/chat.svg",
      "active_icon": "assets/icons/chat.svg",
      "page": HomePageChat(),
    },
    {
      "icon": "assets/icons/profile.svg",
      "active_icon": "assets/icons/profile.svg",
      "page": ProfilePage(),
    },
  ];

//====== set animation=====
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: ANIMATED_BODY_MS),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  _buildAnimatedPage(page) {
    return FadeTransition(child: page, opacity: _animation);
  }

  void onPageChanged(int index) {
    _controller.reset();
    setState(() {
      _activeTab = index;
    });
    _controller.forward();
  }

//====== end set animation=====

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBgColor,
      bottomNavigationBar: _buildBottomBar(),
      body: _buildPage(),
    );
  }

  Widget _buildPage() {
    return IndexedStack(
      index: _activeTab,
      children: List.generate(
        _barItems.length,
            (index) => _buildAnimatedPage(_barItems[index]["page"]),
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      height: 75,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.bottomBarColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColor.shadowColor.withOpacity(0.1),
            blurRadius: 1,
            spreadRadius: 1,
            offset: Offset(1, 1),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 25,
          right: 25,
          bottom: 15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            _barItems.length,
                (index) => BottomBarItem(
              _barItems[index]["icon"],
              isActive: _activeTab == index,
              activeColor: AppColor.blue,
              onTap: () {
                onPageChanged(index);
              },
            ),
          ),
        ),
      ),
    );
  }
}
