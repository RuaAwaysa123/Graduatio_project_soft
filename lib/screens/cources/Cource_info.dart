// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
// import 'package:multi_select_flutter/util/multi_select_item.dart';
// import 'package:intl/intl.dart';
//
// import '../../model/society.dart';
// import '../../services/society_auth_service.dart';
// import 'All_Coueces_page.dart';
//
// class AddCourse extends StatelessWidget {
//   const AddCourse({Key? key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('Add New Course')),
//         body: const Center(
//           child: AddNewCourse(),
//         ),
//       ),
//     );
//   }
// }
//
// class AddNewCourse extends StatefulWidget {
//   const AddNewCourse({Key? key});
//
//   @override
//   State<AddNewCourse> createState() => _AddNewCourseState();
// }
//
// class _AddNewCourseState extends State<AddNewCourse> {
//   int _index = 0;
//   final List<String> topics = ['Topic 1', 'Topic 2', 'Topic 3', 'Topic 4'];
//   final List<String> prerequisites = ['Prerequisite 1', 'Prerequisite 2'];
//   final List<String> targetAudience = ['Beginner', 'Intermediate', 'Advanced'];
//
//   // Store selected values for each list
//   List<String> selectedTopics = [];
//   List<String> selectedPrerequisites = [];
//   List<String> selectedTargetAudience = [];
//
//   // Additional variables for Step 2
//   DateTime? startDate;
//   DateTime? endDate;
//   String durationText = '';
//   TextEditingController priceController = TextEditingController();
//   bool isOnline = false;
//   XFile? selectedImage; // Image selected from the gallery
//   String location = '';
//   late SocietyAuthService _societyAuthService =SocietyAuthService() ;
//   late Society _society = Society(
//     id: '',
//     name: '',
//     email: '',
//     password: '', // Add other fields with appropriate default values
//     members: [],
//     followers: [],
//     events: [],
//     location: '',
//     mission: '',
//     vision: '',
//     courses: [],
//     recommendedTopics: [],
//     joinRequestsOpenDate: DateTime.now(),
//     membershipRequestsOpenDate: DateTime.now(),
//     rate: 0.0,
//     imgUrl: '',
//   );
//
//
//   @override
//   void initState() {
//     super.initState();
//     _societyAuthService = SocietyAuthService();
//     _loadSocietyDetails();
//   }
//
//   Future<void> _loadSocietyDetails() async {
//     try {
//       // Get society ID from shared preferences
//       final societyId = await _societyAuthService.getSocietyId();
//
//       // Print society ID for debugging
//       print('Society ID: $societyId');
//
//       // Check if society ID is available
//       if (societyId != null && societyId.isNotEmpty) {
//         // Retrieve society details using the society ID
//         final result = await _societyAuthService.getSocietyDetails(societyId);
//         print('the result is, ${result}!');
//         print('---------------------------------------------------------------');
//         print('the result of society details is , ${result['societyDetails']}!');
//
//
//         if (result['success']) {
//           // Update the state with the retrieved society details
//           print('---------------------------------------------------------------');
//           print("inside success ");
//
//           setState(() {
//             _society = Society.fromMap(result['societyDetails']);
//             print('Good Morning, ${_society}!');
//           });
//
//           // Print society name for debugging
//           print('Good Morning, ${_society.name}!');
//         } else {
//           // Print error message for debugging
//           print('Error: ${result['message']}');
//         }
//       } else {
//         // Print message if society ID is not available
//         print('Society ID is not available');
//       }
//     } catch (e) {
//       // Print error for debugging
//       print('Error: $e');
//     }
//   }
//
//   // Decoration for boxes
//   final BoxDecoration boxDecoration = BoxDecoration(
//     border: Border.all(color: Colors.black12),
//     borderRadius: BorderRadius.all(Radius.circular(30.0)),
//   );
//
//   // Use the same textInputDecoration as in RegisterPage
//   final InputDecoration textInputDecoration = InputDecoration(
//     border: OutlineInputBorder(
//       borderSide: BorderSide(color: Colors.blue),
//       borderRadius: BorderRadius.all(Radius.circular(30.0)),
//     ),
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     return Stepper(
//       currentStep: _index,
//       type: StepperType.horizontal,
//       onStepCancel: () {
//         if (_index > 0) {
//           setState(() {
//             _index -= 1;
//           });
//         }
//       },
//       onStepContinue: () {
//         if (_index < 2) {
//           setState(() {
//             _index += 1;
//           });
//         }
//       },
//       onStepTapped: (int index) {
//         setState(() {
//           _index = index;
//         });
//       },
//       steps: <Step>[
//         Step(
//           title: const Text('Main Info'),
//           content: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextFormField(
//                 decoration: textInputDecoration.copyWith(
//                   labelText: 'Course Name',
//                 ),
//               ),
//               SizedBox(height: 10),
//               // Multi-select list for topics
//               MultiSelectDialogField(
//                 items: topics.map((topic) => MultiSelectItem(topic, topic)).toList(),
//                 title: Text('Select Topics'),
//                 selectedColor: Colors.blue,
//                 decoration: boxDecoration,
//                 onConfirm: (values) {
//                   setState(() {
//                     selectedTopics = values;
//                   });
//                 },
//               ),
//               SizedBox(height: 20),
//               // Multi-select list for prerequisites
//               MultiSelectDialogField(
//                 items: prerequisites.map((prerequisite) => MultiSelectItem(prerequisite, prerequisite)).toList(),
//                 title: Text('Select Prerequisites'),
//                 selectedColor: Colors.blue,
//                 decoration: boxDecoration,
//                 onConfirm: (values) {
//                   setState(() {
//                     selectedPrerequisites = values;
//                   });
//                 },
//               ),
//               SizedBox(height: 20),
//               // Multi-select list for target audience
//               MultiSelectDialogField(
//                 items: targetAudience.map((audience) => MultiSelectItem(audience, audience)).toList(),
//                 title: Text('Select Target Audience'),
//                 selectedColor: Colors.blue,
//                 decoration: boxDecoration,
//                 onConfirm: (values) {
//                   setState(() {
//                     selectedTargetAudience = values;
//                   });
//                 },
//               ),
//             ],
//           ),
//         ),
//         Step(
//           title: const Text('Step2'),
//           content: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 20),
//               Text('Start Date'),
//               SizedBox(height: 5),
//               InkWell(
//                 onTap: () async {
//                   final selectedDate = await showDatePicker(
//                     context: context,
//                     initialDate: startDate ?? DateTime.now(),
//                     firstDate: DateTime.now(),
//                     lastDate: DateTime(2101),
//                   );
//                   if (selectedDate != null && selectedDate != startDate) {
//                     setState(() {
//                       startDate = selectedDate;
//                       updateDurationText();
//                     });
//                   }
//                 },
//                 child: Container(
//                   padding: EdgeInsets.all(10),
//                   decoration: boxDecoration,
//                   child: Text(startDate != null
//                       ? '${DateFormat.yMd().format(startDate!)}'
//                       : 'Select Start Date'),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Text('End Date'),
//               SizedBox(height: 5),
//               InkWell(
//                 onTap: () async {
//                   final selectedDate = await showDatePicker(
//                     context: context,
//                     initialDate: endDate ?? DateTime.now(),
//                     firstDate: DateTime.now(),
//                     lastDate: DateTime(2101),
//                   );
//                   if (selectedDate != null && selectedDate != endDate) {
//                     setState(() {
//                       endDate = selectedDate;
//                       updateDurationText();
//                     });
//                   }
//                 },
//                 child: Container(
//                   padding: EdgeInsets.all(10),
//                   decoration: boxDecoration,
//                   child: Text(endDate != null
//                       ? '${DateFormat.yMd().format(endDate!)}'
//                       : 'Select End Date'),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Text('Duration'),
//               SizedBox(height: 5),
//               Container(
//                 padding: EdgeInsets.all(10),
//                 decoration: boxDecoration,
//                 child: Text(durationText),
//               ),
//               SizedBox(height: 20),
//               Text('Price'),
//               SizedBox(height: 5),
//               TextFormField(
//                 controller: priceController,
//                 keyboardType: TextInputType.number,
//                 decoration: textInputDecoration.copyWith(
//                   labelText: 'Enter Price',
//                 ),
//               ),
//               SizedBox(height: 20),
//               Row(
//                 children: [
//                   Text('Course Type'),
//                   SizedBox(width: 10),
//                   GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         isOnline = true;
//                       });
//                     },
//                     child: Container(
//                       padding: EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                         border: Border.all(color: isOnline ? Colors.blue : Colors.black12),
//                         borderRadius: BorderRadius.all(Radius.circular(30.0)),
//                       ),
//                       child: Text('Online'),
//                     ),
//                   ),
//                   SizedBox(width: 10),
//                   GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         isOnline = false;
//                         location = ''; // Reset location if switching to in-person
//                       });
//                       if (!isOnline) {
//                         // Show a dialog to select location for in-person courses
//                         _showLocationDialog();
//                       }
//                     },
//                     child: Container(
//                       padding: EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                         border: Border.all(color: isOnline ? Colors.black12 : Colors.blue),
//                         borderRadius: BorderRadius.all(Radius.circular(30.0)),
//                       ),
//                       child: Text('In Person'),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         // Step(
//         //   title: const Text('Finish'),
//         //   content: const Text('Finish'),
//         // ),
//         Step(
//           title: const Text('Finish'),
//           content: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text('Review and confirm your course details.'),
//               const SizedBox(height: 20),
//
//             ],
//           ),
//         ),
//
//       ],
//     );
//   }
//
//   // Helper method to update the duration text
//   void updateDurationText() {
//     if (startDate != null && endDate != null) {
//       final duration = endDate!.difference(startDate!);
//       final days = duration.inDays;
//       durationText = '$days days';
//     } else {
//       durationText = '';
//     }
//   }
//
//   // Helper method to show the location dialog for in-person courses
//   Future<void> _showLocationDialog() async {
//     // Implement your logic to show a dialog for selecting the location for in-person courses
//     // Use a map library or Google Maps API to integrate location selection
//
//     // For example, you can use a dialog with a Google Map widget to allow users to choose the location.
//     // You may need to include additional dependencies and set up API keys for Google Maps integration.
//     // This is a basic placeholder, and you may need to implement the Google Maps part based on your requirements.
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Select Location'),
//           content: Container(
//             height: 200, // Adjust the height as needed
//             child: Center(
//               child: Text('Google Maps Widget or Map Library Goes Here'),
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 // Implement logic to save the selected location
//                 // For example, you can use the Google Maps API to get the selected coordinates.
//                 Navigator.of(context).pop();
//               },
//               child: Text('Save'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
import 'dart:io'; // Import the dart:io library for File class
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:intl/intl.dart';

import '../../model/society.dart';
import '../../services/society_auth_service.dart';
import 'All_Coueces_page.dart';

class AddCourse extends StatelessWidget {
  const AddCourse({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Add New Course')),
        body: const Center(
          child: AddNewCourse(),
        ),
      ),
    );
  }
}

class AddNewCourse extends StatefulWidget {
  const AddNewCourse({Key? key});

  @override
  State<AddNewCourse> createState() => _AddNewCourseState();
}

class _AddNewCourseState extends State<AddNewCourse> {
  String name = '';
  int _index = 0;
  final List<String> topics = ['Topic 1', 'Topic 2', 'Topic 3', 'Topic 4'];
  final List<String> prerequisites = ['Prerequisite 1', 'Prerequisite 2'];
  final List<String> targetAudience = ['Beginner', 'Intermediate', 'Advanced'];

  // Store selected values for each list
  List<String> selectedTopics = [];
  List<String> selectedPrerequisites = [];
  List<String> selectedTargetAudience = [];

  // Additional variables for Step 2
  DateTime? startDate;
  DateTime? endDate;
  String durationText = '';
  TextEditingController priceController = TextEditingController();
  TextEditingController courseNameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  bool isOnline = false;
  XFile? selectedImage; // Image selected from the gallery
  String location = '';
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  final List<String> daysOfWeek = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
  List<String> selectedDays = [];
  final TextEditingController locationController = TextEditingController();
  final TextEditingController uriController = TextEditingController();

  late SocietyAuthService _societyAuthService = SocietyAuthService();
  late Society _society = Society(
    id: '',
    name: '',
    email: '',
    password: '', // Add other fields with appropriate default values
    members: [],
    followers: [],
    events: [],
    location: '',
    mission: '',
    vision: '',
    courses: [],
    recommendedTopics: [],
    joinRequestsOpenDate: DateTime.now(),
    membershipRequestsOpenDate: DateTime.now(),
    rate: 0.0,
    imgUrl: '',
  );

  @override
  void initState() {
    super.initState();
    _societyAuthService = SocietyAuthService();
    _loadSocietyDetails();
  }

  Future<void> _loadSocietyDetails() async {
    try {
      // Get society ID from shared preferences
      final societyId = await _societyAuthService.getSocietyId();

      // Print society ID for debugging
      print('Society ID: $societyId');

      // Check if society ID is available
      if (societyId != null && societyId.isNotEmpty) {
        // Retrieve society details using the society ID
        final result = await _societyAuthService.getSocietyDetails(societyId);
        print('the result is, ${result}!');
        print('---------------------------------------------------------------');
        print('the result of society details is , ${result['societyDetails']}!');

        if (result['success']) {
          // Update the state with the retrieved society details
          print('---------------------------------------------------------------');
          print("inside success ");

          setState(() {
            _society = Society.fromMap(result['societyDetails']);
            print('Good Morning, ${_society}!');
          });

          // Print society name for debugging
          print('Good Morning, ${_society.name}!');
        } else {
          // Print error message for debugging
          print('Error: ${result['message']}');
        }
      } else {
        // Print message if society ID is not available
        print('Society ID is not available');
      }
    } catch (e) {
      // Print error for debugging
      print('Error: $e');
    }
  }
  // Decoration for boxes
  // Helper method to call createCourse function
  Future<void> submitCourse() async {
    print('society id is , ${_society.id}!');
    print('society name is , ${courseNameController.text}!');
    print('society selected topics is , ${selectedTopics}!');
    print('society selectedPrerequisites , ${selectedPrerequisites}!');
    print('society selectedTargetAudience , ${selectedTargetAudience}!');
    print('society selectedPrerequisites , ${isOnline}!');
    print('society startDate , ${startDate}!');
    // print('society start time , ${startTime!.format(context)}');
    // print('society end time , ${endTime!.format(context)}');
    print('society price , ${double.parse(priceController.text)}!');
    print('society image , ${File(selectedImage!.path)}!');
    print('society Days , ${selectedDays}!');
    // selectedDays
    try {
      if (startDate == null) {
        print('StartDate or time is null');
        return;
      }
      else if(endDate == null){
        print('endDate or time is null');
        return;
      }


      if (priceController.text.isEmpty || selectedImage == null) {
        print('Price or image is null');
        return;
      }

      final response = await _societyAuthService.createCourse(
        societyId: _society.id,
        name: courseNameController.text,
        topics: selectedTopics,
        prequests: selectedPrerequisites,
        majors: selectedTargetAudience,
        location: locationController.text,
        isOnline: isOnline,
        startDate: startDate!,
        endDate: endDate!,
        time: '${startTime!.format(context)} - ${endTime!.format(context)}',
        credential: '10',
        price: int.parse(priceController.text),
        trainer: 'Trainer Name', // You may replace this with the actual trainer information
        imageFile: File(selectedImage!.path),
        days: selectedDays,
        startTime: '${startTime!.format(context)}',
        endTime: '${endTime!.format(context)}',
        maxnumofstudent: 30, // You may adjust this value based on your requirements
      );

      print('response is : ${response}');
      if (response['success']) {
        // Course created successfully
        // You may navigate to a success screen or perform any other action
        print(response['message']);
      } else {

        // Error creating course
        // You may show an error message to the user
        print(response['message']);
      }
    } catch (e) {
      // Handle exceptions
      print('Error submitting course: $e');
    }
  }
  final BoxDecoration boxDecoration = BoxDecoration(
    border: Border.all(color: Colors.black12),
    borderRadius: BorderRadius.all(Radius.circular(30.0)),
  );

  // Use the same textInputDecoration as in RegisterPage
  final InputDecoration textInputDecoration = InputDecoration(
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
    ),
  );



  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: _index,
      type: StepperType.horizontal,
      onStepCancel: () {
        if (_index > 0) {
          setState(() {
            _index -= 1;
          });
        }
      },
      onStepContinue: () {
        if (_index < 2) {
          setState(() {
            _index += 1;
          });
        }
        else {
          submitCourse() ;
        }
      },
      onStepTapped: (int index) {
        setState(() {
          _index = index;
        });
      },
      steps: <Step>[
        Step(
          title: const Text('Main Info'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Add TextFormField for course name
              TextFormField(
                controller: courseNameController,
                decoration: textInputDecoration.copyWith(
                  labelText: 'Course Name',
                ),
              ),
              SizedBox(height: 10),
              // Multi-select list for topics
              MultiSelectDialogField(
                items: topics.map((topic) => MultiSelectItem(topic, topic)).toList(),
                title: Text('Select Topics'),
                selectedColor: Colors.blue,
                decoration: boxDecoration,
                onConfirm: (values) {
                  setState(() {
                    selectedTopics = values;
                  });
                },
              ),
              SizedBox(height: 20),
              // Multi-select list for prerequisites
              MultiSelectDialogField(
                items: prerequisites
                    .map((prerequisite) => MultiSelectItem(prerequisite, prerequisite))
                    .toList(),
                title: Text('Select Prerequisites'),
                selectedColor: Colors.blue,
                decoration: boxDecoration,
                onConfirm: (values) {
                  setState(() {
                    selectedPrerequisites = values;
                  });
                },
              ),
              SizedBox(height: 20),
              // Multi-select list for target audience
              MultiSelectDialogField(
                items: targetAudience
                    .map((audience) => MultiSelectItem(audience, audience))
                    .toList(),
                title: Text('Select Target Audience'),
                selectedColor: Colors.blue,
                decoration: boxDecoration,
                onConfirm: (values) {
                  setState(() {
                    selectedTargetAudience = values;
                  });
                },
              ),
            ],
          ),
        ),

        Step(
          title: const Text('Step2'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text('Start Date'),
              SizedBox(height: 5),
              InkWell(
                onTap: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: startDate ?? DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2101),
                  );
                  if (selectedDate != null && selectedDate != startDate) {
                    setState(() {
                      startDate = selectedDate;
                      updateDurationText();
                    });
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: boxDecoration,
                  child: Text(startDate != null
                      ? '${DateFormat.yMd().format(startDate!)}'
                      : 'Select Start Date'),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              Text('end Date'),
              SizedBox(height: 5),
              InkWell(
                onTap: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: endDate ?? DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2101),
                  );
                  if (selectedDate != null && selectedDate != endDate) {
                    setState(() {
                      endDate = selectedDate;
                      updateDurationText();
                    });
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: boxDecoration,
                  child: Text(endDate != null
                      ? '${DateFormat.yMd().format(endDate!)}'
                      : 'Select Start Date'),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  // Time Picker for Start Time
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Start Time'),
                        SizedBox(height: 5),
                        InkWell(
                          onTap: () async {
                            final selectedTime = await showTimePicker(
                              context: context,
                              initialTime: startTime ?? TimeOfDay.now(),
                            );
                            if (selectedTime != null && selectedTime != startTime) {
                              setState(() {
                                startTime = selectedTime;
                                updateDurationText();
                              });
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: boxDecoration,
                            child: Text(startTime != null
                                ? '${startTime!.format(context)}'
                                : 'Select Start Time'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  // Time Picker for End Time
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('End Time'),
                        SizedBox(height: 5),
                        InkWell(
                          onTap: () async {
                            final selectedTime = await showTimePicker(
                              context: context,
                              initialTime: endTime ?? TimeOfDay.now(),
                            );
                            if (selectedTime != null && selectedTime != endTime) {
                              setState(() {
                                endTime = selectedTime;
                                updateDurationText();
                              });
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: boxDecoration,
                            child: Text(endTime != null
                                ? '${endTime!.format(context)}'
                                : 'Select End Time'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Multi-select list for days
              MultiSelectDialogField(
                items: daysOfWeek.map((day) => MultiSelectItem(day, day)).toList(),
                title: Text('Select Days'),
                selectedColor: Colors.blue,
                decoration: boxDecoration,
                onConfirm: (values) {
                  setState(() {
                    selectedDays = values;
                  });
                },
              ),
              SizedBox(height: 20),
              // Location Textfield (if in person)
              if (!isOnline) ...[
                Text('Location'),
                SizedBox(height: 5),
                TextFormField(
                  controller: locationController,
                  decoration: textInputDecoration.copyWith(
                    labelText: 'Enter Location',
                  ),
                ),
                SizedBox(height: 20),
              ],
              // URI Textfield (if online)
              if (isOnline) ...[
                Text('Meeting URI'),
                SizedBox(height: 5),
                TextFormField(
                  controller: uriController,
                  decoration: textInputDecoration.copyWith(
                    labelText: 'Enter Meeting URI',
                  ),
                ),
                SizedBox(height: 20),
              ],
              Text('Duration'),
              SizedBox(height: 5),
              Container(
                padding: EdgeInsets.all(10),
                decoration: boxDecoration,
                child: Text(durationText),
              ),
              SizedBox(height: 20),
              Text('Price'),
              SizedBox(height: 5),
              TextFormField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: textInputDecoration.copyWith(
                  labelText: 'Enter Price',
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text('Course Type'),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isOnline = true;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: isOnline ? Colors.blue : Colors.black12),
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),
                      child: Text('Online'),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isOnline = false;
                        location = ''; // Reset location if switching to in-person
                      });
                      if (!isOnline) {
                        // Show a dialog to select location for in-person courses
                        _showLocationDialog();
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: isOnline ? Colors.black12 : Colors.blue),
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),
                      child: Text('In Person'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // Step 3
        Step(
          title: const Text('Finish'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Review and confirm your course details.'),
              const SizedBox(height: 20),

              // Add an Image Frame
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                child: selectedImage != null
                    ? Image.file(
                  File(selectedImage!.path),
                  fit: BoxFit.cover,
                )
                    : Center(
                  child: const Text('No Image Selected'),
                ),
              ),
              const SizedBox(height: 20),

              // Add Image Selector Button
              ElevatedButton(
                onPressed: () async {
                  await _selectImage();
                },
                child: const Text('Select Image'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Helper method to show image picker and handle image selection
  Future<void> _selectImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );

    if (pickedImage != null) {
      setState(() {
        selectedImage = XFile(pickedImage.path);
      });
    }
  }

  // Helper method to update the duration text
  void updateDurationText() {
    if (startDate != null && endDate != null) {
      final duration = endDate!.difference(startDate!);
      final days = duration.inDays;
      durationText = '$days days';
    } else {
      durationText = '';
    }
  }

  // Helper method to show the location dialog for in-person courses
  Future<void> _showLocationDialog() async {
    // Implement your logic to show a dialog for selecting the location for in-person courses
    // Use a map library or Google Maps API to integrate location selection

    // For example, you can use a dialog with a Google Map widget to allow users to choose the location.
    // You may need to include additional dependencies and set up API keys for Google Maps integration.
    // This is a basic placeholder, and you may need to implement the Google Maps part based on your requirements.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Location'),
          content: Container(
            height: 200, // Adjust the height as needed
            child: Center(
              child: Text('Google Maps Widget or Map Library Goes Here'),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Implement logic to save the selected location
                // For example, you can use the Google Maps API to get the selected coordinates.
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}