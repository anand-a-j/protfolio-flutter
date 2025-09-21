import 'package:flutter/material.dart';
import 'package:portfolio/app/section/main/controller/main_section_provider.dart';
import 'package:portfolio/core/utils/colors.dart';
import 'package:provider/provider.dart';

class CustomAppBarButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  const CustomAppBarButton(
      {super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainSectionProvider>(
        builder: (context, hoverController, _) {
      return MouseRegion(
        onEnter: (event) => hoverController.handleHover(true),
        onExit: (event) => hoverController.handleHover(false),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: TextButton(
            onPressed: onPressed,
            style: ButtonStyle(
              // foregroundColor: MaterialStateProperty.all<Color>(
              //   hoverController.isHover ? primaryColor : kwhite
              // ),
              // padding:  MaterialStateProperty.all<EdgeInsetsGeometry>(
              //      EdgeInsets.symmetric(vertical: 0,horizontal: 10)
              //   ),
              animationDuration: const Duration(milliseconds: 200),
              shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                    return RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(color: primaryColor),
                    );
                  }
                  return RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  );
                },
              ),
            ),
            child: Text(
              title,
              style: const TextStyle(
                  fontFamily: 'Poppins', fontSize: 14, color: kwhite),
            ),
          ),
        ),
      );
    });
  }
}
