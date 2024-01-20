import 'package:flutter/material.dart';

Stack buildUserImage(Size size) {
  return Stack(
    children: [
      Container(
        width: size.width,
        height: 200,
        color: Colors.transparent,
        padding: EdgeInsets.only(bottom: 150 / 2.2),
        child: Container(
          width: size.width,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(10, 10),
                bottomRight: Radius.elliptical(10, 10)),
            image: DecorationImage(
              image: AssetImage("assets/Backgrounds/gradientblue.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),

      // * 1 backbutton (Row widget)
      Row(
        children: [
          IconButton(
            color: Colors.white,
            onPressed: () {},
            icon: Icon(Icons.arrow_back),
          )
        ],
      ),

      // * user profile image
      Positioned(
        top: 180 / 2,
        left: size.width / 2.4,
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.white, width: 3),
              shape: BoxShape.circle),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage("assets/Backgrounds/gradientblue.jpg"),
          ),
        ),
      ),
    ],
  );
}
