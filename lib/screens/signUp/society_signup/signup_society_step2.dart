import 'package:flutter/material.dart';

import '../../../services/society_auth_service.dart';
import '../../sign_up_screen/registration_success_screen.dart';

class SignupStepper extends StatefulWidget {
  final String societyId; // Add this line to declare the 'email' parameter

  SignupStepper({Key? key, required this.societyId}) : super(key: key);

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

  // signup society function
  Future<void> signUpSocietyStep2() async {
    // Retrieve societyId from widget
    String societyId = widget.societyId;

    try {
      // Call the API for signup_society_step2 here
      Map<String, dynamic> result = await SocietyAuthService().signUpSocietyStep2(
        societyId: societyId,
        mission: missionController.text,
        vision: visionController.text,
        location: locationController.text,
      );

      if (result['success']) {
        // If signup_society_step2 is successful, navigate to the next page
        // Replace the following line with your desired navigation logic
        print('Signup Step 2 completed successfully');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RegistrationSuccessScreen(userType: '1',),
          ),
        );

      } else {
        // Handle error, for simplicity, just print the error message
        print('Error in signup_society_step2: ${result['message']}');
        // You may want to display a proper error message or take appropriate action here
      }
    } catch (e) {
      // Handle unexpected error, for simplicity, just print the error message
      print('An unexpected error occurred: $e');
      // You may want to display a proper error message or take appropriate action here
    }
  }

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
            signUpSocietyStep2();
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
      ),

    );
  }

}
