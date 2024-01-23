// import 'dart:convert';
//
// import 'package:flutter/material.dart';
//
// import 'info.dart';
// // reels
// // events
// // mention
//
// class societyProfile extends StatelessWidget {
//   societyProfile({Key? key}) : super(key: key);
//     List<Member> membersList = [
//     Member(name: 'John Doe', role: 'Designer'),
//     Member(name: 'Jane Smith', role: 'Developer'),
//     Member(name: 'Alice Johnson', role: 'Manager'),
//   ];
//
//   List<Info> info = [
//     Info(
//         icon: const Icon(
//           Icons.work,
//           color: Colors.white,
//         ),
//         normalText: 'colleg and university ',
//         boldText: ' '),
//     Info(
//         icon: const Icon(Icons.location_city , color: Colors.white),
//         normalText: 'Location ',
//         boldText: 'Al najah Univercity Ngate '),
//     Info(
//         icon: const Icon(Icons.contact_mail_rounded , color: Colors.white),
//         normalText: 'Contact info',
//
//         boldText: ''),
//     Info(
//         icon: const Icon(Icons.link, color: Colors.white),
//         normalText: 'https://eng.najah.edu/en/students/student-societies/ieee-najah-student-branch/',
//         boldText: ''),
//     Info(
//         icon: const Icon(Icons.star , color: Colors.yellowAccent),
//         normalText: 'Rating ',
//
//         boldText: '4.5'),
//     Info(
//         icon: const Icon(Icons.more_horiz, color: Colors.white),
//         normalText: 'See your About info'),
//
//
//   ];
//
//   Widget infoTemplate(infoItem, context) {
//     return Row(
//       children: [
//         infoItem.icon,
//         const SizedBox(
//           width: 5,
//         ),
//         Container(
//           width: MediaQuery.of(context).size.width - 50.0,
//           padding: const EdgeInsets.all(5),
//           child: RichText(
//               text: TextSpan(style: const TextStyle(fontSize: 18), children: [
//             TextSpan(
//                 text: infoItem.normalText,
//                 style: const TextStyle(color: Colors.white)),
//             TextSpan(
//                 text: infoItem.boldText,
//                 style: const TextStyle(
//                     color: Colors.white, fontWeight: FontWeight.bold))
//           ])),
//         ),
//       ],
//     );
//   }
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
//             const SizedBox(
//               height: 30,
//             ),
//             Stack(
//               alignment: Alignment.topCenter,
//               children: [
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: 180,
//                   decoration: const BoxDecoration(
//                       borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(10),
//                           topRight: Radius.circular(10)),
//                       image: DecorationImage(
//                           image: AssetImage('assets/bg.jpg'),
//                           fit: BoxFit.cover)),
//                 ),
//                 Container(
//                   margin: const EdgeInsets.only(top: 80),
//                   child: const CircleAvatar(
//                     radius: 74.0,
//                     backgroundColor: Colors.white,
//                     child: CircleAvatar(
//                       radius: 70.0,
//                       backgroundImage: AssetImage('assets/avatar.jpg'),
//                     ),
//                   ),
//                 ),
//                 Container(
//                     margin: const EdgeInsets.only(top: 190),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const SizedBox(
//                           width: 55,
//                         ),
//                         const Icon(
//                           Icons.shield,
//                           color: Colors.white,
//                         ),
//                         const SizedBox(
//                           width: 25,
//                         ),
//                         Container(
//                           padding: const EdgeInsets.all(5),
//                           decoration: BoxDecoration(
//                               color: Colors.black,
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(50))),
//                           child: const Icon(
//                             Icons.camera_alt,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     )),
//               ],
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             const Text(
//               'IEEE NNU',
//               style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white),
//             ),
//             // const SizedBox(
//             //   height: 10,
//             // ),
//             const Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Text(
//                 'If you cannot do great things, do small things in a great way.',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 15, color: Colors.grey),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(primary: Colors.blue[800]),
//                   child: Row(
//                     children: const [
//                       Icon(Icons.calendar_month),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Text('Calender')
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(primary: Colors.grey[900]),
//                   child: Row(
//                     children: const [
//                       Icon(Icons.chat),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Text('Massage')
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(primary: Colors.grey[900]),
//                   child: const Icon(Icons.more_horiz),
//                 )
//               ],
//             ),
//             Divider(
//               thickness: 1,
//               height: 10,
//               color: Colors.grey[800],
//             ),
//             Column(
//               children: info
//                   .map<Widget>((infoList) => infoTemplate(infoList, context))
//                   .toList(),
//             ),
//
//             Container(
//               width: MediaQuery.of(context).size.width,
//               child: Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                       primary: Colors.blue.withOpacity(0.1)),
//                   child: Text(
//                     'Edit public details',
//                     style: TextStyle(color: Colors.blue[900]),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'calender.dart';
import 'info.dart';

class societyProfile extends StatefulWidget {
  const societyProfile({Key? key}) : super(key: key);

  @override
  _societyProfileState createState() => _societyProfileState();
}

class _societyProfileState extends State<societyProfile> {
  File? _image;

  Future getImage() async {
    final imagePicker = ImagePicker();
    // final pickedFile = await imagePicker.getImage(source: ImageSource.gallery);

    // setState(() {
    //   if (pickedFile != null) {
    //     _image = File(pickedFile.path);
    //   } else {
    //     print('No image selected.');
    //   }
    // });
  }

  List<Member> membersList = [
    Member(name: 'John Doe', role: 'Designer'),
    Member(name: 'Jane Smith', role: 'Developer'),
    Member(name: 'Alice Johnson', role: 'Manager'),
  ];

  List<Info> info = [
    Info(
        icon: const Icon(
          Icons.work,
          color: Colors.grey, // Set text color to black
        ),
        normalText: 'colleg and university ',
        boldText: ' '),
    Info(
        icon: const Icon(Icons.location_city, color: Colors.grey), // Set text color to black
        normalText: 'Location ',
        boldText: 'Al najah Univercity Ngate '),
    Info(
        icon: const Icon(Icons.contact_mail_rounded, color: Colors.grey), // Set text color to black
        normalText: 'Contact info',
        boldText: ''),
    Info(
        icon: const Icon(Icons.link, color: Colors.grey), // Set text color to black
        normalText: 'https://eng.najah.edu/en/students/student-societies/ieee-najah-student-branch/',
        boldText: ''),
    Info(
        icon: const Icon(Icons.star, color: Colors.yellow), // Set text color to grey
        normalText: 'Rating ',
        boldText: '4.5'),
    Info(
        icon: const Icon(Icons.more_horiz, color: Colors.black), // Set text color to black
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
              text: TextSpan(style: const TextStyle(fontSize: 18, color: Colors.black), children: [
                TextSpan(
                    text: infoItem.normalText,
                    style: const TextStyle(color: Colors.black)),
                TextSpan(
                    text: infoItem.boldText,
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold))
              ])),
        ),
      ],
    );
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        color: Colors.white,
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
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    image: _image != null
                        ? DecorationImage(
                      image: FileImage(_image!),
                      fit: BoxFit.cover,
                    )
                        : const DecorationImage(
                      image: AssetImage('assets/images/default-user-icon-8.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 80),
                  child: const CircleAvatar(
                    radius: 74.0,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 70.0,
                      // backgroundImage: AssetImage('aassets/images/default-user-icon-8.jpg'),
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
              'Knowleg Academy_ أكادمية المعرفة ',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black), // Set text color to black
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'If you cannot do great things, do small things in a great way.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(primary: Colors.blue),
                  child: Row(
                    children: const [
                      Icon(Icons.message , color: Colors.white ,),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Message me')
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => MyCalendarPage(),
                    //   ),
                    // );
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.grey[900]),
                  child: Row(
                    children: const [
                      Icon(Icons.calendar_month_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Calender')
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
              color: Colors.blue,
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
                      primary: Colors.blue),
                  child: Text(
                    'Edit public details',
                    style: TextStyle(color: Colors.white),
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
