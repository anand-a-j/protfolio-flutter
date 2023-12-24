import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/colors.dart';
import 'package:portfolio/core/utils/functions.dart';
import 'package:portfolio/core/utils/urls.dart';

class FooterCopyRight extends StatelessWidget {
  const FooterCopyRight({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('© 2023-24 All rights reserved',
            style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 1),
        Center(
          child: InkWell(
            onTap: () {
              openUrlLink(Urls.githubAccountUrl);
            },
            child: RichText(
              text: TextSpan(
                text: "Built with Flutter by ",
                style: Theme.of(context).textTheme.bodySmall,
                children: const [
                  TextSpan(
                    text: 'Anand A J',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w900,
                      color: textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
