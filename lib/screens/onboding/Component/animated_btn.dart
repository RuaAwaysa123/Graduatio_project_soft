import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
class Animatedbtn extends StatelessWidget {
  const Animatedbtn({
    super.key,
    required RiveAnimationController btnAnimationController, required this.press,
  }) : _btnAnimationController = btnAnimationController;

  final RiveAnimationController _btnAnimationController;
  final VoidCallback press ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:press ,
      child: SizedBox(
        height: 64,
        width: 260,
        child: Stack(
          children: [
            // add animation

            // code for the button with out animation
            RiveAnimation.asset("assets/RiveAssets/button.riv",
              controllers: [_btnAnimationController],
            ),
            Positioned.fill(
                top: 8,
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(CupertinoIcons.arrow_right),
                    SizedBox(width: 8,),
                    Text(
                      "Start you Journey" ,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
