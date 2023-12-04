import 'package:rive_animation/model/author_model.dart';
import 'package:rive_animation/model/replies_model.dart';

class Question{
  String question;
  String content;

  int votes;
  bool isVoted;
  List<String> topics; // Add this line to define the topics property

  int repliesCount;
  int views;
  String created_at;
  Author author;
  List<Reply> replies;

  Question({
    required this.question,
    required this.content,
    required this.votes,
    this.isVoted = false,
    required this.repliesCount,
    required this.views,
    required this.created_at,
    required this.topics,
    required this.author,
    required this.replies
  });
}

List<Question> questions = [
  Question(
    author: AYA,
    question: 'C ++ is important ',
    content: "C++ is a high-level, general-purpose programming language created by Danish computer scientist Bjarne Stroustrup. First released in 1985 as an extension of the C programming language, it has since expanded significantly over time; as of 1997 C++",
    created_at: "1h ago",
    views: 120,
    votes: 100,
    repliesCount: 80,
      topics: [ 'node js'],  // Add topics here
    replies: replies
  ),
  Question(
    author: Rua,
    question: 'List<Dynamic> is not a subtype of Lits<Container>',
    content: "with no change to the body of the code - then to get a List<dynamic> just call it as: List<dynamic> list = GetSwimlaneAttribute(...).ToList(); If you absolutely can't change the declaration, you could convert it outside the method: IEnumerable<dynamic> sequence = GetSwimlaneAttribute(...);",
    created_at: "2h ago",
    views: 20,
    votes: 10,
      topics: ['C++', 'node js'],  // Add topics here
    repliesCount: 10,
    replies: replies
  ),
  Question(
    author: sam,
    question: 'React a basic error 404 is not typed',
    content: "How to solvevAssetBundleImageProvider._loadAsync (package:flutter/src/painting/image_provider.dart:811:18) error ",
    created_at: "4h ago",
    views: 220,
    votes: 107,
      topics: ['laravel', 'node js'],  // Add topics here
    repliesCount: 67,
    replies: replies

  ),
  Question(
    author: Nada,
    question: 'node js back end ',
    content: "Node.js is an open-source, cross-platform JavaScript runtime environment facilitated by the Linux Foundation's Collaborative Projects program. The OpenJS Foundation is the premier ...",
    created_at: "10h ago",
    views: 221,
      topics: ['C++', 'node jd '],  // Add topics here
    votes: 109,
    repliesCount: 67,
    replies: replies
  ),
  Question(
    author: Ahmad,
    question: 'Any one Know C++  here',
    content: "I'm first year student need some one to help me in c++ .................................................... ",
    created_at: "24h ago",
      topics: ['laravel'],  // Add topics here
    views: 325,
    votes: 545,
    repliesCount: 120,
    replies: replies
  ),
];