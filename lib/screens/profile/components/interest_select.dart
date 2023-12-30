import 'package:flutter/material.dart';

import '../../../model/User1.dart';
import '../../../services/auth_service.dart';
import '../profile_page.dart';

class InterestSelectionPage extends StatefulWidget {
  @override
  _InterestSelectionPageState createState() => _InterestSelectionPageState();
}

class _InterestSelectionPageState extends State<InterestSelectionPage> {

  Color InterstColor = Colors.blueAccent.withOpacity(0.6);
  List<String> interests = [
    'Arts & Creativity',
    'Beauty & Hair',
    'Business & Professional',
    'Caretaking & Sitting',
    'Cleaning & Organising',
    'Cooking & Dining',
    'Consulting & Advisory',
    'Design & Interior',
    'DIY & Repairs',
    'Education & Coaching',
    'Fitness & Sports',
    'Health & Wellness',
    'Home & Garden',
    'Languages & Translation',
    'Law & Legal Support',
    'Music & Entertainment',
    'Photo & Video',
    'Social Media & Marketing',
    'Tech & Digital Services',
    'Writing & Editing'
    'Other'
  ];

  List<bool> selectedInterests = List.generate(21, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueAccent.shade100 ,

        title: Text('Select Your Interests'),
      ),
      body: ListView.builder(
        itemCount: interests.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: selectedInterests[index] ? Colors.blue : Colors.grey,
                ),
                color: selectedInterests[index]
                    ? Colors.blue.withOpacity(0.3)
                    : Colors.transparent,
              ),
              padding: EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      getIconForInterest(interests[index]),
                      SizedBox(width: 8.0),
                      Text(interests[index]),
                    ],
                  ),
                  selectedInterests[index]
                      ? Icon(
                    Icons.check,
                    color: Colors.blue,
                  )
                      : Icon(
                    Icons.check_box_outline_blank,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            onTap: () {
              setState(() {
                selectedInterests[index] = !selectedInterests[index];
              });
            },
          );
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.blueAccent.shade100,
      //   foregroundColor: Colors.white,
      //   onPressed: () {
      //     // TODO: Implement confirm button logic
      //     Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => ProfilePage(),
      //     ),
      //   );
      //     // ProfilePage
      //   },
      //   child: Icon(Icons.check ),
      // ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent.shade100,
        foregroundColor: Colors.white,
        onPressed: () {
          // Add selected interests to the user's profile
          List<Interest> selectedInterestsList = [];
          for (int i = 0; i < selectedInterests.length; i++) {
            if (selectedInterests[i]) {
              selectedInterestsList.add(
                Interest(
                  title: interests[i],
                  description: '', id: '', // Add a description or leave it empty
                ),
              );
            }
          }

          // Call the addInterest function to save interests
          AuthService().addInterest(
            context: context,
            userId: 'user_id_here', // Replace with the actual user ID
            title: 'Interest Title', // You can replace this with a title or leave it empty
            description: 'Interest Description', // You can replace this with a description or leave it empty
          );

          // Update the user's interests in the profile page
          //loadUserProfile();
        },
        child: Icon(Icons.check),
      ),
    );
  }

  Widget getIconForInterest(String interest) {
    switch (interest) {
      case 'Arts & Creativity':
        return Icon(Icons.palette , color: InterstColor,);
      case 'Beauty & Hair':
        return Icon(Icons.face , color: InterstColor,);
      case 'Business & Professional':
        return Icon(Icons.business , color: InterstColor,);
      case 'Caretaking & Sitting':
        return Icon(Icons.child_care , color: InterstColor,);
      case 'Cleaning & Organising':
        return Icon(Icons.cleaning_services , color: InterstColor,);
      case 'Cooking & Dining':
        return Icon(Icons.restaurant , color: InterstColor,);
      case 'Consulting & Advisory':
        return Icon(Icons.people , color: InterstColor,);
      case 'Design & Interior':
        return Icon(Icons.design_services , color: InterstColor,);
      case 'DIY & Repairs':
        return Icon(Icons.build , color: InterstColor,);
      case 'Education & Coaching':
        return Icon(Icons.school , color: InterstColor,);
      case 'Fitness & Sports':
        return Icon(Icons.fitness_center , color: InterstColor,);
      case 'Health & Wellness':
        return Icon(Icons.local_hospital , color: InterstColor,);
      case 'Home & Garden':
        return Icon(Icons.home , color: InterstColor,);
      case 'Languages & Translation':
        return Icon(Icons.language , color: InterstColor,);
      case 'Law & Legal Support':
        return Icon(Icons.gavel , color: InterstColor,);
      case 'Music & Entertainment':
        return Icon(Icons.music_note , color: InterstColor,);
      case 'Photo & Video':
        return Icon(Icons.camera_alt , color: InterstColor,);
      case 'Social Media & Marketing':
        return Icon(Icons.thumb_up , color: InterstColor,);
      case 'Tech & Digital Services':
        return Icon(Icons.computer , color: InterstColor,);
      case 'Writing & Editing':
        return Icon(Icons.edit , color: InterstColor,);
      default:
        return Icon(Icons.category);
    }
  }
}
