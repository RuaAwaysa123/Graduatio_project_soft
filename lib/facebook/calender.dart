// // // // // // import 'package:flutter/material.dart';
// // // // // // import 'package:syncfusion_flutter_calendar/calendar.dart';
// // // // // //
// // // // // // class MyCalendarPage extends StatelessWidget {
// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Scaffold(
// // // // // //       appBar: AppBar(
// // // // // //         title: Text('Syncfusion Calendar'),
// // // // // //       ),
// // // // // //       body: SfCalendar(
// // // // // //         view: CalendarView.month,
// // // // // //         dataSource: _getCalendarDataSource(),
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // //
// // // // // //   CalendarDataSource _getCalendarDataSource() {
// // // // // //     List<Appointment> appointments = <Appointment>[];
// // // // // //
// // // // // //     // Add some sample appointments
// // // // // //     appointments.add(Appointment(
// // // // // //       startTime: DateTime.now().add(Duration(hours: 2)),
// // // // // //       endTime: DateTime.now().add(Duration(hours: 3)),
// // // // // //       subject: 'Meeting with Client',
// // // // // //       color: Colors.blue,
// // // // // //     ));
// // // // // //
// // // // // //     appointments.add(Appointment(
// // // // // //       startTime: DateTime.now().add(Duration(days: 1)),
// // // // // //       endTime: DateTime.now().add(Duration(days: 1, hours: 1)),
// // // // // //       subject: 'Team Lunch',
// // // // // //       color: Colors.green,
// // // // // //     ));
// // // // // //
// // // // // //     // You can add more appointments as needed
// // // // // //
// // // // // //     return _DataSource(appointments);
// // // // // //   }
// // // // // // }
// // // // // //
// // // // // // class _DataSource extends CalendarDataSource {
// // // // // //   _DataSource(List<Appointment> source) {
// // // // // //     appointments = source;
// // // // // //   }
// // // // // // }
// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:syncfusion_flutter_calendar/calendar.dart';
// // // // //
// // // // // class MyCalendarPage extends StatefulWidget {
// // // // //   @override
// // // // //   _MyCalendarPageState createState() => _MyCalendarPageState();
// // // // // }
// // // // //
// // // // // class _MyCalendarPageState extends State<MyCalendarPage> {
// // // // //   late CalendarController _calendarController;
// // // // //   late List<Appointment> _appointments;
// // // // //
// // // // //   @override
// // // // //   void initState() {
// // // // //     super.initState();
// // // // //     _calendarController = CalendarController();
// // // // //     _appointments = _getCalendarDataSource();
// // // // //   }
// // // // //
// // // // //   List<Appointment> _getCalendarDataSource() {
// // // // //     // Initialize with some sample appointments
// // // // //     return <Appointment>[
// // // // //       Appointment(
// // // // //         startTime: DateTime.now().add(Duration(hours: 2)),
// // // // //         endTime: DateTime.now().add(Duration(hours: 3)),
// // // // //         subject: 'Meeting with Client',
// // // // //         color: Colors.blue,
// // // // //       ),
// // // // //       Appointment(
// // // // //         startTime: DateTime.now().add(Duration(days: 1)),
// // // // //         endTime: DateTime.now().add(Duration(days: 1, hours: 1)),
// // // // //         subject: 'Team Lunch',
// // // // //         color: Colors.green,
// // // // //       ),
// // // // //     ];
// // // // //   }
// // // // //
// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Scaffold(
// // // // //       appBar: AppBar(
// // // // //         title: Text('Syncfusion Calendar'),
// // // // //       ),
// // // // //       body: SfCalendar(
// // // // //         view: CalendarView.month,
// // // // //         controller: _calendarController,
// // // // //         dataSource: AppointmentDataSource(_appointments),
// // // // //         onTap: (CalendarTapDetails details) {
// // // // //           if (details.targetElement == CalendarElement.calendarCell) {
// // // // //             _showAddEventDialog(details.date!);
// // // // //           } else if (details.targetElement == CalendarElement.appointment) {
// // // // //             _showEditEventDialog(details.appointments![0]);
// // // // //           }
// // // // //         },
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // //
// // // // //   void _showAddEventDialog(DateTime selectedDate) async {
// // // // //     TimeOfDay? selectedTime = await _showTimePicker();
// // // // //     if (selectedTime != null) {
// // // // //       showDialog(
// // // // //         context: context,
// // // // //         builder: (BuildContext context) {
// // // // //           return AlertDialog(
// // // // //             title: Text('Add Event'),
// // // // //             content: Column(
// // // // //               mainAxisSize: MainAxisSize.min,
// // // // //               children: [
// // // // //                 TextFormField(
// // // // //                   decoration: InputDecoration(labelText: 'Event Name'),
// // // // //                   onSaved: (value) {
// // // // //                     if (value != null && value.isNotEmpty) {
// // // // //                       setState(() {
// // // // //                         _appointments.add(Appointment(
// // // // //                           startTime: DateTime(
// // // // //                               selectedDate.year,
// // // // //                               selectedDate.month,
// // // // //                               selectedDate.day,
// // // // //                               selectedTime.hour,
// // // // //                               selectedTime.minute),
// // // // //                           endTime: DateTime(
// // // // //                               selectedDate.year,
// // // // //                               selectedDate.month,
// // // // //                               selectedDate.day,
// // // // //                               selectedTime.hour + 1,
// // // // //                               selectedTime.minute),
// // // // //                           subject: value,
// // // // //                           color: Colors.orange,
// // // // //                         ));
// // // // //                       });
// // // // //                     }
// // // // //                     Navigator.pop(context);
// // // // //                   },
// // // // //                 ),
// // // // //               ],
// // // // //             ),
// // // // //             actions: [
// // // // //               ElevatedButton(
// // // // //                 onPressed: () {
// // // // //                   Navigator.pop(context);
// // // // //                 },
// // // // //                 child: Text('Cancel'),
// // // // //               ),
// // // // //               ElevatedButton(
// // // // //                 onPressed: () {
// // // // //                   // Save the event
// // // // //                   Form.of(context)!.save();
// // // // //                 },
// // // // //                 child: Text('Save'),
// // // // //               ),
// // // // //             ],
// // // // //           );
// // // // //         },
// // // // //       );
// // // // //     }
// // // // //   }
// // // // //
// // // // //   void _showEditEventDialog(Appointment appointment) async {
// // // // //     TimeOfDay? selectedTime = await _showTimePicker();
// // // // //     if (selectedTime != null) {
// // // // //       showDialog(
// // // // //         context: context,
// // // // //         builder: (BuildContext context) {
// // // // //           String eventName = appointment.subject!;
// // // // //           return AlertDialog(
// // // // //             title: Text('Edit Event'),
// // // // //             content: Column(
// // // // //               mainAxisSize: MainAxisSize.min,
// // // // //               children: [
// // // // //                 TextFormField(
// // // // //                   initialValue: eventName,
// // // // //                   decoration: InputDecoration(labelText: 'Event Name'),
// // // // //                   onSaved: (value) {
// // // // //                     if (value != null && value.isNotEmpty) {
// // // // //                       setState(() {
// // // // //                         appointment.startTime = DateTime(
// // // // //                             appointment.startTime!.year,
// // // // //                             appointment.startTime!.month,
// // // // //                             appointment.startTime!.day,
// // // // //                             selectedTime.hour,
// // // // //                             selectedTime.minute);
// // // // //                         appointment.endTime = DateTime(
// // // // //                             appointment.startTime!.year,
// // // // //                             appointment.startTime!.month,
// // // // //                             appointment.startTime!.day,
// // // // //                             selectedTime.hour + 1,
// // // // //                             selectedTime.minute);
// // // // //                         appointment.subject = value;
// // // // //                       });
// // // // //                     }
// // // // //                     Navigator.pop(context);
// // // // //                   },
// // // // //                 ),
// // // // //               ],
// // // // //             ),
// // // // //             actions: [
// // // // //               ElevatedButton(
// // // // //                 onPressed: () {
// // // // //                   Navigator.pop(context);
// // // // //                 },
// // // // //                 child: Text('Cancel'),
// // // // //               ),
// // // // //               ElevatedButton(
// // // // //                 onPressed: () {
// // // // //                   // Save the edited event
// // // // //                   Form.of(context)!.save();
// // // // //                 },
// // // // //                 child: Text('Save'),
// // // // //               ),
// // // // //               ElevatedButton(
// // // // //                 onPressed: () {
// // // // //                   // Delete the event
// // // // //                   setState(() {
// // // // //                     _appointments.remove(appointment);
// // // // //                   });
// // // // //                   Navigator.pop(context);
// // // // //                 },
// // // // //                 style: ElevatedButton.styleFrom(primary: Colors.red),
// // // // //                 child: Text('Delete'),
// // // // //               ),
// // // // //             ],
// // // // //           );
// // // // //         },
// // // // //       );
// // // // //     }
// // // // //   }
// // // // //
// // // // //   Future<TimeOfDay?> _showTimePicker() async {
// // // // //     return await showTimePicker(
// // // // //       context: context,
// // // // //       initialTime: TimeOfDay.now(),
// // // // //     );
// // // // //   }
// // // // // }
// // // // //
// // // // // class AppointmentDataSource extends CalendarDataSource {
// // // // //   AppointmentDataSource(List<Appointment> source) {
// // // // //     appointments = source;
// // // // //   }
// // // // import 'package:flutter/material.dart';
// // // // import 'package:syncfusion_flutter_calendar/calendar.dart';
// // // //
// // // // class MyCalendarPage extends StatefulWidget {
// // // //   @override
// // // //   _MyCalendarPageState createState() => _MyCalendarPageState();
// // // // }
// // // //
// // // // class _MyCalendarPageState extends State<MyCalendarPage> {
// // // //   late CalendarController _calendarController;
// // // //   late List<Appointment> _appointments;
// // // //
// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     _calendarController = CalendarController();
// // // //     _appointments = _getCalendarDataSource();
// // // //   }
// // // //
// // // //   List<Appointment> _getCalendarDataSource() {
// // // //     // Initialize with some sample appointments
// // // //     return <Appointment>[
// // // //       Appointment(
// // // //         startTime: DateTime.now().add(Duration(hours: 2)),
// // // //         endTime: DateTime.now().add(Duration(hours: 3)),
// // // //         subject: 'Meeting with Client',
// // // //         color: Colors.blue,
// // // //       ),
// // // //       Appointment(
// // // //         startTime: DateTime.now().add(Duration(days: 1)),
// // // //         endTime: DateTime.now().add(Duration(days: 1, hours: 1)),
// // // //         subject: 'Team Lunch',
// // // //         color: Colors.green,
// // // //       ),
// // // //     ];
// // // //   }
// // // //
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: Text('Syncfusion Calendar'),
// // // //       ),
// // // //       body: Column(
// // // //         children: [
// // // //           SfCalendar(
// // // //             view: CalendarView.month,
// // // //             controller: _calendarController,
// // // //             dataSource: AppointmentDataSource(_appointments),
// // // //             onTap: (CalendarTapDetails details) {
// // // //               _showDetailsDialog(details.date!);
// // // //             },
// // // //           ),
// // // //           SizedBox(height: 10),
// // // //           Expanded(
// // // //             child: ListView.builder(
// // // //               itemCount: _appointments.length,
// // // //               itemBuilder: (context, index) {
// // // //                 return ListTile(
// // // //                   title: Text(_appointments[index].subject!),
// // // //                   subtitle: Text(
// // // //                     '${_appointments[index].startTime!.toString()} - ${_appointments[index].endTime!.toString()}',
// // // //                   ),
// // // //                   onTap: () {
// // // //                     _showEditEventDialog(_appointments[index]);
// // // //                   },
// // // //                 );
// // // //               },
// // // //             ),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // //
// // // //   // void _showDetailsDialog(DateTime selectedDate) {
// // // //   //   showDialog(
// // // //   //     context: context,
// // // //   //     builder: (context) {
// // // //   //       return AlertDialog(
// // // //   //         title: Text('Select Details'),
// // // //   //         content: Column(
// // // //   //           mainAxisSize: MainAxisSize.min,
// // // //   //           children: [
// // // //   //             Text('Selected Date: $selectedDate'),
// // // //   //             ElevatedButton(
// // // //   //               onPressed: () async {
// // // //   //                 DateTime? selectedTime = (await _showTimePicker()) as DateTime?;
// // // //   //                 print('Selected Time: $selectedTime');
// // // //   //                 Navigator.pop(context);
// // // //   //               },
// // // //   //               child: Text('Choose Time'),
// // // //   //             ),
// // // //   //           ],
// // // //   //         ),
// // // //   //       );
// // // //   //     },
// // // //   //   );
// // // //   // }
// // // //   void _showDetailsDialog(DateTime selectedDate) {
// // // //     TextEditingController eventNameController = TextEditingController();
// // // //     TextEditingController topicsController = TextEditingController();
// // // //     TextEditingController audienceController = TextEditingController();
// // // //     TextEditingController startTimeController = TextEditingController();
// // // //     TextEditingController endTimeController = TextEditingController();
// // // //
// // // //     bool isOnline = false;
// // // //     String? selectedRoom;
// // // //
// // // //     showDialog(
// // // //       context: context,
// // // //       builder: (context) {
// // // //         return AlertDialog(
// // // //           title: Text('Add Event'),
// // // //           content: SingleChildScrollView(
// // // //             child: Column(
// // // //               mainAxisSize: MainAxisSize.min,
// // // //               children: [
// // // //                 TextField(
// // // //                   controller: eventNameController,
// // // //                   decoration: InputDecoration(labelText: 'Event Name'),
// // // //                 ),
// // // //                 TextField(
// // // //                   controller: topicsController,
// // // //                   decoration: InputDecoration(labelText: 'List of Topics'),
// // // //                 ),
// // // //                 TextField(
// // // //                   controller: audienceController,
// // // //                   decoration: InputDecoration(labelText: 'Audience Type'),
// // // //                 ),
// // // //                 Row(
// // // //                   children: [
// // // //                     Text('Online Event'),
// // // //                     Switch(
// // // //                       value: isOnline,
// // // //                       onChanged: (value) {
// // // //                         setState(() {
// // // //                           isOnline = value;
// // // //                           if (!isOnline) {
// // // //                             // Reset room selection when switching to offline
// // // //                             selectedRoom = null;
// // // //                           }
// // // //                         });
// // // //                       },
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //                 if (!isOnline)
// // // //                   DropdownButton<String>(
// // // //                     value: selectedRoom,
// // // //                     onChanged: (String? newValue) {
// // // //                       setState(() {
// // // //                         selectedRoom = newValue;
// // // //                       });
// // // //                     },
// // // //                     items: <String>['Room A', 'Room B', 'Room C']
// // // //                         .map<DropdownMenuItem<String>>(
// // // //                           (String value) => DropdownMenuItem<String>(
// // // //                         value: value,
// // // //                         child: Text(value),
// // // //                       ),
// // // //                     )
// // // //                         .toList(),
// // // //                     hint: Text('Select Room'),
// // // //                   ),
// // // //                 Row(
// // // //                   children: [
// // // //                     ElevatedButton(
// // // //                       onPressed: () async {
// // // //                         TimeOfDay? startTime = await _showTimePicker();
// // // //                         if (startTime != null) {
// // // //                           startTimeController.text =
// // // //                           '${startTime.hour}:${startTime.minute}';
// // // //                         }
// // // //                       },
// // // //                       child: Text('Choose Start Time'),
// // // //                     ),
// // // //                     SizedBox(width: 10),
// // // //                     ElevatedButton(
// // // //                       onPressed: () async {
// // // //                         TimeOfDay? endTime = await _showTimePicker();
// // // //                         if (endTime != null) {
// // // //                           endTimeController.text =
// // // //                           '${endTime.hour}:${endTime.minute}';
// // // //                         }
// // // //                       },
// // // //                       child: Text('Choose End Time'),
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //                 SizedBox(height: 10),
// // // //                 ElevatedButton(
// // // //                   onPressed: () {
// // // //                     // Save the details and add the event
// // // //                     String eventName = eventNameController.text;
// // // //                     String topics = topicsController.text;
// // // //                     String audience = audienceController.text;
// // // //                     String startTime = startTimeController.text;
// // // //                     String endTime = endTimeController.text;
// // // //
// // // //                     // Create the appointment with the entered details
// // // //                     Appointment newAppointment = Appointment(
// // // //                       startTime: DateTime(
// // // //                         selectedDate.year,
// // // //                         selectedDate.month,
// // // //                         selectedDate.day,
// // // //                         int.parse(startTime.split(':')[0]),
// // // //                         int.parse(startTime.split(':')[1]),
// // // //                       ),
// // // //                       endTime: DateTime(
// // // //                         selectedDate.year,
// // // //                         selectedDate.month,
// // // //                         selectedDate.day,
// // // //                         int.parse(endTime.split(':')[0]),
// // // //                         int.parse(endTime.split(':')[1]),
// // // //                       ),
// // // //                       subject: eventName,
// // // //                       color: Colors.blue,
// // // //                     );
// // // //
// // // //                     // Add the new appointment to the list
// // // //                     setState(() {
// // // //                       _appointments.add(newAppointment);
// // // //                     });
// // // //
// // // //                     Navigator.pop(context); // Close the dialog
// // // //                   },
// // // //                   child: Text('Save'),
// // // //                 ),
// // // //               ],
// // // //             ),
// // // //           ),
// // // //         );
// // // //       },
// // // //     );
// // // //   }
// // // //
// // // //   void _showAddEventDialog(DateTime selectedDate) async {
// // // //     final GlobalKey<FormState> formKey = GlobalKey<FormState>();
// // // //     TimeOfDay? selectedTime = await _showTimePicker();
// // // //     if (selectedTime != null) {
// // // //       showDialog(
// // // //         context: context,
// // // //         builder: (BuildContext context) {
// // // //           String eventName = '';
// // // //           return AlertDialog(
// // // //             title: Text('Add Event'),
// // // //             content: Form(
// // // //               key: formKey,
// // // //               child: Column(
// // // //                 mainAxisSize: MainAxisSize.min,
// // // //                 children: [
// // // //                   TextFormField(
// // // //                     decoration: InputDecoration(labelText: 'Event Name'),
// // // //                     onSaved: (value) {
// // // //                       eventName = value ?? '';
// // // //                     },
// // // //                   ),
// // // //                 ],
// // // //               ),
// // // //             ),
// // // //             actions: [
// // // //               ElevatedButton(
// // // //                 onPressed: () {
// // // //                   Navigator.pop(context);
// // // //                 },
// // // //                 child: Text('Cancel'),
// // // //               ),
// // // //               ElevatedButton(
// // // //                 onPressed: () {
// // // //                   // Save the event
// // // //                   formKey.currentState?.save();
// // // //                   if (eventName.isNotEmpty) {
// // // //                     setState(() {
// // // //                       _appointments.add(Appointment(
// // // //                         startTime: DateTime(
// // // //                           selectedDate.year,
// // // //                           selectedDate.month,
// // // //                           selectedDate.day,
// // // //                           selectedTime.hour,
// // // //                           selectedTime.minute,
// // // //                         ),
// // // //                         endTime: DateTime(
// // // //                           selectedDate.year,
// // // //                           selectedDate.month,
// // // //                           selectedDate.day,
// // // //                           selectedTime.hour + 1,
// // // //                           selectedTime.minute,
// // // //                         ),
// // // //                         subject: eventName,
// // // //                         color: Colors.orange,
// // // //                       ));
// // // //                     });
// // // //                     Navigator.pop(context);
// // // //                   }
// // // //                 },
// // // //                 child: Text('Save'),
// // // //               ),
// // // //             ],
// // // //           );
// // // //         },
// // // //       );
// // // //     }
// // // //   }
// // // //
// // // //   void _showEditEventDialog(Appointment appointment) async {
// // // //     final GlobalKey<FormState> formKey = GlobalKey<FormState>();
// // // //     TimeOfDay? selectedTime = await _showTimePicker();
// // // //     if (selectedTime != null) {
// // // //       showDialog(
// // // //         context: context,
// // // //         builder: (BuildContext context) {
// // // //           String eventName = appointment.subject!;
// // // //           return AlertDialog(
// // // //             title: Text('Edit Event'),
// // // //             content: Form(
// // // //               key: formKey,
// // // //               child: Column(
// // // //                 mainAxisSize: MainAxisSize.min,
// // // //                 children: [
// // // //                   TextFormField(
// // // //                     initialValue: eventName,
// // // //                     decoration: InputDecoration(labelText: 'Event Name'),
// // // //                     onSaved: (value) {
// // // //                       eventName = value ?? '';
// // // //                     },
// // // //                   ),
// // // //                 ],
// // // //               ),
// // // //             ),
// // // //             actions: [
// // // //               ElevatedButton(
// // // //                 onPressed: () {
// // // //                   Navigator.pop(context);
// // // //                 },
// // // //                 child: Text('Cancel'),
// // // //               ),
// // // //               ElevatedButton(
// // // //                 onPressed: () {
// // // //                   // Save the edited event
// // // //                   formKey.currentState?.save();
// // // //                   if (eventName.isNotEmpty) {
// // // //                     setState(() {
// // // //                       appointment.startTime = DateTime(
// // // //                         appointment.startTime!.year,
// // // //                         appointment.startTime!.month,
// // // //                         appointment.startTime!.day,
// // // //                         selectedTime.hour,
// // // //                         selectedTime.minute,
// // // //                       );
// // // //                       appointment.endTime = DateTime(
// // // //                         appointment.startTime!.year,
// // // //                         appointment.startTime!.month,
// // // //                         appointment.startTime!.day,
// // // //                         selectedTime.hour + 1,
// // // //                         selectedTime.minute,
// // // //                       );
// // // //                       appointment.subject = eventName;
// // // //                     });
// // // //                     Navigator.pop(context);
// // // //                   }
// // // //                 },
// // // //                 child: Text('Save'),
// // // //               ),
// // // //               ElevatedButton(
// // // //                 onPressed: () {
// // // //                   // Delete the event
// // // //                   setState(() {
// // // //                     _appointments.remove(appointment);
// // // //                   });
// // // //                   Navigator.pop(context);
// // // //                 },
// // // //                 style: ElevatedButton.styleFrom(primary: Colors.red),
// // // //                 child: Text('Delete'),
// // // //               ),
// // // //             ],
// // // //           );
// // // //         },
// // // //       );
// // // //     }
// // // //   }
// // // //
// // // //   Future<TimeOfDay?> _showTimePicker() async {
// // // //     return await showTimePicker(
// // // //       context: context,
// // // //       initialTime: TimeOfDay.now(),
// // // //     );
// // // //   }
// // // // }
// // // //
// // // // class AppointmentDataSource extends CalendarDataSource {
// // // //   AppointmentDataSource(List<Appointment> source) {
// // // //     appointments = source;
// // // //   }
// // // //
// // // // }
// // // import 'package:flutter/material.dart';
// // // import 'package:syncfusion_flutter_calendar/calendar.dart';
// // //
// // // class MyCalendarPage extends StatefulWidget {
// // //   @override
// // //   _MyCalendarPageState createState() => _MyCalendarPageState();
// // // }
// // //
// // // class _MyCalendarPageState extends State<MyCalendarPage> {
// // //   late CalendarController _calendarController;
// // //   late List<Appointment> _appointments;
// // //
// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _calendarController = CalendarController();
// // //     _appointments = _getCalendarDataSource();
// // //   }
// // //
// // //   List<Appointment> _getCalendarDataSource() {
// // //     return <Appointment>[
// // //       Appointment(
// // //         startTime: DateTime.now().add(Duration(hours: 2)),
// // //         endTime: DateTime.now().add(Duration(hours: 3)),
// // //         subject: 'Meeting with Client',
// // //         color: Colors.blue,
// // //       ),
// // //       Appointment(
// // //         startTime: DateTime.now().add(Duration(days: 1)),
// // //         endTime: DateTime.now().add(Duration(days: 1, hours: 1)),
// // //         subject: 'Team Lunch',
// // //         color: Colors.green,
// // //       ),
// // //     ];
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('Our Activities'),
// // //       ),
// // //       body: Column(
// // //         children: [
// // //           Container(
// // //             height: 400, // Adjust height as needed
// // //             child: SfCalendar(
// // //               view: CalendarView.month,
// // //               controller: _calendarController,
// // //               dataSource: AppointmentDataSource(_appointments),
// // //               onTap: (CalendarTapDetails details) {
// // //                 _showDetailsDialog(details.date!);
// // //               },
// // //             ),
// // //           ),
// // //           SizedBox(height: 10),
// // //           Expanded(
// // //             child: ListView.builder(
// // //               itemCount: _appointments.length,
// // //               itemBuilder: (context, index) {
// // //                 return ListTile(
// // //                   title: Text(_appointments[index].subject!),
// // //                   subtitle: Text(
// // //                     '${_appointments[index].startTime!.toString()} - ${_appointments[index].endTime!.toString()}',
// // //                   ),
// // //                   onTap: () {
// // //                     _showEditEventDialog(_appointments[index]);
// // //                   },
// // //                 );
// // //               },
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // //
// // //   void _showDetailsDialog(DateTime selectedDate) {
// // //     // Your details dialog implementation here
// // //   }
// // //
// // //   void _showEditEventDialog(Appointment appointment) {
// // //     // Your edit event dialog implementation here
// // //   }
// // //
// // //   Future<TimeOfDay?> _showTimePicker() async {
// // //     return await showTimePicker(
// // //       context: context,
// // //       initialTime: TimeOfDay.now(),
// // //     );
// // //   }
// // // }
// // //
// // // class AppointmentDataSource extends CalendarDataSource {
// // //   AppointmentDataSource(List<Appointment> source) {
// // //     appointments = source;
// // //   }
// // // }
// // //
// // // // void main() {
// // // //   runApp(MaterialApp(
// // // //     home: MyCalendarPage(),
// // // //   ));
// // // // }
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';


import 'Calender_event_wedgets/EventWidget.dart'; // Import your EventWidget file

class MyCalendarPage extends StatefulWidget {
  @override
  _MyCalendarPageState createState() => _MyCalendarPageState();
}

class _MyCalendarPageState extends State<MyCalendarPage> {
  late CalendarController _calendarController;
  late List<Appointment> _appointments;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
    _appointments = _getCalendarDataSource();
  }

  List<Appointment> _getCalendarDataSource() {
    return <Appointment>[
      Appointment(
        startTime: DateTime.now().add(Duration(hours: 2)),
        endTime: DateTime.now().add(Duration(hours: 3)),
        subject: 'Meeting with Client',
        color: Colors.blue,
      ),
      Appointment(
        startTime: DateTime.now().add(Duration(days: 1)),
        endTime: DateTime.now().add(Duration(days: 1, hours: 1)),
        subject: 'Team Lunch',
        color: Colors.green,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('Our Activities'),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35.0),
              topRight: Radius.circular(35.0),
            ),
          ),
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                height: 400,
                child: SfCalendar(
                  view: CalendarView.month,
                  controller: _calendarController,
                  dataSource: AppointmentDataSource(_appointments),
                  onTap: (CalendarTapDetails details) {
                    _showDetailsDialog(details.date!);
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue, // Set background color to blue
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: _appointments
                      .map(
                        (appointment) => EventWidget(
                      eventName: appointment.subject!,
                      imageUrl: 'assets/images/img.png', // Replace with the actual image URL
                      eventDate: appointment.startTime!,
                      eventInfo: 'Event information here...',
                      organizer: 'Organizer Name',
                      startTime: appointment.startTime!,
                      endTime: appointment.endTime!,
                      price: 25.0, // Replace with the actual price
                    ),
                  )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _showDetailsDialog(DateTime selectedDate) {
    TextEditingController eventNameController = TextEditingController();
    TextEditingController topicsController = TextEditingController();
    TextEditingController audienceController = TextEditingController();
    TextEditingController startTimeController = TextEditingController();
    TextEditingController endTimeController = TextEditingController();

    bool isOnline = false;
    String? selectedRoom;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Event'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: eventNameController,
                  decoration: InputDecoration(labelText: 'Event Name'),
                ),
                TextField(
                  controller: topicsController,
                  decoration: InputDecoration(labelText: 'List of Topics'),
                ),
                TextField(
                  controller: audienceController,
                  decoration: InputDecoration(labelText: 'Audience Type'),
                ),
                Row(
                  children: [
                    Text('Online Event'),
                    Switch(
                      value: isOnline,
                      onChanged: (value) {
                        setState(() {
                          isOnline = value;
                          if (!isOnline) {
                            // Reset room selection when switching to offline
                            selectedRoom = null;
                          }
                        });
                      },
                    ),
                  ],
                ),
                if (!isOnline)
                  DropdownButton<String>(
                    value: selectedRoom,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedRoom = newValue;
                      });
                    },
                    items: <String>['Room A', 'Room B', 'Room C']
                        .map<DropdownMenuItem<String>>(
                          (String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ),
                    )
                        .toList(),
                    hint: Text('Select Room'),
                  ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        TimeOfDay? startTime = await _showTimePicker();
                        if (startTime != null) {
                          startTimeController.text =
                          '${startTime.hour}:${startTime.minute}';
                        }
                      },
                      child: Text('Choose Start Time'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () async {
                        TimeOfDay? endTime = await _showTimePicker();
                        if (endTime != null) {
                          endTimeController.text =
                          '${endTime.hour}:${endTime.minute}';
                        }
                      },
                      child: Text('Choose End Time'),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Save the details and add the event
                    String eventName = eventNameController.text;
                    String topics = topicsController.text;
                    String audience = audienceController.text;
                    String startTime = startTimeController.text;
                    String endTime = endTimeController.text;

                    // Create the appointment with the entered details
                    Appointment newAppointment = Appointment(
                      startTime: DateTime(
                        selectedDate.year,
                        selectedDate.month,
                        selectedDate.day,
                        int.parse(startTime.split(':')[0]),
                        int.parse(startTime.split(':')[1]),
                      ),
                      endTime: DateTime(
                        selectedDate.year,
                        selectedDate.month,
                        selectedDate.day,
                        int.parse(endTime.split(':')[0]),
                        int.parse(endTime.split(':')[1]),
                      ),
                      subject: eventName,
                      color: Colors.blue,
                    );

                    // Add the new appointment to the list
                    setState(() {
                      _appointments.add(newAppointment);
                    });

                    Navigator.pop(context); // Close the dialog
                  },
                  child: Text('Save'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showAddEventDialog(DateTime selectedDate) async {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TimeOfDay? selectedTime = await _showTimePicker();
    if (selectedTime != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          String eventName = '';
          return AlertDialog(
            title: Text('Add Event'),
            content: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Event Name'),
                    onSaved: (value) {
                      eventName = value ?? '';
                    },
                  ),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Save the event
                  formKey.currentState?.save();
                  if (eventName.isNotEmpty) {
                    setState(() {
                      _appointments.add(Appointment(
                        startTime: DateTime(
                          selectedDate.year,
                          selectedDate.month,
                          selectedDate.day,
                          selectedTime.hour,
                          selectedTime.minute,
                        ),
                        endTime: DateTime(
                          selectedDate.year,
                          selectedDate.month,
                          selectedDate.day,
                          selectedTime.hour + 1,
                          selectedTime.minute,
                        ),
                        subject: eventName,
                        color: Colors.orange,
                      ));
                    });
                    Navigator.pop(context);
                  }
                },
                child: Text('Save'),
              ),
            ],
          );
        },
      );
    }
  }

  void _showEditEventDialog(Appointment appointment) async {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TimeOfDay? selectedTime = await _showTimePicker();
    if (selectedTime != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          String eventName = appointment.subject!;
          return AlertDialog(
            title: Text('Edit Event'),
            content: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    initialValue: eventName,
                    decoration: InputDecoration(labelText: 'Event Name'),
                    onSaved: (value) {
                      eventName = value ?? '';
                    },
                  ),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Save the edited event
                  formKey.currentState?.save();
                  if (eventName.isNotEmpty) {
                    setState(() {
                      appointment.startTime = DateTime(
                        appointment.startTime!.year,
                        appointment.startTime!.month,
                        appointment.startTime!.day,
                        selectedTime.hour,
                        selectedTime.minute,
                      );
                      appointment.endTime = DateTime(
                        appointment.startTime!.year,
                        appointment.startTime!.month,
                        appointment.startTime!.day,
                        selectedTime.hour + 1,
                        selectedTime.minute,
                      );
                      appointment.subject = eventName;
                    });
                    Navigator.pop(context);
                  }
                },
                child: Text('Save'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Delete the event
                  setState(() {
                    _appointments.remove(appointment);
                  });
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(primary: Colors.red),
                child: Text('Delete'),
              ),
            ],
          );
        },
      );
    }
  }

  Future<TimeOfDay?> _showTimePicker() async {
    return await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
  }
}

class AppointmentDataSource extends CalendarDataSource {
  AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }

}