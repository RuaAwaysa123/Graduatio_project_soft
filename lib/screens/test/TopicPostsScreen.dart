import 'package:flutter/material.dart';
import 'package:rive_animation/widget/posts.dart';

class TopicPostsScreen extends StatelessWidget {
  final String topic;

  TopicPostsScreen({required this.topic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts - $topic'), // Customize the title as needed
      ),
      body: Posts(topic: topic),
    );
  }
}
