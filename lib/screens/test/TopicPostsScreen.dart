// import 'package:flutter/material.dart';
//
// class TopicPostsScreen extends StatelessWidget {
//   final String topic;
//
//   TopicPostsScreen({required this.topic});
//
//   @override
//   Widget build(BuildContext context) {
//     // Replace this with the actual list of posts related to the selected topic
//     List<String> posts = [
//       "Post 1 related to $topic",
//       "Post 2 related to $topic",
//       "Post 3 related to $topic",
//     ];
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Posts related to $topic'),
//       ),
//       body: ListView.builder(
//         itemCount: posts.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(posts[index]),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class TopicPostsScreen extends StatefulWidget {
  final String topic;

  TopicPostsScreen({required this.topic});

  @override
  _TopicPostsScreenState createState() => _TopicPostsScreenState();
}

class _TopicPostsScreenState extends State<TopicPostsScreen> {
  List<String> posts = [
    "Post 1 related to C++",
    "Post 2 related to C++",
    "Post 3 related to C++",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts related to ${widget.topic}'),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(posts[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _createPost(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _createPost(BuildContext context) async {
    final newPost = await _showCreatePostDialog(context);

    if (newPost != null) {
      setState(() {
        posts.add(newPost);
      });
    }
  }

  Future<String?> _showCreatePostDialog(BuildContext context) async {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        TextEditingController textEditingController = TextEditingController();
        return AlertDialog(
          title: Text('Create a new post'),
          content: TextFormField(
            controller: textEditingController,
            decoration: InputDecoration(labelText: 'Post content'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context, null); // Cancel
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                String postContent = textEditingController.text;
                Navigator.pop(context, postContent); // Return the post content
              },
              child: Text('Create'),
            ),
          ],
        );
      },
    );
  }
}

