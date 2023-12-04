import 'package:rive_animation/model/author_model.dart';

class Reply {
  String content;
  int likes;
   Author author;

  Reply({
    required this.content,
    required this.likes,
     required this.author,
  });
}

List<Reply> replies = [
  Reply(
    author: Saly,
    content: 'try to learn php using udemy or youtube courses if your good enough learn from docs',
    likes: 10
  ),
  Reply(
    author: Nada,
    content: 'Yes  ....',
    likes: 120
  ),


];