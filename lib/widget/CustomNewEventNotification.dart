import 'package:flutter/material.dart';

class CustomNewEventNotification extends StatelessWidget {
  const CustomNewEventNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage("assets/images/ieee.png"),
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New Event Added",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Inter',
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Don't miss out on our upcoming event!",
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
                // Handle button tap to view event details
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Change to your desired color
                onPrimary: Colors.white, // Change to your desired color
              ),
              child: Text("View Event"),
            ),
          ),
        ),
      ],
    );
  }
}
