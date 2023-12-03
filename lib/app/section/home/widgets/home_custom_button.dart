import 'package:flutter/material.dart';
import 'package:portfolio/core/providers/animated_button_provider.dart';
import 'package:portfolio/utils/colors.dart';
import 'package:provider/provider.dart';

class HomeCustomButton extends StatelessWidget {
  const HomeCustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AnimateProvider>(builder: (context, button, _) {
      return InkWell(
        onTap: () {
          button.setIshover(true,0);
        },
        onHover: (isHover) {
          print("isHover $isHover");
          button.setIshover(isHover,0);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOutCubic,
          height: button.isHover ? 52 : 50,
          width: button.isHover ? 220 : 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: buttonGradient),
          child: const Center(
            child: Text(
              "Download Resume",
              style: TextStyle(
                  color: kwhite, fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
      );
    });
  }
}
