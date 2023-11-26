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
    author: mike,
    content: 'LMOA try to learn php using udemy or youtube courses if your good enough elrrn from docs',
    likes: 10
  ),
  Reply(
    author: john,
    content: 'Officiis iusto dolorum delectus totam. Replioe',
    likes: 120
  ),


];