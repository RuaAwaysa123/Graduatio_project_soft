import 'package:flutter/material.dart';


class Course {
  final String title;
  final String category;
  final String level;

  Course({required this.title, required this.category, required this.level});
}


class CourseListScreen extends StatefulWidget {
  @override
  _CourseListScreenState createState() => _CourseListScreenState();
}

class _CourseListScreenState extends State<CourseListScreen> {
  late List<Course> _courses;
  late List<Course> _filteredCourses;

  @override
  void initState() {
    super.initState();
    // Initialize your course data
    _courses = [
      Course(title: 'Flutter Development', category: 'Mobile', level: 'Intermediate'),
      Course(title: 'Python Programming', category: 'Programming', level: 'Beginner'),
      Course(title: 'Machine Learning', category: 'Data Science', level: 'Advanced'),
      // Add more courses...
    ];
    _filteredCourses = _courses;
  }

  void _filterCourses(String query) {
    setState(() {
      _filteredCourses = _courses.where((course) {
        final titleLower = course.title.toLowerCase();
        final queryLower = query.toLowerCase();

        return titleLower.contains(queryLower);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Course Filter'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: _filterCourses,
              decoration: InputDecoration(
                labelText: 'Search Courses',
                hintText: 'Enter course name',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredCourses.length,
              itemBuilder: (context, index) {
                final course = _filteredCourses[index];
                return ListTile(
                  title: Text(course.title),
                  subtitle: Text('Category: ${course.category}, Level: ${course.level}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
