import 'package:flutter/material.dart';

class SocietyProfileScreen extends StatelessWidget {
  // Dummy data for demonstration purposes
  final Map<String, dynamic> societyData = {
    'name': 'Computer Science Society',
    'mission': 'Fostering innovation and collaboration in computer science.',
    'activities': ['Hackathons', 'Workshops', 'Tech Talks'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Society Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              societyData['name'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Mission:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              societyData['mission'],
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Activities:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: societyData['activities']
                  .map((activity) => Text('• $activity', style: TextStyle(fontSize: 16)))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

