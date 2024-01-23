// // // // import 'package:flutter/material.dart';
// // // //
// // // // class eventCreate extends StatelessWidget {
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: Text('Event Creation'),
// // // //       ),
// // // //       body: Center(
// // // //         child: ElevatedButton(
// // // //           onPressed: () {
// // // //             _showEventForm(context);
// // // //           },
// // // //           child: Text('Create Event'),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // //
// // // //   void _showEventForm(BuildContext context) {
// // // //     showDialog(
// // // //       context: context,
// // // //       builder: (BuildContext context) {
// // // //         return EventForm();
// // // //       },
// // // //     );
// // // //   }
// // // // }
// // // //
// // // // class EventForm extends StatefulWidget {
// // // //   @override
// // // //   _EventFormState createState() => _EventFormState();
// // // // }
// // // //
// // // // class _EventFormState extends State<EventForm> {
// // // //   TextEditingController _topicController = TextEditingController();
// // // //   TextEditingController _descriptionController = TextEditingController();
// // // //   List<String> _selectedMajors = [];
// // // //   bool _isOnlineEvent = true;
// // // //   List<String> _selectedLocations = [];
// // // //   TimeOfDay _startTime = TimeOfDay.now();
// // // //   TimeOfDay _endTime = TimeOfDay.now();
// // // //   String _chosenTime = '';
// // // //   String _selectedImage = '';
// // // //
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return AlertDialog(
// // // //       title: Text('Create New Event'),
// // // //       content: SingleChildScrollView(
// // // //         child: Column(
// // // //           children: [
// // // //             TextField(
// // // //               controller: _topicController,
// // // //               decoration: InputDecoration(labelText: 'Topic'),
// // // //             ),
// // // //             SizedBox(height: 16),
// // // //             TextField(
// // // //               controller: _descriptionController,
// // // //               maxLines: 3,
// // // //               decoration: InputDecoration(labelText: 'Description'),
// // // //             ),
// // // //             SizedBox(height: 16),
// // // //             DropdownButtonFormField<String>(
// // // //               value: _selectedMajors.isNotEmpty ? _selectedMajors.first : null,
// // // //               items: ['Computer Science', 'Engineering', 'Math', 'Physics']
// // // //                   .map((major) => DropdownMenuItem<String>(
// // // //                 value: major,
// // // //                 child: Text(major),
// // // //               ))
// // // //                   .toList(),
// // // //               onChanged: (value) {
// // // //                 setState(() {
// // // //                   _selectedMajors = [value!];
// // // //                 });
// // // //               },
// // // //               decoration: InputDecoration(labelText: 'Majors'),
// // // //             ),
// // // //             SizedBox(height: 16),
// // // //             Row(
// // // //               children: [
// // // //                 Checkbox(
// // // //                   value: _isOnlineEvent,
// // // //                   onChanged: (value) {
// // // //                     setState(() {
// // // //                       _isOnlineEvent = value!;
// // // //                     });
// // // //                   },
// // // //                 ),
// // // //                 Text('Online Event'),
// // // //               ],
// // // //             ),
// // // //             if (!_isOnlineEvent)
// // // //               DropdownButtonFormField<String>(
// // // //                 value: _selectedLocations.isNotEmpty ? _selectedLocations.first : null,
// // // //                 items: ['Location 1', 'Location 2', 'Location 3']
// // // //                     .map((location) => DropdownMenuItem<String>(
// // // //                   value: location,
// // // //                   child: Text(location),
// // // //                 ))
// // // //                     .toList(),
// // // //                 onChanged: (value) {
// // // //                   setState(() {
// // // //                     _selectedLocations = [value!];
// // // //                   });
// // // //                 },
// // // //                 decoration: InputDecoration(labelText: 'Location'),
// // // //               ),
// // // //             SizedBox(height: 16),
// // // //             Row(
// // // //               children: [
// // // //                 Expanded(
// // // //                   child: TimePickerFormField(
// // // //                     labelText: 'Start Time',
// // // //                     selectedTime: _startTime,
// // // //                     onChanged: (time) {
// // // //                       setState(() {
// // // //                         _startTime = time!;
// // // //                         _updateChosenTime();
// // // //                       });
// // // //                     },
// // // //                   ),
// // // //                 ),
// // // //                 SizedBox(width: 8),
// // // //                 Expanded(
// // // //                   child: TimePickerFormField(
// // // //                     labelText: 'End Time',
// // // //                     selectedTime: _endTime,
// // // //                     onChanged: (time) {
// // // //                       setState(() {
// // // //                         _endTime = time!;
// // // //                         _updateChosenTime();
// // // //                       });
// // // //                     },
// // // //                   ),
// // // //                 ),
// // // //               ],
// // // //             ),
// // // //             SizedBox(height: 16),
// // // //             Row(
// // // //               children: [
// // // //                 ElevatedButton.icon(
// // // //                   onPressed: () {
// // // //                     // Implement image selection logic
// // // //                   },
// // // //                   icon: Icon(Icons.image),
// // // //                   label: Text('Select Image'),
// // // //                 ),
// // // //                 SizedBox(width: 8),
// // // //                 if (_selectedImage.isNotEmpty)
// // // //                   Text('Image Selected: $_selectedImage'),
// // // //               ],
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //       actions: [
// // // //         TextButton(
// // // //           onPressed: () {
// // // //             Navigator.of(context).pop();
// // // //           },
// // // //           child: Text('Cancel'),
// // // //         ),
// // // //         ElevatedButton(
// // // //           onPressed: () {
// // // //             // Implement logic to save the event
// // // //             Navigator.of(context).pop();
// // // //           },
// // // //           child: Text('Save Event'),
// // // //         ),
// // // //       ],
// // // //     );
// // // //   }
// // // //
// // // //   void _updateChosenTime() {
// // // //     setState(() {
// // // //       _chosenTime =
// // // //       '${_startTime.format(context)} - ${_endTime.format(context)}';
// // // //     });
// // // //   }
// // // // }
// // // //
// // // // class TimePickerFormField extends StatelessWidget {
// // // //   final String labelText;
// // // //   final TimeOfDay selectedTime;
// // // //   final ValueChanged<TimeOfDay>? onChanged;
// // // //
// // // //   const TimePickerFormField({
// // // //     required this.labelText,
// // // //     required this.selectedTime,
// // // //     required this.onChanged,
// // // //   });
// // // //
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return InkWell(
// // // //       onTap: () async {
// // // //         TimeOfDay? pickedTime = await showTimePicker(
// // // //           context: context,
// // // //           initialTime: selectedTime,
// // // //         );
// // // //
// // // //         if (pickedTime != null && onChanged != null) {
// // // //           onChanged!(pickedTime);
// // // //         }
// // // //       },
// // // //       child: InputDecorator(
// // // //         decoration: InputDecoration(
// // // //           labelText: labelText,
// // // //           suffixIcon: Icon(Icons.access_time),
// // // //         ),
// // // //         child: Text(selectedTime.format(context)),
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // // import 'package:flutter/material.dart';
// // //
// // // // class EventCreate extends StatelessWidget {
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: Text('Event Creation'),
// // // //       ),
// // // //       body: Center(
// // // //         child: ElevatedButton(
// // // //           onPressed: () {
// // // //             Navigator.push(
// // // //               context,
// // // //               MaterialPageRoute(builder: (context) => EventForm()),
// // // //             );
// // // //           },
// // // //           child: Text('Create Event'),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // //
// // // class EventForm extends StatefulWidget {
// // //   @override
// // //   _EventFormState createState() => _EventFormState();
// // // }
// // //
// // // class _EventFormState extends State<EventForm> {
// // //   TextEditingController _topicController = TextEditingController();
// // //   TextEditingController _descriptionController = TextEditingController();
// // //   List<String> _selectedMajors = [];
// // //   bool _isOnlineEvent = true;
// // //   List<String> _selectedLocations = [];
// // //   TimeOfDay _startTime = TimeOfDay.now();
// // //   TimeOfDay _endTime = TimeOfDay.now();
// // //   String _chosenTime = '';
// // //   String _selectedImage = '';
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('Create New Event'),
// // //       ),
// // //       body: SingleChildScrollView(
// // //         padding: EdgeInsets.all(16),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.stretch,
// // //           children: [
// // //             TextField(
// // //               controller: _topicController,
// // //               decoration: InputDecoration(labelText: 'Topic'),
// // //             ),
// // //             SizedBox(height: 16),
// // //             TextField(
// // //               controller: _descriptionController,
// // //               maxLines: 3,
// // //               decoration: InputDecoration(labelText: 'Description'),
// // //             ),
// // //             SizedBox(height: 16),
// // //             DropdownButtonFormField<String>(
// // //               value: _selectedMajors.isNotEmpty ? _selectedMajors.first : null,
// // //               items: ['Computer Science', 'Engineering', 'Math', 'Physics']
// // //                   .map((major) => DropdownMenuItem<String>(
// // //                 value: major,
// // //                 child: Text(major),
// // //               ))
// // //                   .toList(),
// // //               onChanged: (value) {
// // //                 setState(() {
// // //                   _selectedMajors = [value!];
// // //                 });
// // //               },
// // //               decoration: InputDecoration(labelText: 'Majors'),
// // //             ),
// // //             SizedBox(height: 16),
// // //             Row(
// // //               children: [
// // //                 Checkbox(
// // //                   value: _isOnlineEvent,
// // //                   onChanged: (value) {
// // //                     setState(() {
// // //                       _isOnlineEvent = value!;
// // //                     });
// // //                   },
// // //                 ),
// // //                 Text('Online Event'),
// // //               ],
// // //             ),
// // //             if (!_isOnlineEvent)
// // //               DropdownButtonFormField<String>(
// // //                 value: _selectedLocations.isNotEmpty ? _selectedLocations.first : null,
// // //                 items: ['Location 1', 'Location 2', 'Location 3']
// // //                     .map((location) => DropdownMenuItem<String>(
// // //                   value: location,
// // //                   child: Text(location),
// // //                 ))
// // //                     .toList(),
// // //                 onChanged: (value) {
// // //                   setState(() {
// // //                     _selectedLocations = [value!];
// // //                   });
// // //                 },
// // //                 decoration: InputDecoration(labelText: 'Location'),
// // //               ),
// // //             SizedBox(height: 16),
// // //             Row(
// // //               children: [
// // //                 Expanded(
// // //                   child: TimePickerFormField(
// // //                     labelText: 'Start Time',
// // //                     selectedTime: _startTime,
// // //                     onChanged: (time) {
// // //                       setState(() {
// // //                         _startTime = time!;
// // //                         _updateChosenTime();
// // //                       });
// // //                     },
// // //                   ),
// // //                 ),
// // //                 SizedBox(width: 8),
// // //                 Expanded(
// // //                   child: TimePickerFormField(
// // //                     labelText: 'End Time',
// // //                     selectedTime: _endTime,
// // //                     onChanged: (time) {
// // //                       setState(() {
// // //                         _endTime = time!;
// // //                         _updateChosenTime();
// // //                       });
// // //                     },
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),
// // //             SizedBox(height: 16),
// // //             Row(
// // //               children: [
// // //                 ElevatedButton.icon(
// // //                   onPressed: () {
// // //                     // Implement image selection logic
// // //                   },
// // //                   icon: Icon(Icons.image),
// // //                   label: Text('Select Image'),
// // //                 ),
// // //                 SizedBox(width: 8),
// // //                 if (_selectedImage.isNotEmpty)
// // //                   Text('Image Selected: $_selectedImage'),
// // //               ],
// // //             ),
// // //             SizedBox(height: 16),
// // //             ElevatedButton(
// // //               onPressed: () {
// // //                 // Implement logic to save the event
// // //                 Navigator.of(context).pop();
// // //               },
// // //               child: Text('Save Event'),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // //
// // //   void _updateChosenTime() {
// // //     setState(() {
// // //       _chosenTime =
// // //       '${_startTime.format(context)} - ${_endTime.format(context)}';
// // //     });
// // //   }
// // // }
// // //
// // // class TimePickerFormField extends StatelessWidget {
// // //   final String labelText;
// // //   final TimeOfDay selectedTime;
// // //   final ValueChanged<TimeOfDay>? onChanged;
// // //
// // //   const TimePickerFormField({
// // //     required this.labelText,
// // //     required this.selectedTime,
// // //     required this.onChanged,
// // //   });
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return InkWell(
// // //       onTap: () async {
// // //         TimeOfDay? pickedTime = await showTimePicker(
// // //           context: context,
// // //           initialTime: selectedTime,
// // //         );
// // //
// // //         if (pickedTime != null && onChanged != null) {
// // //           onChanged!(pickedTime);
// // //         }
// // //       },
// // //       child: InputDecorator(
// // //         decoration: InputDecoration(
// // //           labelText: labelText,
// // //           suffixIcon: Icon(Icons.access_time),
// // //         ),
// // //         child: Text(selectedTime.format(context)),
// // //       ),
// // //     );
// // //   }
// // // }
// // import 'package:flutter/material.dart';
// //
// // class EventForm extends StatefulWidget {
// //   @override
// //   _EventFormState createState() => _EventFormState();
// // }
// //
// // class _EventFormState extends State<EventForm> {
// //   TextEditingController _topicController = TextEditingController();
// //   TextEditingController _descriptionController = TextEditingController();
// //   List<String> _selectedMajors = [];
// //   bool _isOnlineEvent = true;
// //   List<String> _selectedLocations = [];
// //   TimeOfDay _startTime = TimeOfDay.now();
// //   TimeOfDay _endTime = TimeOfDay.now();
// //   String _chosenTime = '';
// //   String _selectedImage = '';
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Create New Event'),
// //       ),
// //       body: SingleChildScrollView(
// //         padding: EdgeInsets.all(16),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.stretch,
// //           children: [
// //             TextField(
// //               controller: _topicController,
// //               decoration: InputDecoration(
// //                 labelText: 'Topic',
// //                 border: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(10.0),
// //                 ),
// //               ),
// //             ),
// //             SizedBox(height: 16),
// //             TextField(
// //               controller: _descriptionController,
// //               maxLines: 3,
// //               decoration: InputDecoration(
// //                 labelText: 'Description',
// //                 border: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(10.0),
// //                 ),
// //               ),
// //             ),
// //             SizedBox(height: 16),
// //             DropdownButtonFormField<String>(
// //               value: _selectedMajors.isNotEmpty ? _selectedMajors.first : null,
// //               items: ['Computer Science', 'Engineering', 'Math', 'Physics']
// //                   .map((major) => DropdownMenuItem<String>(
// //                 value: major,
// //                 child: Text(major),
// //               ))
// //                   .toList(),
// //               onChanged: (value) {
// //                 setState(() {
// //                   _selectedMajors = [value!];
// //                 });
// //               },
// //               decoration: InputDecoration(
// //                 labelText: 'Majors',
// //                 border: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(10.0),
// //                 ),
// //               ),
// //             ),
// //             SizedBox(height: 16),
// //             Row(
// //               children: [
// //                 Checkbox(
// //                   value: _isOnlineEvent,
// //                   onChanged: (value) {
// //                     setState(() {
// //                       _isOnlineEvent = value!;
// //                     });
// //                   },
// //                 ),
// //                 Text('Online Event'),
// //               ],
// //             ),
// //             if (!_isOnlineEvent)
// //               DropdownButtonFormField<String>(
// //                 value: _selectedLocations.isNotEmpty ? _selectedLocations.first : null,
// //                 items: ['Location 1', 'Location 2', 'Location 3']
// //                     .map((location) => DropdownMenuItem<String>(
// //                   value: location,
// //                   child: Text(location),
// //                 ))
// //                     .toList(),
// //                 onChanged: (value) {
// //                   setState(() {
// //                     _selectedLocations = [value!];
// //                   });
// //                 },
// //                 decoration: InputDecoration(
// //                   labelText: 'Location',
// //                   border: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(10.0),
// //                   ),
// //                 ),
// //               ),
// //             SizedBox(height: 16),
// //             Row(
// //               children: [
// //                 Expanded(
// //                   child: TimePickerFormField(
// //                     labelText: 'Start Time',
// //                     selectedTime: _startTime,
// //                     onChanged: (time) {
// //                       setState(() {
// //                         _startTime = time!;
// //                         _updateChosenTime();
// //                       });
// //                     },
// //                   ),
// //                 ),
// //                 SizedBox(width: 8),
// //                 Expanded(
// //                   child: TimePickerFormField(
// //                     labelText: 'End Time',
// //                     selectedTime: _endTime,
// //                     onChanged: (time) {
// //                       setState(() {
// //                         _endTime = time!;
// //                         _updateChosenTime();
// //                       });
// //                     },
// //                   ),
// //                 ),
// //               ],
// //             ),
// //             SizedBox(height: 16),
// //             Row(
// //               children: [
// //                 ElevatedButton.icon(
// //                   onPressed: () {
// //                     // Implement image selection logic
// //                   },
// //                   icon: Icon(Icons.image),
// //                   label: Text('Select Image'),
// //                   style: ElevatedButton.styleFrom(
// //                     primary: Colors.grey[300],
// //                     onPrimary: Colors.black,
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(10.0),
// //                     ),
// //                   ),
// //                 ),
// //                 SizedBox(width: 8),
// //                 if (_selectedImage.isNotEmpty)
// //                   Text('Image Selected: $_selectedImage'),
// //               ],
// //             ),
// //             SizedBox(height: 16),
// //             ElevatedButton(
// //               onPressed: () {
// //                 // Implement logic to save the event
// //                 Navigator.of(context).pop();
// //               },
// //               child: Text('Save Event'),
// //               style: ElevatedButton.styleFrom(
// //                 primary: Colors.blue,
// //                 onPrimary: Colors.white,
// //                 shape: RoundedRectangleBorder(
// //                   borderRadius: BorderRadius.circular(10.0),
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   void _updateChosenTime() {
// //     setState(() {
// //       _chosenTime =
// //       '${_startTime.format(context)} - ${_endTime.format(context)}';
// //     });
// //   }
// // }
// //
// // class TimePickerFormField extends StatelessWidget {
// //   final String labelText;
// //   final TimeOfDay selectedTime;
// //   final ValueChanged<TimeOfDay>? onChanged;
// //
// //   const TimePickerFormField({
// //     required this.labelText,
// //     required this.selectedTime,
// //     required this.onChanged,
// //   });
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return InkWell(
// //       onTap: () async {
// //         TimeOfDay? pickedTime = await showTimePicker(
// //           context: context,
// //           initialTime: selectedTime,
// //         );
// //
// //         if (pickedTime != null && onChanged != null) {
// //           onChanged!(pickedTime);
// //         }
// //       },
// //       child: InputDecorator(
// //         decoration: InputDecoration(
// //           labelText: labelText,
// //           suffixIcon: Icon(Icons.access_time),
// //           border: OutlineInputBorder(
// //             borderRadius: BorderRadius.circular(10.0),
// //           ),
// //         ),
// //         child: Text(selectedTime.format(context)),
// //       ),
// //     );
// //   }
// // }
// import 'dart:html';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// import '../../services/society_auth_service.dart';
//
// class EventForm extends StatefulWidget {
//   final DateTime selectedDate;
//
//   EventForm({required this.selectedDate});
//
//   @override
//   _EventFormState createState() => _EventFormState();
// }
//
// class _EventFormState extends State<EventForm> {
//   final SocietyAuthService societyAuthService = SocietyAuthService();
//
//   TextEditingController _topicController = TextEditingController();
//   TextEditingController _descriptionController = TextEditingController();
//   List<String> _selectedMajors = [];
//   bool _isOnlineEvent = true;
//   List<String> _selectedLocations = [];
//   TimeOfDay _startTime = TimeOfDay.now();
//   TimeOfDay _endTime = TimeOfDay.now();
//   String _chosenTime = '';
//   String? _selectedImagePath; // Updated to be nullable
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Create New Event'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               controller: _topicController,
//               decoration: InputDecoration(
//                 labelText: 'Topic',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//               ),
//             ),
//             SizedBox(height: 16),
//             TextField(
//               controller: _descriptionController,
//               maxLines: 3,
//               decoration: InputDecoration(
//                 labelText: 'Description',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//               ),
//             ),
//             SizedBox(height: 16),
//             DropdownButtonFormField<String>(
//               value: _selectedMajors.isNotEmpty ? _selectedMajors.first : null,
//               items: ['Computer Science', 'Engineering', 'Math', 'Physics']
//                   .map((major) => DropdownMenuItem<String>(
//                 value: major,
//                 child: Text(major),
//               ))
//                   .toList(),
//               onChanged: (value) {
//                 setState(() {
//                   _selectedMajors = [value!];
//                 });
//               },
//               decoration: InputDecoration(
//                 labelText: 'Majors',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//               ),
//             ),
//             SizedBox(height: 16),
//             Row(
//               children: [
//                 Checkbox(
//                   value: _isOnlineEvent,
//                   onChanged: (value) {
//                     setState(() {
//                       _isOnlineEvent = value!;
//                     });
//                   },
//                 ),
//                 Text('Online Event'),
//               ],
//             ),
//             if (!_isOnlineEvent)
//               DropdownButtonFormField<String>(
//                 value: _selectedLocations.isNotEmpty ? _selectedLocations.first : null,
//                 items: ['Location 1', 'Location 2', 'Location 3']
//                     .map((location) => DropdownMenuItem<String>(
//                   value: location,
//                   child: Text(location),
//                 ))
//                     .toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     _selectedLocations = [value!];
//                   });
//                 },
//                 decoration: InputDecoration(
//                   labelText: 'Location',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                 ),
//               ),
//             SizedBox(height: 16),
//             Row(
//               children: [
//                 ElevatedButton.icon(
//                   onPressed: () {
//                     _selectImage();
//                   },
//                   icon: Icon(Icons.image),
//                   label: Text('Select Image'),
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.grey[300],
//                     onPrimary: Colors.black,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 8),
//                 if (_selectedImagePath != null)
//                   Container(
//                     width: 50,
//                     height: 50,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10.0),
//                       image: DecorationImage(
//                         image: AssetImage(_selectedImagePath!),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Row(
//               children: [
//                 Expanded(
//                   child: TimePickerFormField(
//                     labelText: 'Start Time',
//                     selectedTime: _startTime,
//                     onChanged: (time) {
//                       setState(() {
//                         _startTime = time!;
//                         _updateChosenTime();
//                       });
//                     },
//                   ),
//                 ),
//                 SizedBox(width: 8),
//                 Expanded(
//                   child: TimePickerFormField(
//                     labelText: 'End Time',
//                     selectedTime: _endTime,
//                     onChanged: (time) {
//                       setState(() {
//                         _endTime = time!;
//                         _updateChosenTime();
//                       });
//                     },
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 // Implement logic to save the event
//                 Navigator.of(context).pop();
//               },
//
//
//               child: Text('Save Event'),
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.blue,
//                 onPrimary: Colors.white,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _updateChosenTime() {
//     setState(() {
//       _chosenTime =
//       '${_startTime.format(context)} - ${_endTime.format(context)}';
//     });
//   }
//
//   File? _selectedImageFile;
//
//   Future<void> _selectImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//
//     if (pickedFile != null) {
//       setState(() {
//         _selectedImageFile = File(pickedFile.path as List<Object>);
//       });
//     }
//   }
//
// }
//
// class TimePickerFormField extends StatelessWidget {
//   final String labelText;
//   final TimeOfDay selectedTime;
//   final ValueChanged<TimeOfDay>? onChanged;
//
//   const TimePickerFormField({
//     required this.labelText,
//     required this.selectedTime,
//     required this.onChanged,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () async {
//         TimeOfDay? pickedTime = await showTimePicker(
//           context: context,
//           initialTime: selectedTime,
//         );
//
//         if (pickedTime != null && onChanged != null) {
//           onChanged!(pickedTime);
//         }
//       },
//       child: InputDecorator(
//         decoration: InputDecoration(
//           labelText: labelText,
//           suffixIcon: Icon(Icons.access_time),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//         ),
//         child: Text(selectedTime.format(context)),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../services/society_auth_service.dart';
 // Replace with your actual import path

class EventForm extends StatefulWidget {
  final DateTime selectedDate;

  EventForm({required this.selectedDate});

  @override
  _EventFormState createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  TextEditingController _topicController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  List<String> _selectedMajors = [];
  bool _isOnlineEvent = true;
  List<String> _selectedLocations = [];
  TimeOfDay _startTime = TimeOfDay.now();
  TimeOfDay _endTime = TimeOfDay.now();
  String _chosenTime = '';
  String? _selectedImagePath; // Updated to be nullable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Event'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _topicController,
              decoration: InputDecoration(
                labelText: 'Topic',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedMajors.isNotEmpty ? _selectedMajors.first : null,
              items: ['Computer Science', 'Engineering', 'Math', 'Physics']
                  .map((major) => DropdownMenuItem<String>(
                value: major,
                child: Text(major),
              ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedMajors = [value!];
                });
              },
              decoration: InputDecoration(
                labelText: 'Majors',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  value: _isOnlineEvent,
                  onChanged: (value) {
                    setState(() {
                      _isOnlineEvent = value!;
                    });
                  },
                ),
                Text('Online Event'),
              ],
            ),
            if (!_isOnlineEvent)
              DropdownButtonFormField<String>(
                value: _selectedLocations.isNotEmpty ? _selectedLocations.first : null,
                items: ['Location 1', 'Location 2', 'Location 3']
                    .map((location) => DropdownMenuItem<String>(
                  value: location,
                  child: Text(location),
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedLocations = [value!];
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Location',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    _selectImage();
                  },
                  icon: Icon(Icons.image),
                  label: Text('Select Image'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[300],
                    onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                if (_selectedImagePath != null)
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: AssetImage(_selectedImagePath!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TimePickerFormField(
                    labelText: 'Start Time',
                    selectedTime: _startTime,
                    onChanged: (time) {
                      setState(() {
                        _startTime = time!;
                        _updateChosenTime();
                      });
                    },
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TimePickerFormField(
                    labelText: 'End Time',
                    selectedTime: _endTime,
                    onChanged: (time) {
                      setState(() {
                        _endTime = time!;
                        _updateChosenTime();
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                await _createEvent();
              },
              child: Text('Save Event'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _updateChosenTime() {
    setState(() {
      _chosenTime = '${_startTime.format(context)} - ${_endTime.format(context)}';
    });
  }

  Future<void> _selectImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImagePath = pickedFile.path;
      });
    }
  }

  Future<void> _createEvent() async {
    // Ensure required fields are not empty
    if (_topicController.text.isEmpty ||
        _descriptionController.text.isEmpty ||
        _selectedMajors.isEmpty) {
      // Show an error message or handle accordingly
      return;
    }

    // Prepare the data for creating an event
    String name = _topicController.text;
    List<String> topics = _selectedMajors;
    List<String> majors = _selectedMajors;
    String location = _isOnlineEvent ? 'Online' : _selectedLocations.first;
    bool isOnline = _isOnlineEvent;
    DateTime dateTime = DateTime(widget.selectedDate.year, widget.selectedDate.month, widget.selectedDate.day, _startTime.hour, _startTime.minute);
    double price = 0.0; // You may adjust this based on your requirements
    List<String> audience = []; // You may adjust this based on your requirements
    String description = _descriptionController.text;
    File imageFile = _selectedImagePath != null ? File(_selectedImagePath!) : File(''); // You may adjust this based on your requirements

    // Use the SocietyAuthService to create the event
    SocietyAuthService societyAuthService = SocietyAuthService();
    Map<String, dynamic> result = await societyAuthService.createEvent(
      societyId: 'replace_with_society_id', // Retrieve societyId from SharedPreferences
      name: name,
      topics: topics,
      majors: majors,
      location: location,
      isOnline: isOnline,
      dateTime: dateTime,
      price: price,
      audience: audience,
      description: description,
      imageFile: imageFile,
    );

    // Handle the result accordingly
    if (result['success']) {
      // Event created successfully
      Navigator.of(context).pop();
    } else {
      // Show an error message or handle accordingly
      print(result['message']);
    }
  }
}

class TimePickerFormField extends StatelessWidget {
  final String labelText;
  final TimeOfDay selectedTime;
  final ValueChanged<TimeOfDay>? onChanged;

  TimePickerFormField({
    required this.labelText,
    required this.selectedTime,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText),
        SizedBox(height: 8),
        ElevatedButton(
          onPressed: () async {
            TimeOfDay? pickedTime = await showTimePicker(
              context: context,
              initialTime: selectedTime,
            );

            if (pickedTime != null && onChanged != null) {
              onChanged!(pickedTime);
            }
          },
          child: Text(selectedTime.format(context)),
        ),
      ],
    );
  }
}
