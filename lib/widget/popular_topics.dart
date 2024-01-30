import 'package:flutter/material.dart';

import '../screens/test/TopicPostsScreen.dart';



class PopularTopics extends StatelessWidget {
  List<String> contents = ["C++", "Laravel", "Node Js", "Flutter"];
  List<Color> colors = [Colors.blue.withOpacity(0.6), Colors.blueAccent.withOpacity(0.2), Colors.greenAccent, Colors.redAccent];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: contents.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              // Navigate to the TopicPostsScreen when a topic is selected
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TopicPostsScreen(topic: contents[index]),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.only(left: 20.0),
              height: 180,
              width: 170,
              decoration: BoxDecoration(
                color: colors[index],
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      contents[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "30 posts",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        letterSpacing: .7,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
