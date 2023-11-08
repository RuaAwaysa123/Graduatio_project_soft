import 'package:flutter/cupertino.dart';

class Info {
  Widget? icon;
  String? normalText;
  String? boldText;

  Info({this.icon, this.normalText, this.boldText});
}
class Member {
  final String name;
  final String role;

  Member({required this.name, required this.role});
}