// // import 'package:flutter/material.dart';
// // import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
// // import 'package:multi_select_flutter/util/multi_select_item.dart';
// //
// // class AddCourse extends StatelessWidget {
// //   const AddCourse({Key? key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         appBar: AppBar(title: const Text('Add New course')),
// //         body: const Center(
// //           child: AddNewCourse(),
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // class AddNewCourse extends StatefulWidget {
// //   const AddNewCourse({Key? key});
// //
// //   @override
// //   State<AddNewCourse> createState() => _AddNewCourseState();
// // }
// //
// // class _AddNewCourseState extends State<AddNewCourse> {
// //   int _index = 0;
// //   final List<String> topics = ['Topic 1', 'Topic 2', 'Topic 3', 'Topic 4'];
// //   final List<String> prerequisites = ['Prerequisite 1', 'Prerequisite 2'];
// //   final List<String> targetAudience = ['Beginner', 'Intermediate', 'Advanced'];
// //
// //   // Store selected values for each list
// //   List<String> selectedTopics = [];
// //   List<String> selectedPrerequisites = [];
// //   List<String> selectedTargetAudience = [];
// //
// //   DateTime? startDate;
// //   DateTime? endDate;
// //   String durationText = '';
// //   TextEditingController priceController = TextEditingController();
// //   bool isOnline = false;
// //   String location = '';
// //
// //   // Use the same textInputDecoration as in RegisterPage
// //   final InputDecoration textInputDecoration = InputDecoration(
// //     border: OutlineInputBorder(
// //       borderSide: BorderSide(color: Colors.blue), // Set the border color to blue
// //       borderRadius: BorderRadius.all(Radius.circular(30.0)),
// //     ),
// //   );
// //
// //   final BoxDecoration boxDecoration = BoxDecoration(
// //     border: Border.all(color: Colors.black12), // Set the border color to blue
// //     borderRadius: BorderRadius.all(Radius.circular(30.0)),
// //   );
// //   @override
// //   Widget build(BuildContext context) {
// //     return Stepper(
// //       currentStep: _index,
// //       type: StepperType.horizontal, // Set the type to horizontal
// //       onStepCancel: () {
// //         if (_index > 0) {
// //           setState(() {
// //             _index -= 1;
// //           });
// //         }
// //       },
// //       onStepContinue: () {
// //         if (_index < 1) {
// //           setState(() {
// //             _index += 1;
// //           });
// //         }
// //       },
// //       onStepTapped: (int index) {
// //         setState(() {
// //           _index = index;
// //         });
// //       },
// //       steps: <Step>[
// //         Step(
// //           title: const Text('Main Info'),
// //           content: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               TextFormField(
// //                 decoration: textInputDecoration.copyWith(
// //                   labelText: 'Course Name',
// //                 ),
// //                 // You can handle the input value using a controller or onChanged callback.
// //               ),
// //               SizedBox(height: 10),
// //               // Multi-select list for topics
// //               MultiSelectDialogField(
// //                 items: topics.map((topic) => MultiSelectItem(topic, topic)).toList(),
// //                 title: Text('Select Topics'),
// //                 selectedColor: Colors.blue,
// //                 decoration: boxDecoration,
// //                 onConfirm: (values) {
// //                   setState(() {
// //                     selectedTopics = values;
// //                   });
// //                 },
// //               ),
// //
// //               SizedBox(height: 20),
// //
// //               // Multi-select list for prerequisites
// //               MultiSelectDialogField(
// //                 items: prerequisites.map((prerequisite) => MultiSelectItem(prerequisite, prerequisite)).toList(),
// //                 title: Text('Select Prerequisites'),
// //                 selectedColor: Colors.blue,
// //                 decoration: boxDecoration,
// //                 onConfirm: (values) {
// //                   setState(() {
// //                     selectedPrerequisites = values;
// //                   });
// //                 },
// //               ),
// //
// //               SizedBox(height: 20),
// //
// //               // Multi-select list for target audience
// //               MultiSelectDialogField(
// //                 items: targetAudience.map((audience) => MultiSelectItem(audience, audience)).toList(),
// //                 title: Text('Select Target Audience'),
// //                 selectedColor: Colors.blue,
// //                decoration: boxDecoration,
// //                 onConfirm: (values) {
// //                   setState(() {
// //                     selectedTargetAudience = values;
// //                   });
// //                 },
// //               ),
// //             ],
// //           ),
// //         ),
// //         Step(
// //           title: const Text('Continue Course info'),
// //           content: Container(
// //             alignment: Alignment.centerLeft,
// //             child: const Text('Content for Step 3'),
// //           ),
// //         ),
// //         Step(
// //           title: const Text('Step 3 title'),
// //           content: const Text('finish'),
// //         ),
// //       ],
// //     );
// //   }
// // }
// //
//
// import 'package:flutter/material.dart';
// import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
// import 'package:multi_select_flutter/util/multi_select_item.dart';
// import 'package:intl/intl.dart';
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
//   String location = '';
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
//         if (_index < 1) {
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
//           title: const Text('Continue Course Info'),
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
//                       if (isOnline) {
//                         // Show a dialog to select location for online courses
//                         _showLocationDialog();
//                       }
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
//         Step(
//           title: const Text('Step 3 title'),
//           content: const Text('Finish'),
//         ),
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
//   // Helper method to show the location dialog
//   Future<void> _showLocationDialog() async {
//     // Implement your logic to show a dialog for selecting the location for online courses
//     // For example, you can use the showDialog function and present a dialog to input the location.
//     // You can use a TextEditingController to store the entered location.
//     // After the user selects the location, update the 'location' variable.
//     await showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         // Implement your dialog UI here
//         // For example, a TextField to input the location
//         return AlertDialog(
//           title: Text('Enter Location'),
//           content: TextField(
//             onChanged: (value) {
//               setState(() {
//                 location = value;
//               });
//             },
//             decoration: InputDecoration(
//               hintText: 'Location',
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
//                 Navigator.of(context).pop();
//                 // Do something with the selected location
//               },
//               child: Text('Save'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:intl/intl.dart';

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
  bool isOnline = false;
  String location = '';

  // Decoration for boxes
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
              TextFormField(
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
                items: prerequisites.map((prerequisite) => MultiSelectItem(prerequisite, prerequisite)).toList(),
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
                items: targetAudience.map((audience) => MultiSelectItem(audience, audience)).toList(),
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
          title: const Text('Continue Course Info'),
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
              Text('End Date'),
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
                      : 'Select End Date'),
                ),
              ),
              SizedBox(height: 20),
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
        // Step(
        //   title: const Text('Finish'),
        //   content: const Text('Finish'),
        // ),
        Step(
          title: const Text('Finish'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Review and confirm your course details.'),
              const SizedBox(height: 20),

            ],
          ),
        ),

      ],
    );
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
