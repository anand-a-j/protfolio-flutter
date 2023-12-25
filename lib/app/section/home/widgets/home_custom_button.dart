import 'package:flutter/material.dart';
import 'package:portfolio/core/providers/animated_provider.dart';
import 'package:portfolio/core/utils/colors.dart';
import 'package:provider/provider.dart';

class HomeCustomButton extends StatelessWidget {
  const HomeCustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AnimateProvider>(builder: (context, button, _) {
      return InkWell(
        onTap: () {
          button.setIshover(true, 0);
        },
        onHover: (isHover) {
          button.setIshover(isHover, 0);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOutCubic,
          height: button.isHover ? 51 : 50,
          width: button.isHover ? 220 : 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: button.isHover ? buttonHoverGradient : buttonGradient,
          ),
          child: Center(
            child: Text(
              "Download Resume",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ),
      );
    });
  }
}
