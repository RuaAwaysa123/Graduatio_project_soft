import 'dart:convert';

import 'package:rive_animation/facebook/profile.dart';
import 'package:rive_animation/model/society.dart';

import 'User1.dart';

class Event {
  final String id;
  final String name;
  final List<String> topics;
  final List<String> majors;
  final String location;
  final bool isOnline;
  final DateTime dateTime;
  final double price;
  final List<Society> organizers;
  final List<User> interestedStudents;
  final List<String> audience;
  final String description;
  final String image;

  Event({
    required this.id,
    required this.name,
    required this.topics,
    required this.majors,
    required this.location,
    required this.isOnline,
    required this.dateTime,
    required this.price,
    required this.organizers,
    required this.interestedStudents,
    required this.audience,
    required this.description,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'topics': topics,
      'majors': majors,
      'location': location,
      'isOnline': isOnline,
      'dateTime': dateTime.toIso8601String(),
      'price': price,
      'organizers': organizers,
      'interestedStudents': interestedStudents,
      'audience': audience,
      'description': description,
      'image': image,
    };
  }

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      topics: List<String>.from(map['topics'] ?? []),
      majors: List<String>.from(map['majors'] ?? []),
      location: map['location'] ?? '',
      isOnline: map['isOnline'] ?? false,
      dateTime: DateTime.parse(map['dateTime']),
      price: map['price'] ?? 0.0,
      // organizers:
      organizers: (map['organizers'] as List<dynamic>?)
          ?.map((course) => Society.fromMap(course))
          .toList() ??
          [],
      interestedStudents: (map['interestedStudents'] as List<dynamic>?)
          ?.map((interestedStudents) => User.fromMap(interestedStudents))
          .toList() ??
          [],
      audience: List<String>.from(map['audience'] ?? []),
      description: map['description'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Event.fromJson(String source) => Event.fromMap(json.decode(source));
}
