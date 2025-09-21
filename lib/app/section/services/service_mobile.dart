import 'package:flutter/material.dart';
import 'package:portfolio/app/section/services/widget/service_info_card.dart';
import 'package:portfolio/app/utils/utils.dart';
import 'package:portfolio/core/constants/assets.dart';
import 'package:portfolio/core/utils/functions.dart';

class ServiceIDoMobile extends StatelessWidget {
  const ServiceIDoMobile({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> _services = const [
      ServiceInfoCard(
          iconUrl: Assets.android,
          title: 'Andorid App Development',
          subtitle: ''),
      ServiceInfoCard(
          iconUrl: Assets.apple, title: 'Ios App Development', subtitle: ''),
      ServiceInfoCard(
          iconUrl: Assets.uiux, title: 'UI/UX Designing', subtitle: ''),
      ServiceInfoCard(
          iconUrl: Assets.web,
          title: 'Web Development',
          subtitle: '')
    ];

    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "What I can do?",
            style: heading2,
            textScaler: TextScaler.linear(textScaleFactor(context)),
          ),
          const SizedBox(height: 20),
          Text(
            "Since the begining of my journey as a developer, I have work in these technologies.My main strength lies in flutter development from last one year",
            style: Theme.of(context).textTheme.bodyMedium,
            textScaler: TextScaler.linear(
              textScaleFactor(context),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) => _services[index],
            itemCount: _services.length,
          ),
        ],
      ),
    );
  }
}
