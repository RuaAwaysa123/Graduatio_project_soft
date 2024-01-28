// import 'package:flutter/material.dart';
//
// import 'package:provider/provider.dart';
// import 'package:rive_animation/AdminDashboard/common/app_colors.dart';
// import 'package:rive_animation/AdminDashboard/common/app_responsive.dart';
// import 'package:rive_animation/AdminDashboard/controllers/menu_controller.dart';
// import 'dashboard/dashboard.dart';
// import 'widget/side_bar_menu.dart';
//
// class HomePage_admin extends StatefulWidget {
//   @override
//   _HomePage_adminState createState() => _HomePage_adminState();
// }
//
// class _HomePage_adminState extends State<HomePage_admin> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: SideBar(),
//       key: Provider.of<MenuController>(context, listen: false).scaffoldKey,
//       backgroundColor: AppColor.bgSideMenu,
//       body: SafeArea(
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             /// Side Navigation Menu
//             /// Only show in desktop
//             if (AppResponsive.isDesktop(context))
//               Expanded(
//                 child: SideBar(),
//               ),
//
//             /// Main Body Part
//             Expanded(
//               flex: 4,
//               child: Dashboard(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:rive_animation/AdminDashboard/common/app_colors.dart';
import 'package:rive_animation/AdminDashboard/common/app_responsive.dart';
import 'package:rive_animation/AdminDashboard/controllers/menu_controller.dart' as CustomMenuController;
import 'dashboard/dashboard.dart';
import 'widget/side_bar_menu.dart';

class HomePageAdmin extends StatefulWidget {
  @override
  _HomePageAdminState createState() => _HomePageAdminState();
}

class _HomePageAdminState extends State<HomePageAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      key: Provider.of<CustomMenuController.MenuController>(context, listen: false).scaffoldKey,
      backgroundColor: AppColor.bgSideMenu,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Side Navigation Menu
            /// Only show in desktop
            if (AppResponsive.isDesktop(context))
              Expanded(
                child: SideBar(),
              ),

            /// Main Body Part
            Expanded(
              flex: 4,
              child: Dashboard(),
            ),
          ],
        ),
      ),
    );
  }
}
