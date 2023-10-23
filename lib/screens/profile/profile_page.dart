import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive_animation/model/user.dart';
import 'package:rive_animation/screens/profile/edit_profile_page.dart';
import 'package:rive_animation/utils/user_preferences.dart';
import 'package:rive_animation/widget/appbar_widget.dart';
import 'package:rive_animation/widget/button_widget.dart';
import 'package:rive_animation/widget/numbers_widget.dart';
import 'package:rive_animation/widget/profile_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'components/addInterests.dart';
import 'components/add_skill_dialog.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  List<Interest> selectedInterests = [];

  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;
    // final user = UserPreferences.myUser;
    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) => Scaffold(
          appBar: buildAppBar(context),
          body: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              ProfileWidget(
                imagePath: user.imagePath,
                onClicked: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditProfilePage()),
                  );
                },
              ),
              const SizedBox(height: 24),
              buildName(user),
              const SizedBox(height: 24),
              Center(child: buildUpgradeButton()),
              const SizedBox(height: 24),
              NumbersWidget(),
              const SizedBox(height: 10),
              buildAboutme(user),
              const SizedBox(height: 30),
              buildAbout(user),
              const SizedBox(height: 10),
              buildSkills(context, user),
              const SizedBox(height: 10),
              // buildInterests(user),
              buildInterestsChips(user),
              const SizedBox(height: 10),
              // ElevatedButton(
              //   onPressed: () async {
              //     final updatedInterests = await Navigator.of(context).push(
              //       MaterialPageRoute(
              //         builder: (context) => AddInterestPage(
              //           selectedInterests: selectedInterests,
              //           onInterestsSelected: (selected) {
              //             setState(() {
              //               selectedInterests = selected;
              //             });
              //           },
              //         ),
              //       ),
              //     );
              //   },
              //   child: Text('Add Interest'),
              // ),


            ],
          ),
        ),
      ),
    );
  }

  Widget buildName(User user) => Column(
    children: [
      Text(
        user.name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      const SizedBox(height: 4),
      Text(
        user.email,
        style: TextStyle(color: Colors.grey),
      ),
    ],
  );

  Widget buildUpgradeButton() => ButtonWidget(
    text: 'Upgrade To PRO',
    onClicked: () {},
  );

  Widget buildAbout(User user) => Container(
    padding: EdgeInsets.symmetric(horizontal: 48),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Text(
          user.about,
          style: TextStyle(fontSize: 16, height: 1.4),
        ),
      ],
    ),
  );

  Widget buildAboutme(User user) => Container(
    padding: EdgeInsets.symmetric(horizontal: 48),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About Me',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Icon(FontAwesomeIcons.phone, size: 18, color: Colors.blue),
            SizedBox(width: 8),
            Text(
              user.phoneNumber,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(FontAwesomeIcons.graduationCap, size: 18, color: Colors.blue),
            SizedBox(width: 8),
            Text(
              user.major,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(FontAwesomeIcons.university, size: 18, color: Colors.blue),
            SizedBox(width: 8),
            Text(
              user.university,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(FontAwesomeIcons.locationPin, size: 18, color: Colors.blue),
            SizedBox(width: 8),
            Text(
              user.location,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      ],
    ),
  );

  Widget buildSkills(BuildContext context, User user) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Skills',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          for (var skill in user.skills)
            Row(
              children: [
                Text(skill.name),
                const SizedBox(width: 30),
                buildSkillRating(skill.rating),
              ],
            ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AddSkillDialog(
                  onSkillAdded: (newSkill) {
                    setState(() {
                      user.skills.add(newSkill);
                    });
                  },
                ),
              );
            },
            child: Text('Add New Skill'),
          )
        ],
      ),
    );
  }

  Widget buildSkillRating(int rating) {
    List<Widget> stars = [];
    for (int i = 0; i < 5; i++) {
      if (i < rating) {
        stars.add(Icon(Icons.star, color: Colors.yellow));
      } else {
        stars.add(Icon(Icons.star_border, color: Colors.yellow));
      }
    }
    return Row(children: stars);
  }

  Widget buildInterestsChips(User user) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Interests',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Wrap(
            children: selectedInterests.map((interest) {
              return Chip(
                label: Text(interest.title),
                onDeleted: () {
                  setState(() {
                    selectedInterests.remove(interest);
                  });
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              final updatedInterests = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddInterestPage(
                    selectedInterests: selectedInterests,
                    onInterestsSelected: (selected) {
                      setState(() {
                        selectedInterests = selected;
                      });
                    },
                  ),
                ),
              );

            },
            child: Text('Add Interest'),
          ),
        ],
      ),
    );
  }

}


