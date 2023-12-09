import 'package:flutter/material.dart';

class AddEducationDialog extends StatelessWidget {
  final Function(Map<String, dynamic>) onEducationAdded;

  const AddEducationDialog({Key? key, required this.onEducationAdded}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController schoolNameController = TextEditingController();
    TextEditingController startDateController = TextEditingController();
    TextEditingController endDateController = TextEditingController();

    return AlertDialog(
      title: Text('Add Education'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: schoolNameController,
            decoration: InputDecoration(labelText: 'School Name'),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: startDateController,
            decoration: InputDecoration(labelText: 'Start Date'),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: endDateController,
            decoration: InputDecoration(labelText: 'End Date'),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final Map<String, dynamic> newEducation = {
              'schoolName': schoolNameController.text,
              'startDate': startDateController.text,
              'endDate': endDateController.text,
            };

            onEducationAdded(newEducation);

            // Close the dialog
            Navigator.of(context).pop();
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}
