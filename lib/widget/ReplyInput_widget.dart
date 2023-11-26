import 'package:flutter/material.dart';

class ReplyInputWidget extends StatelessWidget {
  final TextEditingController replyController;
  final VoidCallback onReplySubmitted;

  ReplyInputWidget({
    required this.replyController,
    required this.onReplySubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            controller: replyController,
            decoration: InputDecoration(
              hintText: 'Type your reply...',
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.send),
          onPressed: onReplySubmitted,
        ),
      ],
    );
  }
}
