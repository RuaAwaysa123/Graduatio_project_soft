import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../model/user.dart';
import '../../../utils/user_preferences.dart';

class AddInterestPage extends StatefulWidget {
  final List<Interest> selectedInterests;
  final Function(List<Interest>) onInterestsSelected;

  AddInterestPage({
    required this.selectedInterests,
    required this.onInterestsSelected,
  });

  @override
  _AddInterestPageState createState() => _AddInterestPageState();
}


class _AddInterestPageState extends State<AddInterestPage> {
  List<Interest> interests = [];

  @override
  void initState() {
    interests.addAll(UserPreferences.myUser.interests);
    interests.removeWhere((interest) =>
        widget.selectedInterests.any((selected) => selected.title == interest.title));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Interests'),
        actions: [
          TextButton(
            onPressed: () {
              // Pass the selected interests back to the previous screen.
              Navigator.of(context).pop(widget.selectedInterests);
            },
            child: Text('Done'),
          ),

        ],
      ),
      body: ListView(
        children: interests.map((interest) {
          return ListTile(
            title: Text(interest.title),
            subtitle: Text(interest.description),
            leading: Checkbox(
              value: widget.selectedInterests.any((selected) => selected.title == interest.title),
              onChanged: (selected) {
                setState(() {
                  if (selected == true) {
                    widget.onInterestsSelected([...widget.selectedInterests, interest]);
                  } else {
                    widget.onInterestsSelected(
                      widget.selectedInterests
                          .where((selected) => selected.title != interest.title)
                          .toList(),
                    );
                  }
                });
              },

            ),
          );
        }).toList(),
      ),
    );
  }


}
