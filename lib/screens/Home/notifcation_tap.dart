//
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../../widget/custom_follow_notifcation.dart';
// import '../../widget/custom_liked_notifcation.dart';
//
// class NotitcationTap extends StatelessWidget {
//   NotitcationTap({Key? key}) : super(key: key);
//   List newItem = ["liked", "follow"];
//   List todayItem = ["follow", "liked", "liked"];
//   List oldesItem = ["follow", "follow", "liked", "liked"];
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.all(20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "New",
//                   style: TextStyle(
//                     color: Colors.black, // Change to your desired color
//                     fontFamily: 'Inter',
//                     fontSize: 22,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 ListView.builder(
//                   physics: NeverScrollableScrollPhysics(),
//                   shrinkWrap: true,
//                   itemCount: newItem.length,
//                   itemBuilder: (context, index) {
//                     return newItem[index] == "follow"
//                         ? CustomFollowNotifcation()
//                         : CustomLikedNotifcation();
//                   },
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 10),
//                   child: Text(
//                     "Today",
//                     style: TextStyle(
//                       color: Colors.black, // Change to your desired color
//                       fontFamily: 'Inter',
//                       fontSize: 22,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                 ),
//                 ListView.builder(
//                   physics: NeverScrollableScrollPhysics(),
//                   shrinkWrap: true,
//                   itemCount: todayItem.length,
//                   itemBuilder: (context, index) {
//                     return todayItem[index] == "follow"
//                         ? CustomFollowNotifcation()
//                         : CustomLikedNotifcation();
//                   },
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 10),
//                   child: Text(
//                     "Oldest",
//                     style: TextStyle(
//                       color: Colors.black, // Change to your desired color
//                       fontFamily: 'Inter',
//                       fontSize: 22,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                 ),
//                 ListView.builder(
//                   physics: NeverScrollableScrollPhysics(),
//                   shrinkWrap: true,
//                   itemCount: oldesItem.length,
//                   itemBuilder: (context, index) {
//                     return oldesItem[index] == "follow"
//                         ? CustomFollowNotifcation()
//                         : CustomLikedNotifcation();
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../widget/CustomNewCourseNotification.dart';
import '../../widget/CustomNewEventNotification.dart';
import '../../widget/custom_follow_notifcation.dart';
import '../../widget/custom_liked_notifcation.dart';
 // Import the new event notification widget

class NotificationTap extends StatelessWidget {
  NotificationTap({Key? key}) : super(key: key);

  List newItem = ["liked", "follow", "course"];
  List todayItem = ["follow", "liked", "liked", "event"];
  List oldestItem = ["follow", "follow", "liked", "liked", "course", "event"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "New",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Inter',
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: newItem.length,
                  itemBuilder: (context, index) {
                    // if (newItem[index] == "follow") {
                    //   return CustomFollowNotifcation();
                    // } else if (newItem[index] == "liked") {
                    //   return CustomFollowNotifcation();
                    // }
                    if (newItem[index] == "course") {
                      return CustomNewCourseNotification();
                    } else {
                      return SizedBox(); // Handle other cases if needed
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Today",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Inter',
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: todayItem.length,
                  itemBuilder: (context, index) {
                    // if (todayItem[index] == "follow") {
                    //   return CustomFollowNotifcation();
                    // } else if (todayItem[index] == "liked") {
                    //   return CustomLikedNotifcation();
                    // }
                    if (todayItem[index] == "event") {
                      return CustomNewEventNotification();
                    } else {
                      return SizedBox(); // Handle other cases if needed
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Oldest",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Inter',
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: oldestItem.length,
                  itemBuilder: (context, index) {

                     if (oldestItem[index] == "course") {
                      return CustomNewCourseNotification();
                    } else if (oldestItem[index] == "event") {
                      return CustomNewEventNotification();
                    } else {
                      return SizedBox(); // Handle other cases if needed
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
