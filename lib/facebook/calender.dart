// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
// //
// //
// // class DemoApp extends StatefulWidget {
// //   @override
// //   _DemoAppState createState() => _DemoAppState();
// // }
// //
// // class _DemoAppState extends State<DemoApp> {
// //
// //   late DateTime selectedDay;
// //   late List <CleanCalendarEvent> selectedEvent;
// //
// //   final Map<DateTime,List<CleanCalendarEvent>> events = {
// //     DateTime (DateTime.now().year,DateTime.now().month,DateTime.now().day):
// //         [
// //           CleanCalendarEvent('Event A',
// //           startTime: DateTime(
// //               DateTime.now().year,DateTime.now().month,DateTime.now().day,10,0),
// //             endTime:  DateTime(
// //                 DateTime.now().year,DateTime.now().month,DateTime.now().day,12,0),
// //             description: 'A special event',
// //             color: Colors.blue,),
// //         ],
// //
// //     DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2):
// //     [
// //       CleanCalendarEvent('Event B',
// //           startTime: DateTime(DateTime.now().year, DateTime.now().month,
// //               DateTime.now().day + 2, 10, 0),
// //           endTime: DateTime(DateTime.now().year, DateTime.now().month,
// //               DateTime.now().day + 2, 12, 0),
// //           color: Colors.orange),
// //       CleanCalendarEvent('Event C',
// //           startTime: DateTime(DateTime.now().year, DateTime.now().month,
// //               DateTime.now().day + 2, 14, 30),
// //           endTime: DateTime(DateTime.now().year, DateTime.now().month,
// //               DateTime.now().day + 2, 17, 0),
// //           color: Colors.pink),
// //     ],
// //   };
// //
// //   void _handleData(date){
// //     setState(() {
// //       selectedDay = date;
// //       selectedEvent = events[selectedDay] ?? [];
// //     });
// //     print(selectedDay);
// //   }
// //   @override
// //   void initState() {
// //     // TODO: implement initState
// //     selectedEvent = events[selectedDay] ?? [];
// //     super.initState();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Calendar'),
// //         centerTitle: true,
// //       ),
// //       body:  SafeArea(
// //         child: Container(
// //           child: Calendar(
// //             startOnMonday: true,
// //             selectedColor: Colors.blue,
// //             todayColor: Colors.red,
// //             eventColor: Colors.green,
// //             eventDoneColor: Colors.amber,
// //             bottomBarColor: Colors.deepOrange,
// //             onRangeSelected: (range) {
// //               print('selected Day ${range.from},${range.to}');
// //             },
// //             onDateSelected: (date){
// //               return _handleData(date);
// //             },
// //             events: events,
// //             isExpanded: true,
// //             dayOfWeekStyle: TextStyle(
// //               fontSize: 15,
// //               color: Colors.black12,
// //               fontWeight: FontWeight.w100,
// //             ),
// //             bottomBarTextStyle: TextStyle(
// //               color: Colors.white,
// //             ),
// //             hideBottomBar: false,
// //             hideArrows: false,
// //             weekDays: ['Mon','Tue','Wed','Thu','Fri','Sat','Sun'],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
//
// class DemoApp extends StatefulWidget {
//   @override
//   _DemoAppState createState() => _DemoAppState();
// }
//
// class _DemoAppState extends State<DemoApp> {
//   late DateTime selectedDay;
//   late List<CleanCalendarEvent> selectedEvent;
//
//   final Map<DateTime, List<CleanCalendarEvent>> events = {
//     DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day): [
//       CleanCalendarEvent(
//         'Event A',
//         startTime: DateTime(
//           DateTime.now().year,
//           DateTime.now().month,
//           DateTime.now().day,
//           10,
//           0,
//         ),
//         endTime: DateTime(
//           DateTime.now().year,
//           DateTime.now().month,
//           DateTime.now().day,
//           12,
//           0,
//         ),
//         description: 'A special event',
//         color: Colors.blueAccent,
//       ),
//     ],
//     DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2): [
//       CleanCalendarEvent(
//         'Event B',
//         startTime: DateTime(
//           DateTime.now().year,
//           DateTime.now().month,
//           DateTime.now().day + 2,
//           10,
//           0,
//         ),
//         endTime: DateTime(
//           DateTime.now().year,
//           DateTime.now().month,
//           DateTime.now().day + 2,
//           12,
//           0,
//         ),
//         color: Colors.orange,
//       ),
//       CleanCalendarEvent(
//         'Event C',
//         startTime: DateTime(
//           DateTime.now().year,
//           DateTime.now().month,
//           DateTime.now().day + 2,
//           14,
//           30,
//         ),
//         endTime: DateTime(
//           DateTime.now().year,
//           DateTime.now().month,
//           DateTime.now().day + 2,
//           17,
//           0,
//         ),
//         color: Colors.pink,
//       ),
//     ],
//   };
//
//   void _handleData(date) {
//     setState(() {
//       selectedDay = date;
//       selectedEvent = events[selectedDay] ?? [];
//     });
//     print(selectedDay);
//   }
//
//   @override
//   void initState() {
//     selectedEvent = events[selectedDay] ?? [];
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Calendar'),
//         centerTitle: true,
//       ),
//       body: SafeArea(
//         child: Container(
//           child: Calendar(
//             startOnMonday: true,
//             selectedColor: Colors.blue,
//             todayColor: Colors.red,
//             eventColor: Colors.green,
//             eventDoneColor: Colors.amber,
//             bottomBarColor: Colors.deepOrange,
//             onRangeSelected: (range) {
//               print('selected Day ${range.from},${range.to}');
//             },
//             onDateSelected: (date) {
//               return _handleData(date);
//             },
//             events: events,
//             isExpanded: true,
//             dayOfWeekStyle: TextStyle(
//               fontSize: 15,
//               color: Colors.black12,
//               fontWeight: FontWeight.w100,
//             ),
//             bottomBarTextStyle: TextStyle(
//               color: Colors.white,
//             ),
//             hideBottomBar: false,
//             hideArrows: false,
//             weekDays: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _selectedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Calendar'),
      ),
      body: Column(
        children: [
          TableCalendar(
            calendarFormat: _calendarFormat,
            focusedDay: _selectedDay,
            firstDay: DateTime.utc(2023, 1, 1),
            lastDay: DateTime.utc(2023, 12, 31),
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
              });
            },
          ),
          SizedBox(height: 20),
          Text(
            'Events for ${_selectedDay.toLocal()}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          // Add a function to display events based on the selected day
          displayEventsForSelectedDay(),
        ],
      ),
    );
  }

  Widget displayEventsForSelectedDay() {
    // Replace this with your logic to fetch and display events for the selected day
    List<String> events = ['Event 1', 'Event 2'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: events.map((event) => Text(event)).toList(),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CalendarPage(),
  ));
}
