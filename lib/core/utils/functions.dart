import 'dart:math';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const kDuration = Duration(milliseconds: 600);

// url launcher
Future<void> openUrlLink(String url) async {
  await launchUrl(Uri.parse(url));
}

// calculate text scale factor
double textScaleFactor(BuildContext context,
    {double maxTextScaleFactor = 1, double defaultScaleFactor = 0.5}) {
      final width = MediaQuery.of(context).size.width;
  maxTextScaleFactor = width > 1024 ? 1 : 2;
  defaultScaleFactor = width > 1024 ? 0.5 : 0.5;
  double val = (width / 1400) * maxTextScaleFactor;
  return max(defaultScaleFactor, min(val, maxTextScaleFactor));
}

scrollToSection(BuildContext context) {
  Scrollable.ensureVisible(
    context,
    duration: kDuration,
  );
}
