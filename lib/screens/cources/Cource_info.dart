// // // import 'package:flutter/material.dart';
// // //
// // // /// Flutter code sample for [Stepper].
// // //
// // //
// // // class addCourse extends StatelessWidget {
// // //   const addCourse({super.key});
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       home: Scaffold(
// // //         appBar: AppBar(title: const Text('Stepper Sample')),
// // //         body: const Center(
// // //           child: addNewCourse(),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// // //
// // // class addNewCourse extends StatefulWidget {
// // //   const addNewCourse({super.key});
// // //
// // //   @override
// // //   State<addNewCourse> createState() => _addNewCourseState();
// // // }
// // //
// // // class _addNewCourseState extends State<addNewCourse> {
// // //   int _index = 0;
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Stepper(
// // //       currentStep: _index,
// // //       onStepCancel: () {
// // //         if (_index > 0) {
// // //           setState(() {
// // //             _index -= 1;
// // //           });
// // //         }
// // //       },
// // //       onStepContinue: () {
// // //         if (_index <= 0) {
// // //           setState(() {
// // //             _index += 1;
// // //           });
// // //         }
// // //       },
// // //       onStepTapped: (int index) {
// // //         setState(() {
// // //           _index = index;
// // //         });
// // //       },
// // //       steps: <Step>[
// // //         Step(
// // //           title: const Text('Step 1 title'),
// // //           content: Container(
// // //             alignment: Alignment.centerLeft,
// // //             child: const Text('Content for Step 1'),
// // //           ),
// // //         ),
// // //         const Step(
// // //           title: Text('Step 2 title'),
// // //           content: Text('Content for Step 2'),
// // //         ),
// // //       ],
// // //     );
// // //   }
// // // }
// // import 'package:flutter/material.dart';
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
// //
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
// //         // Step(
// //         //   title: const Text('Step 1 title'),
// //         //   content: Container(
// //         //     alignment: Alignment.centerLeft,
// //         //     child: const Text('Content for Step 2'),
// //         //   ),
// //         // ),
// //         Step(
// //           title: const Text('Step 1 title'),
// //           content: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               TextFormField(
// //                 decoration: InputDecoration(labelText: 'Course Name'),
// //                 // You can handle the input value using a controller or onChanged callback.
// //               ),
// //               TextFormField(
// //                 decoration: InputDecoration(labelText: 'Topic'),
// //                 // You can handle the input value using a controller or onChanged callback.
// //               ),
// //               TextFormField(
// //                 decoration: InputDecoration(labelText: 'Target Audience'),
// //                 // You can handle the input value using a controller or onChanged callback.
// //               ),
// //               TextFormField(
// //                 decoration: InputDecoration(labelText: 'Prerequisites'),
// //                 // You can handle the input value using a controller or onChanged callback.
// //               ),
// //             ],
// //           ),
// //         ),
// //         Step(
// //           title: const Text('Step 2 title'),
// //           content: Container(
// //             alignment: Alignment.centerLeft,
// //             child: const Text('Content for Step 3'),
// //           ),
// //         ),
// //         Step(
// //           title: const Text('Step 3 title'),
// //           content: const Text('finish'),
// //
// //         ),
// //       ],
// //     );
// //   }
// // }
import 'package:flutter/material.dart';

class AddCourse extends StatelessWidget {
  const AddCourse({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Add New course')),
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

  // Use the same textInputDecoration as in RegisterPage
  final InputDecoration textInputDecoration = InputDecoration(
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue), // Set the border color to blue
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: _index,
      type: StepperType.horizontal, // Set the type to horizontal
      onStepCancel: () {
        if (_index > 0) {
          setState(() {
            _index -= 1;
          });
        }
      },
      onStepContinue: () {
        if (_index < 1) {
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
          title: const Text('Step 1 title'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: textInputDecoration.copyWith(
                  labelText: 'Course Name',
                ),
                // You can handle the input value using a controller or onChanged callback.
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: textInputDecoration.copyWith(
                  labelText: 'Topic',

                ),
                // You can handle the input value using a controller or onChanged callback.
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: textInputDecoration.copyWith(
                  labelText: 'Target Audience',

                ),
                // You can handle the input value using a controller or onChanged callback.
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: textInputDecoration.copyWith(
                  labelText: 'Prerequisites',
                ),
                // You can handle the input value using a controller or onChanged callback.
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
        Step(
          title: const Text('Step 2 title'),
          content: Container(
            alignment: Alignment.centerLeft,
            child: const Text('Content for Step 3'),
          ),
        ),
        Step(
          title: const Text('Step 3 title'),
          content: const Text('finish'),
        ),
      ],
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:multi_select_flutter/multi_select_flutter.dart';
//
// class AddCourse extends StatelessWidget {
//   const AddCourse({Key? key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('Add New course')),
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
//
//   // Use the same textInputDecoration as in RegisterPage
//   final InputDecoration textInputDecoration = InputDecoration(
//     border: OutlineInputBorder(
//       borderSide: BorderSide(color: Colors.blue), // Set the border color to blue
//       borderRadius: BorderRadius.all(Radius.circular(30.0)),
//     ),
//   );
//
//   // Define the options for multi-selection
//   final List<String> topicOptions = [
//     'Topic 1',
//     'Topic 2',
//     'Topic 3',
//     // Add more topics as needed
//   ];
//
//   final List<String> targetAudienceOptions = [
//     'Major 1',
//     'Major 2',
//     'Major 3',
//     // Add more majors as needed
//   ];
//
//   final List<String> prerequisitesOptions = [
//     'Prerequisite 1',
//     'Prerequisite 2',
//     'Prerequisite 3',
//     // Add more prerequisites as needed
//   ];
//
//   // Initialize controllers for multi-selection lists
//   final _topicsController = MultiSelectController<String>();
//   final _targetAudienceController = MultiSelectController<String>();
//   final _prerequisitesController = MultiSelectController<String>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Stepper(
//       currentStep: _index,
//       type: StepperType.horizontal, // Set the type to horizontal
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
//           title: const Text('Step 1 title'),
//           content: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Multi-selection list for Topics
//               MultiSelectFormField(
//                 autovalidateMode: AutovalidateMode.always,
//                 chipDisplay: MultiSelectChipDisplay<String>(
//                   onTap: (value) {
//                     // Handle chip tap
//                   },
//                 ),
//                 titleText: 'Topics',
//                 dataSource: topicOptions
//                     .map((e) => MultiSelectItem<String>(e, e))
//                     .toList(),
//                 textField: 'display',
//                 valueField: 'value',
//                 onSaved: (value) {
//                   // Handle the selected values
//                 },
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please select at least one topic';
//                   }
//                   return null;
//                 },
//                 onFieldSubmitted: (items) {
//                   // Handle submitted values
//                 },
//                 controller: _topicsController,
//               ),
//
//               SizedBox(height: 10),
//
//               // Multi-selection list for Target Audience
//               MultiSelectFormField(
//                 autovalidateMode: AutovalidateMode.always,
//                 chipDisplay: MultiSelectChipDisplay<String>(
//                   onTap: (value) {
//                     // Handle chip tap
//                   },
//                 ),
//                 titleText: 'Target Audience',
//                 dataSource: targetAudienceOptions
//                     .map((e) => MultiSelectItem<String>(e, e))
//                     .toList(),
//                 textField: 'display',
//                 valueField: 'value',
//                 onSaved: (value) {
//                   // Handle the selected values
//                 },
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please select at least one target audience';
//                   }
//                   return null;
//                 },
//                 onFieldSubmitted: (items) {
//                   // Handle submitted values
//                 },
//                 controller: _targetAudienceController,
//               ),
//
//               SizedBox(height: 10),
//
//               // Multi-selection list for Prerequisites
//               MultiSelectFormField(
//                 autovalidateMode: AutovalidateMode.always,
//                 chipDisplay: MultiSelectChipDisplay<String>(
//                   onTap: (value) {
//                     // Handle chip tap
//                   },
//                 ),
//                 titleText: 'Prerequisites',
//                 dataSource: prerequisitesOptions
//                     .map((e) => MultiSelectItem<String>(e, e))
//                     .toList(),
//                 textField: 'display',
//                 valueField: 'value',
//                 onSaved: (value) {
//                   // Handle the selected values
//                 },
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please select at least one prerequisite';
//                   }
//                   return null;
//                 },
//                 onFieldSubmitted: (items) {
//                   // Handle submitted values
//                 },
//                 controller: _prerequisitesController,
//               ),
//
//               SizedBox(height: 10),
//             ],
//           ),
//         ),
//         Step(
//           title: const Text('Step 2 title'),
//           content: Container(
//             alignment: Alignment.centerLeft,
//             child: const Text('Content for Step 3'),
//           ),
//         ),
//         Step(
//           title: const Text('Step 3 title'),
//           content: const Text('finish'),
//         ),
//       ],
//     );
//   }
// }
