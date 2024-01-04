import 'package:flutter/material.dart';
import 'package:rive_animation/widget/constans/colors.dart';

class CustomLikedNotifcation extends StatelessWidget {
  const CustomLikedNotifcation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 80,
          width: 80,
          child: Stack(
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage("assets/images/Avatar3.png"),
                ),
              ),
              Positioned(
                bottom: 10,
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage("assets/images/Avatar2.png"),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              RichText(
                maxLines: 2,
                text: TextSpan(
                  text: "John Steve",
                  style: TextStyle(
                    color: Colors.black, // Change to your desired color
                    fontFamily: 'Inter',
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                  children: [
                    TextSpan(
                      text: " and \n",
                      style: TextStyle(
                        color: SecondaryText, // Change to your desired color
                        fontFamily: 'Inter',
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const TextSpan(text: "Sam Wincherter")
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Liked your recipe  .  h1",
                style: TextStyle(
                  color: SecondaryText, // Change to your desired color
                  fontFamily: 'Inter',
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Image.asset(
          "assets/images/Cover.png",
          height: 64,
          width: 64,
        ),
      ],
    );
  }
}