// import 'package:flutter/material.dart';
// import 'package:rive_animation/screens/cources/account.dart';
// import 'package:rive_animation/screens/cources/chat_course.dart';
// import 'package:rive_animation/screens/cources/theme/color.dart';
// import 'package:rive_animation/utils/constant.dart';
// import 'package:rive_animation/screens/cources/widgets_cources/bottombar_item.dart';
// import '../../facebook/Cources_profile.dart';
// import 'home_coursetest.dart';
//
// class RootAppCources extends StatefulWidget {
//   const RootAppCources({Key? key}) : super(key: key);
//
//   @override
//   _RootAppCourcesState createState() => _RootAppCourcesState();
// }
//
// class _RootAppCourcesState extends State<RootAppCources> with TickerProviderStateMixin {
//   int _activeTab = 0;
//   List _barItems = [
//     {
//       "icon": "assets/icons/home.svg",
//       "active_icon": "assets/icons/home.svg",
//       "page": HomePage(),
//     },
//     {
//       "icon": "assets/icons/search.svg",
//       "active_icon": "assets/icons/search.svg",
//       "page": Container(),
//     },
//     {
//       "icon": "assets/icons/play.svg",
//       "active_icon": "assets/icons/play.svg",
//       "page": Container(),
//     },
//     {
//       "icon": "assets/icons/chat.svg",
//       "active_icon": "assets/icons/chat.svg",
//        //"page": ChatPage(),
//     },
//     {
//       "icon": "assets/icons/profile.svg",
//       "active_icon": "assets/icons/profile.svg",
//       "page": CourceProfile(),
//     },
//   ];
//
// //====== set animation=====
//   late final AnimationController _controller = AnimationController(
//     duration: const Duration(milliseconds: ANIMATED_BODY_MS),
//     vsync: this,
//   );
//   late final Animation<double> _animation = CurvedAnimation(
//     parent: _controller,
//     curve: Curves.fastOutSlowIn,
//   );
//
//   @override
//   void initState() {
//     super.initState();
//     _controller.forward();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.appBgColor,
//       appBar: AppBar(
//         title: Text("Your App Name"),
//       ),
//       drawer: _buildSideMenu(),
//       bottomNavigationBar: _buildBottomBar(),
//       body: _buildPage(),
//     );
//   }
//
//   Widget _buildSideMenu() {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//           DrawerHeader(
//             decoration: BoxDecoration(
//               color: AppColor.appBgColor,
//             ),
//             child: Text(
//               'Menu',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 24,
//               ),
//             ),
//           ),
//           ListTile(
//             title: Text('Home'),
//             onTap: () {
//               Navigator.pop(context);
//               onPageChanged(0);
//             },
//           ),
//           ListTile(
//             title: Text('Search'),
//             onTap: () {
//               Navigator.pop(context);
//               onPageChanged(1);
//             },
//           ),
//           ListTile(
//             title: Text('Play'),
//             onTap: () {
//               Navigator.pop(context);
//               onPageChanged(2);
//             },
//           ),
//           ListTile(
//             title: Text('Chat'),
//             onTap: () {
//               Navigator.pop(context);
//               onPageChanged(3);
//             },
//           ),
//           ListTile(
//             title: Text('Profile'),
//             onTap: () {
//               Navigator.pop(context);
//               onPageChanged(4);
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.stop();
//     _controller.dispose();
//     super.dispose();
//   }
//
//   _buildAnimatedPage(page) {
//     return FadeTransition(child: page, opacity: _animation);
//   }
//
//   void onPageChanged(int index) {
//     _controller.reset();
//     setState(() {
//       _activeTab = index;
//     });
//     _controller.forward();
//   }
//
// //====== end set animation=====
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.appBgColor,
//       bottomNavigationBar: _buildBottomBar(),
//       body: _buildPage(),
//     );
//   }
//
//   Widget _buildPage() {
//     return IndexedStack(
//       index: _activeTab,
//       children: List.generate(
//         _barItems.length,
//         (index) => _buildAnimatedPage(_barItems[index]["page"]),
//       ),
//     );
//   }
//
//   Widget _buildBottomBar() {
//     return Container(
//       height: 75,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: AppColor.bottomBarColor,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(25),
//           topRight: Radius.circular(25),
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: AppColor.shadowColor.withOpacity(0.1),
//             blurRadius: 1,
//             spreadRadius: 1,
//             offset: Offset(1, 1),
//           )
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.only(
//           left: 25,
//           right: 25,
//           bottom: 15,
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: List.generate(
//             _barItems.length,
//             (index) => BottomBarItem(
//               _barItems[index]["icon"],
//               isActive: _activeTab == index,
//               activeColor: AppColor.primary,
//               onTap: () {
//                 onPageChanged(index);
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:rive_animation/screens/cources/account.dart';
import 'package:rive_animation/screens/cources/theme/color.dart';
import 'package:rive_animation/utils/constant.dart';
import 'package:rive_animation/screens/cources/widgets_cources/bottombar_item.dart';
import '../../facebook/Cources_profile.dart';
import '../Home/notifcation_tap.dart';
import 'dashboard.dart';
import 'home_courses.dart';


class RootAppCources extends StatefulWidget {
  const RootAppCources({Key? key}) : super(key: key);

  @override
  _RootAppCourcesState createState() => _RootAppCourcesState();
}

class _RootAppCourcesState extends State<RootAppCources>
    with TickerProviderStateMixin {
  int _activeTab = 0;
  List _barItems = [
    {
      "icon": "assets/icons/home.svg",
      "active_icon": "assets/icons/home.svg",
      "page": HomePage(),
    },
    {
      "icon": "assets/icons/search.svg",
      "active_icon": "assets/icons/search.svg",
      "page": NotificationTap(),
    },
    {
      "icon": "assets/icons/play.svg",
      "active_icon": "assets/icons/play.svg",
      "page": MyHomePage(),
    },
    {
      "icon": "assets/icons/chat.svg",
      "active_icon": "assets/icons/chat.svg",
      // "page": ChatPagecource(groupId: '',),
    },
    {
      "icon": "assets/icons/profile.svg",
      "active_icon": "assets/icons/profile.svg",
      "page": CourceProfile(),
    },
  ];

  //====== set animation =====
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

  //====== end set animation =====

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        //title: Text(""),
      ),
      drawer: _buildSideMenu(),
      bottomNavigationBar: _buildBottomBar(),
      body: _buildPage(),
    );
  }

  Widget _buildSideMenu() {
    return Drawer(
      child: _buildAccountUI(),
    );
  }

  Widget _buildAccountUI() {
    return Container(
      color: AppColor.appBgColor,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: AccountPage(),
    );
  }

  Widget _buildPage() {
    return IndexedStack(
      index: _activeTab,
      children: List.generate(
        _barItems.length,
            (index) {
          if (index == 5) {
            return _buildAnimatedPage(AccountPage());
          } else {
            return _buildAnimatedPage(_barItems[index]["page"]);
          }
        },
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
              activeColor: AppColor.primary,
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
