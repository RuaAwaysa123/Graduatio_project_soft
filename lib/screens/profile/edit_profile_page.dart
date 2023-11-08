import 'dart:io';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:rive_animation/model/user.dart';
import 'package:rive_animation/utils/user_preferences.dart';
import 'package:rive_animation/widget/appbar_widget.dart';
import 'package:rive_animation/widget/button_widget.dart';
import 'package:rive_animation/widget/profile_widget.dart';
import 'package:rive_animation/widget/textfield_widget.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User user = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) => ThemeSwitchingArea(
    child: Builder(
      builder: (context) => Scaffold(
        appBar: buildAppBar(context),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              imagePath: user.imagePath,
              isEdit: true,
              onClicked: () async {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Full Name',
              text: user.name,
              onChanged: (name) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Email',
              text: user.email,
              onChanged: (email) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'About',
              text: user.about,
              maxLines: 5,
              onChanged: (about) {},
            ),
          ],
        ),
      ),
    ),
  );
}



// import 'dart:io';
//
// import 'package:animated_theme_switcher/animated_theme_switcher.dart';
// import 'package:flutter/material.dart';
// import 'package:rive_animation/model/user.dart';
// import 'package:rive_animation/utils/user_preferences.dart';
// import 'package:rive_animation/widget/appbar_widget.dart';
// import 'package:rive_animation/widget/button_widget.dart';
// import 'package:rive_animation/widget/profile_widget.dart';
// import 'package:rive_animation/widget/textfield_widget.dart';
// import 'package:image_picker/image_picker.dart';
//
// class EditProfilePage extends StatefulWidget {
//   @override
//   _EditProfilePageState createState() => _EditProfilePageState();
// }
//
// class _EditProfilePageState extends State<EditProfilePage> {
//   User user = UserPreferences.myUser;
//   File? _newImage;
//   final _formKey = GlobalKey<FormState>();
//
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _aboutController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     _nameController.text = user.name;
//     _emailController.text = user.email;
//     _aboutController.text = user.about;
//   }
//
//   @override
//   Widget build(BuildContext context) => ThemeSwitchingArea(
//     child: Builder(
//       builder: (context) => Scaffold(
//         appBar: buildAppBar(context),
//         body: Form(
//           key: _formKey,
//           child: ListView(
//             padding: EdgeInsets.symmetric(horizontal: 32),
//             physics: BouncingScrollPhysics(),
//             children: [
//               GestureDetector(
//                 onTap: _openImagePicker,
//                 child: ProfileWidget(
//                   imagePath: _newImage?.path ?? user.imagePath,
//                   isEdit: true,
//                   onClicked: _openImagePicker,
//                 ),
//               ),
//               const SizedBox(height: 24),
//               TextFieldWidget(
//                 label: 'Full Name',
//                 text: user.name,
//                 onChanged: (name) {
//                   user.name = name;
//                 },
//               ),
//               const SizedBox(height: 24),
//               TextFieldWidget(
//                 label: 'Email',
//                 text: user.email,
//                 onChanged: (email) {
//                   user.email = email;
//                 },
//               ),
//               const SizedBox(height: 24),
//               TextFieldWidget(
//                 label: 'About',
//                 text: user.about,
//                 maxLines: 5,
//                 onChanged: (about) {
//                   user.about = about;
//                 },
//               ),
//               const SizedBox(height: 24),
//               ButtonWidget(
//                 text: 'Save',
//                 onClicked: () {
//                   if (_formKey.currentState!.validate()) {
//                     _saveChanges();
//                   }
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
//
//   void _openImagePicker() async {
//     final pickedFile = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _newImage = File(pickedFile.path);
//       });
//     }
//   }
//
//   void _saveChanges() {
//     // Save the new image, if it exists.
//     if (_newImage != null) {
//       user.imagePath = _newImage!.path;
//     }
//
//     // Save the updated user information.
//     UserPreferences.saveUser(user);
//
//     // Navigate back to the profile page.
//     Navigator.pop(context);
//   }
// }