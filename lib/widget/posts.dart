import 'package:flutter/material.dart';
import 'package:rive_animation/model/post_model.dart';
import 'package:rive_animation/screens/test/post_screen.dart';

class Posts extends StatefulWidget {
  final String? topic;

  Posts({this.topic});

  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  TextEditingController replyController = TextEditingController();

  void _toggleVote(Question question) {
    setState(() {
      if (question.isVoted) {
        question.votes--;
      } else {
        question.votes++;
      }
      question.isVoted = !question.isVoted;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Question> filteredQuestions = widget.topic != null
        ? questions.where((question) => question.topics.contains(widget.topic)).toList()
        : questions;

    return Column(
      children: filteredQuestions.map((question) => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PostScreen(
                question: question,
                onReplyAdded: () {
                  // Handle the reply added callback if needed
                },
              ),
            ),
          );
        },
        child: Container(
          height: 180,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26.withOpacity(0.05),
                offset: Offset(0.0, 6.0),
                blurRadius: 10.0,
                spreadRadius: 0.10,
              )
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 70,
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage(question.author.imageUrl),
                        radius: 22,
                      ),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Text(
                                question.question,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: .4,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(height: 2.0),
                            Row(
                              children: <Widget>[
                                Text(
                                  question.author.name,
                                  style: TextStyle(
                                    color: Colors.grey.withOpacity(0.6),
                                  ),
                                ),
                                SizedBox(width: 15),
                                Text(
                                  question.created_at,
                                  style: TextStyle(
                                    color: Colors.grey.withOpacity(0.6),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.book_online,
                        color: Colors.grey.withOpacity(0.6),
                        size: 26,
                      ),
                    ],
                  ),

                ),
                Container(
                  height: 50,
                  child: Center(
                    child: Text(
                      "${question.content.substring(0, 80)}..",
                      style: TextStyle(
                        color: Colors.grey.withOpacity(0.8),
                        fontSize: 16,
                        letterSpacing: .3,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () => _toggleVote(question),
                            child: Icon(
                              question.isVoted ? Icons.thumb_up : Icons.thumb_up_outlined,
                              color: question.isVoted ? Colors.blue : Colors.grey.withOpacity(0.6),
                              size: 22,
                            ),
                          ),
                          SizedBox(width: 4.0),
                          Text(
                            "${question.votes} votes",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.withOpacity(0.6),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )).toList(),
    );
  }
}
