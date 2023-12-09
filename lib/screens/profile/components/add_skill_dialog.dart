import 'package:flutter/material.dart';
import 'package:rive_animation/model/user.dart';
import 'package:rive_animation/utils/user_preferences.dart';

class AddSkillDialog extends StatefulWidget {
  final Function(Skill) onSkillAdded;

  AddSkillDialog({required this.onSkillAdded});

  @override
  _AddSkillDialogState createState() => _AddSkillDialogState();
}

class _AddSkillDialogState extends State<AddSkillDialog> {
  String skillName = '';
  int skillRating = 1; // Ensure skillRating is not nullable

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add New Skill'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Skill Name'),
            onChanged: (value) {
              setState(() {
                skillName = value;
              });
            },
          ),
          DropdownButton<int>(
            value: skillRating ?? 1, // Ensure skillRating is not nullable
            items: List.generate(5, (index) {
              return DropdownMenuItem<int>(
                value: index + 1,
                child: Text('Rating: ${index + 1}'),
              );
            }),
            onChanged: (value) {
              setState(() {
                skillRating = value ?? 1; // Ensure skillRating is not nullable
              });
            },
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),

        TextButton(
          child: Text('Add'),
          onPressed: () {
            if (skillName.isNotEmpty) {
              final newSkill = Skill(name: skillName, rating: skillRating);
              widget.onSkillAdded(newSkill); // Call the callback to add the skill
              Navigator.of(context).pop();
            }
          },
        ),

      ],
    );
  }
}
