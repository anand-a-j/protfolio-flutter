// colors
import 'package:flutter/material.dart';

const Color primaryColor = Color(0xff854ce6);
const Color secondaryColor = Colors.black;
const Color kwhite = Colors.white;
const Color kblack = Colors.black;
const Color bgColor = Color(0xff1c1e27);
const Color textPrimary = Color(0xfff2f3f4);
const Color textSecondary = Color(0xffb1b2b3);
const Color card = Color(0xff171721);
const Color cardLight = Color(0xff191924);

const Gradient buttonGradient = LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  colors: [
    primaryColor,
    Colors.purple,
  ],
);

Gradient buttonHoverGradient = LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  colors: [
    
    Colors.purple.shade400,
    primaryColor,
  ],
);
