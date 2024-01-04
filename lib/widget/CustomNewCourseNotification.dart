import 'package:flutter/material.dart';

class CustomNewCourseNotification extends StatelessWidget {
  const CustomNewCourseNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage("assets/shapes/R.jpg"),
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New Course Available",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Inter',
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Explore exciting new content!",
              style: TextStyle(
                color: Colors.grey,
                fontFamily: 'Inter',
                fontSize: 9,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 50),
            child: ElevatedButton(
              onPressed: () {
                // Handle button tap
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Change to your desired color
                onPrimary: Colors.white, // Change to your desired color
              ),
              child: Text("Enroll Now"),
            ),
          ),
        ),
      ],
    );
  }
}
