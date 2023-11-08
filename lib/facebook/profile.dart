import 'dart:convert';

import 'package:flutter/material.dart';

import 'info.dart';
// reels
// events
// mention

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);
    List<Member> membersList = [
    Member(name: 'John Doe', role: 'Designer'),
    Member(name: 'Jane Smith', role: 'Developer'),
    Member(name: 'Alice Johnson', role: 'Manager'),
  ];

  List<Info> info = [
    Info(
        icon: const Icon(
          Icons.work,
          color: Colors.white,
        ),
        normalText: 'colleg and university ',
        boldText: ' '),
    Info(
        icon: const Icon(Icons.location_city , color: Colors.white),
        normalText: 'Location ',
        boldText: 'Al najah Univercity Ngate '),
    Info(
        icon: const Icon(Icons.contact_mail_rounded , color: Colors.white),
        normalText: 'Contact info',

        boldText: ''),
    Info(
        icon: const Icon(Icons.link, color: Colors.white),
        normalText: 'https://eng.najah.edu/en/students/student-societies/ieee-najah-student-branch/',
        boldText: ''),
    Info(
        icon: const Icon(Icons.star , color: Colors.yellowAccent),
        normalText: 'Rating ',

        boldText: '4.5'),
    Info(
        icon: const Icon(Icons.more_horiz, color: Colors.white),
        normalText: 'See your About info'),


  ];

  Widget infoTemplate(infoItem, context) {
    return Row(
      children: [
        infoItem.icon,
        const SizedBox(
          width: 5,
        ),
        Container(
          width: MediaQuery.of(context).size.width - 50.0,
          padding: const EdgeInsets.all(5),
          child: RichText(
              text: TextSpan(style: const TextStyle(fontSize: 18), children: [
            TextSpan(
                text: infoItem.normalText,
                style: const TextStyle(color: Colors.white)),
            TextSpan(
                text: infoItem.boldText,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold))
          ])),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        color: Color.fromARGB(242, 8, 5, 5),
        constraints: const BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 180,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      image: DecorationImage(
                          image: AssetImage('assets/bg.jpg'),
                          fit: BoxFit.cover)),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 80),
                  child: const CircleAvatar(
                    radius: 74.0,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 70.0,
                      backgroundImage: AssetImage('assets/avatar.jpg'),
                    ),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 190),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 55,
                        ),
                        const Icon(
                          Icons.shield,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'IEEE NNU',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'If you cannot do great things, do small things in a great way.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(primary: Colors.blue[800]),
                  child: Row(
                    children: const [
                      Icon(Icons.add_circle_rounded),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Add to story')
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(primary: Colors.grey[900]),
                  child: Row(
                    children: const [
                      Icon(Icons.edit),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Add to story')
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(primary: Colors.grey[900]),
                  child: const Icon(Icons.more_horiz),
                )
              ],
            ),
            Divider(
              thickness: 1,
              height: 10,
              color: Colors.grey[800],
            ),
            Column(
              children: info
                  .map<Widget>((infoList) => infoTemplate(infoList, context))
                  .toList(),
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue.withOpacity(0.1)),
                  child: Text(
                    'Edit public details',
                    style: TextStyle(color: Colors.blue[900]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// class Member {
//   final String name;
//   final String role;
//
//   Member({required this.name, required this.role});
// }
//
// class Profile extends StatelessWidget {
//   Profile({Key? key}) : super(key: key);
//
//   List<Member> membersList = [
//     Member(name: 'John Doe', role: 'Designer'),
//     Member(name: 'Jane Smith', role: 'Developer'),
//     Member(name: 'Alice Johnson', role: 'Manager'),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: const EdgeInsets.only(left: 10, right: 10),
//         color: Color.fromARGB(242, 8, 5, 5),
//         constraints: const BoxConstraints.expand(),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             const SizedBox(height: 30),
//             // ... Existing code for profile image and name ...
//
//             // About Section
//             Card(
//               margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               color: Colors.grey[900],
//               child: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'About',
//                       style: TextStyle(fontSize: 20, color: Colors.white),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       'Write something about yourself here...',
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//
//             // Like Button
//             ElevatedButton.icon(
//               onPressed: () {
//                 // Handle liking the profile here.
//               },
//               style: ElevatedButton.styleFrom(primary: Colors.blue[800]),
//               icon: Icon(Icons.thumb_up),
//               label: Text('Like'),
//             ),
//
//             // Calendar Section
//             Card(
//               margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               color: Colors.grey[900],
//               child: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Calendar',
//                       style: TextStyle(fontSize: 20, color: Colors.white),
//                     ),
//                     // Add your calendar content here.
//                   ],
//                 ),
//               ),
//             ),
//
//             // Members Section
//             Card(
//               margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               color: Colors.grey[900],
//               child: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Members',
//                       style: TextStyle(fontSize: 20, color: Colors.white),
//                     ),
//                     SizedBox(height: 10),
//                     ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: membersList.length,
//                       itemBuilder: (context, index) {
//                         final member = membersList[index];
//                         return ListTile(
//                           title: Text(member.name, style: TextStyle(color: Colors.white)),
//                           subtitle: Text(member.role, style: TextStyle(color: Colors.grey)),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
