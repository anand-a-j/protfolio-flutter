import 'package:flutter/material.dart';
import 'package:portfolio/app/section/about/about.dart';
import 'package:portfolio/app/section/contact/contact_page.dart';
import 'package:portfolio/app/section/footer/footer_desktop.dart';
import 'package:portfolio/app/section/home/home.dart';
import 'package:portfolio/app/section/projects/project.dart';
import 'package:portfolio/app/section/projects/project_desktop.dart';
import 'package:portfolio/app/section/services/service.dart';
import 'package:portfolio/app/section/skills/skills_page.dart';
import 'package:portfolio/core/utils/colors.dart';

List<Widget> body = [
  HomePage(),
  AboutPage(),
  // SkillsPage(),
  // ServicePage(),
  ProjectPage(),
  ContactPage(),
  // FooterDesktop(),
];

const heading2 =
    TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: kwhite);

const heading3 =
    TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textSecondary);

const body1 = TextStyle(fontSize: 14, color: textSecondary);

List<BoxShadow>? boxShadow = const [
  BoxShadow(
    color: card,
    spreadRadius: 1,
    blurRadius: 6,
    offset: Offset(0, 4),
  ),
  BoxShadow(
    blurRadius: 3,
    color: card,
    offset: Offset(-1, 0),
  ),
  BoxShadow(
    blurRadius: 4,
    color: card,
    offset: Offset(1, 0),
  )
];
