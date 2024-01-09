import 'package:flutter/material.dart';

class SignupStepper extends StatefulWidget {
  @override
  _SignupStepperState createState() => _SignupStepperState();
}

class _SignupStepperState extends State<SignupStepper> {
  // Controller for the text fields in each step
  TextEditingController missionController = TextEditingController();
  TextEditingController visionController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  // Stepper variables
  int currentStep = 0;
  bool complete = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Society Signup Stepper'),
      ),
      body: Stepper(
        type: StepperType.vertical,
        currentStep: currentStep,
        onStepContinue: () {
          if (currentStep < 2) {
            setState(() {
              currentStep += 1;
            });
          } else {
            // Call the API for signup_society_step2 here
            // Use the values from missionController, visionController, locationController
            // to send data to the API

            // Display success message or handle errors accordingly
            // For simplicity, just print a success message for now
            print('Signup Step 2 completed successfully');

            setState(() {
              complete = true;
            });
          }
        },
        onStepCancel: () {
          if (currentStep > 0) {
            setState(() {
              currentStep -= 1;
            });
          }
        },
        steps: [
          Step(
            title: Text('Mission'),
            isActive: currentStep == 0,
            content: Column(
              children: [
                TextFormField(
                  controller: missionController,
                  decoration: InputDecoration(labelText: 'Enter Mission'),
                ),
              ],
            ),
          ),
          Step(
            title: Text('Vision'),
            isActive: currentStep == 1,
            content: Column(
              children: [
                TextFormField(
                  controller: visionController,
                  decoration: InputDecoration(labelText: 'Enter Vision'),
                ),
              ],
            ),
          ),
          Step(
            title: Text('Location'),
            isActive: currentStep == 2,
            content: Column(
              children: [
                TextFormField(
                  controller: locationController,
                  decoration: InputDecoration(labelText: 'Enter Location'),
                ),
              ],
            ),
          ),
        ],
        // controlsBuilder: (BuildContext context,
        //     {VoidCallback? onStepContinue, VoidCallback? onStepCancel}) {
        //   return Row(
        //     children: [
        //       ElevatedButton(
        //         onPressed: onStepContinue!,
        //         child: Text('Continue'),
        //       ),
        //       SizedBox(width: 10),
        //       TextButton(
        //         onPressed: onStepCancel!,
        //         child: Text('Back'),
        //       ),
        //     ],
        //   );
        // },
      ),
    );
  }
}
