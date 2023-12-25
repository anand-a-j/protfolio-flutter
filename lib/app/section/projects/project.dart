import 'package:flutter/material.dart';
import 'package:portfolio/app/section/projects/project_desktop.dart';
import 'package:portfolio/app/section/projects/project_mobile.dart';
import 'package:portfolio/app/section/projects/project_tablet.dart';
import 'package:portfolio/core/responsive/responsive.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ProjectMobile(),
      tablet: ProjectTablet(),
      desktop: ProjectDesktop(),
    );
  }
}
