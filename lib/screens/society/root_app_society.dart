
import 'package:flutter/material.dart';
import 'package:rive_animation/screens/cources/account.dart';
import 'package:rive_animation/screens/cources/theme/color.dart';
import 'package:rive_animation/utils/constant.dart';
import 'package:rive_animation/screens/cources/widgets_cources/bottombar_item.dart';
import '../../facebook/Cources_profile.dart';

import '../../facebook/profile.dart';
import '../cources/dashboard.dart';
import '../cources/home_courses.dart';
import '../profile_test/pages/profile_Screen.dart';


class RootAppSociety extends StatefulWidget {
  const RootAppSociety({Key? key}) : super(key: key);

  @override
  _RootAppSocietyState createState() => _RootAppSocietyState();
}

class _RootAppSocietyState extends State<RootAppSociety>
    with TickerProviderStateMixin {
  int _activeTab = 0;
  List _barItems = [
    {
      "icon": "assets/icons/home.svg",
      "active_icon": "assets/icons/home.svg",
      "page": HomePage(),
    },
    {
      "icon": "assets/icons/notification.svg",
      "active_icon": "assets/icons/notification.svg",
      "page": Container(),
    },
    {
      "icon": "assets/navigator_icons/analysis_simple.svg",
      "active_icon": "assets/navigator_icons/analysis_simple.svg",//assets/navigator_icons/analysis.svg
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
      // "page": societyProfile(),//  //SocietyProfileScreen
      "page": MyHomePageTest(title: 'Flutter Demo Home Page', key: UniqueKey())
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
