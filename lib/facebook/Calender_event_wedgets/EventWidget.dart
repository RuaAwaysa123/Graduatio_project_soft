import 'package:flutter/material.dart';

class EventWidget extends StatelessWidget {
  final String eventName;
  final String imageUrl;
  final DateTime eventDate;
  final String eventInfo;
  final String organizer;
  final DateTime startTime;
  final DateTime endTime;
  final double price;

  EventWidget({
    required this.eventName,
    required this.imageUrl,
    required this.eventDate,
    required this.eventInfo,
    required this.organizer,
    required this.startTime,
    required this.endTime,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                eventName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                onPressed: () {
                  // Handle favorite button click
                },
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${_getFormattedDate(eventDate)}',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  SizedBox(height: 15),
                  Text(
                    eventInfo,
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Text(
              //   'Organized in:', //$organizer',
              //   style: TextStyle(fontSize: 12, color: Colors.grey),
              // ),
              Row(
                children: [
                  Text(
                    'Organized in:', //$organizer',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.access_time, size: 14, color: Colors.grey),
                  SizedBox(width: 4),
                  Text(
                    '${_getFormattedTime(startTime)} - ${_getFormattedTime(endTime)}',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  SizedBox(width: 50),
                  Text(
                    '\$${price.toString()}',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _getFormattedDate(DateTime dateTime) {
    return '${dateTime.day} ${_getMonthName(dateTime.month)} ${dateTime.year}';
  }

  String _getFormattedTime(DateTime dateTime) {
    String period = 'AM';
    int hour = dateTime.hour;
    if (hour >= 12) {
      period = 'PM';
      if (hour > 12) {
        hour -= 12;
      }
    }
    return '${hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')} $period';
  }

  String _getMonthName(int month) {
    final monthNames = [
      'January', 'February', 'March', 'April', 'May', 'June', 'July',
      'August', 'September', 'October', 'November', 'December',
    ];
    return monthNames[month - 1];
  }
}
