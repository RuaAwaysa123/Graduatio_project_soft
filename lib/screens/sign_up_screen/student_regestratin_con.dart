import 'package:flutter/material.dart';

import '../../services/auth_service.dart';
import '../profile/profile_page.dart';
import 'education_input_page.dart';

class StudentRegistrationContinuationPage extends StatefulWidget {

  final String email;

  // Add the constructor to receive the email
  StudentRegistrationContinuationPage({required this.email});

  @override
  _StudentRegistrationContinuationPageState createState() =>
      _StudentRegistrationContinuationPageState();
}

class _StudentRegistrationContinuationPageState
    extends State<StudentRegistrationContinuationPage> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  String _selectedMajor = 'Math'; // Set an initial value
  String _selectedYear = '1st Year'; // Default value
  TextEditingController _universityNumberController = TextEditingController();

  List<String> majorOptions = ['','Computer Science', 'Engineering', 'Math', 'Other'];
  List<String> yearOptions = ['', '1st Year', '2nd Year', '3rd Year', '4th Year', '5th Year'];

  void signup_con() async {
    // You need to create an instance of AuthService
    AuthService authService = AuthService();

    authService.signupContinue(
      context: context,
      phoneNumber: _phoneNumberController.text,
      // firstName: _firstNameController.text,
      // lastName: _lastNameController.text,
      location: _locationController.text,
      universityNumber: _universityNumberController.text,
      major: _selectedMajor,
      year: _selectedYear,
      email: widget.email, // You need to provide the email parameter here
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StudentRegistrationContinuation2Page(),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Registration'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Continue Student Registration',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              // SizedBox(height: 16.0),
              // buildTextField('First Name', 'Enter your first name', Icons.person, _firstNameController),
              // SizedBox(height: 16.0),
              // buildTextField('Last Name', 'Enter your last name', Icons.person, _lastNameController),
              // SizedBox(height: 16.0),
              buildTextField('Phone Number', 'Enter your phone number', Icons.phone, _phoneNumberController),
              SizedBox(height: 16.0),
              buildTextField('Location', 'Enter your location', Icons.location_on, _locationController),
              SizedBox(height: 16.0),
              buildTextField('University Number', 'Enter your university number', Icons.school, _universityNumberController),
              SizedBox(height: 16.0),
              // Display the email received from the previous page

              buildDropdownButtonFormField(
                'Select Major',
                majorOptions,
                Icons.arrow_drop_down, // You can change this icon as needed
                _selectedMajor,
                    (String? major) {
                  setState(() {
                    _selectedMajor = major!;
                  });
                },
              ),
              SizedBox(height: 16.0),
              buildDropdownButtonFormField(
                'Select Year',
                yearOptions,
                Icons.arrow_drop_down, // You can change this icon as needed
                _selectedYear,
                    (String? year) {
                  setState(() {
                    _selectedYear = year!;
                  });
                },
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  // Add your logic to handle the student registration data here
                  // You can access the entered data using controllers
                  signup_con();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StudentRegistrationContinuation2Page(),
                    ),
                  );

                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue[300]),
                  minimumSize: MaterialStateProperty.all(
                    Size(double.infinity, 50),
                  ),
                ),
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String hintText, IconData prefixIcon, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: Icon(prefixIcon),
      ),
    );
  }

  Widget buildDropdownButtonFormField(
      String labelText,
      List<String> items,
      IconData icon,
      String value,
      ValueChanged<String?> onChanged,
      ) {
    return DropdownButtonFormField(
      value: value,
      onChanged: onChanged,
      items: items.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Row(
            children: [
              Icon(icon),
              SizedBox(width: 8.0),
              Text(item),
            ],
          ),
        );
      }).toList(),
      decoration: InputDecoration(
        labelText: labelText,
      ),
    );
  }
}