import 'package:flutter/material.dart';
import 'package:portfolio/app/section/services/service_desktop.dart';
import 'package:portfolio/app/section/services/service_mobile.dart';
import 'package:portfolio/app/section/services/service_tablet.dart';
import 'package:portfolio/core/responsive/responsive.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ServiceIDoMobile(),
      tablet: ServiceIDoTablet(),
      desktop: ServiceIDoDesktop(),
    );
  }
}
