// colors
import 'package:flutter/material.dart';

const Color primaryColor = Color(0xff854ce6);
const Color secondaryColor = Color(0xff010101);
const Color onPrimary = Color(0xffffffff);
const Color kwhite = Colors.white;
const Color kblack = Colors.black;
const Color bgColor = Color(0xff010101);
const Color textPrimary = Color(0xfff2f3f4);
const Color textSecondary = Color(0xffb1b2b3);
const Color card = Color(0xff171721);
const Color cardLight = Color(0xff191924);

// card
const Color primaryContainer = Color(0xff0f0f0f);
const Color primaryContainerBorder = Color(0xff3d3d3d);
const Color onPrimaryContainer = Color(0xfff6f6f6);
const Color onPrimaryContainerDim = Color(0xffd1d1d1);

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
