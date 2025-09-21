import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/app/section/projects/model/project_model.dart';
import 'package:portfolio/app/utils/utils.dart';
import 'package:portfolio/core/providers/animated_provider.dart';
import 'package:portfolio/core/constants/assets.dart';
import 'package:portfolio/core/utils/colors.dart';
import 'package:portfolio/core/utils/functions.dart';
import 'package:provider/provider.dart';

class ProjectCardWidget extends StatelessWidget {
  final int index;
  const ProjectCardWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Consumer<AnimateProvider>(builder: (context, animate, _) {
      return InkWell(
        onTap: () {
          animate.setIshover(true, index);
        },
        onHover: (value) {
          animate.setIshover(value, index);
        },
        child: AnimatedContainer(
          transform: Matrix4.identity()
            ..translate(0.0,
                animate.isHover && animate.currentIndex == index ? -20.0 : 0.0),
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOutCubic,
          padding: const EdgeInsets.all(10),
          width: width > 1024 ? null : width * 0.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: primaryContainer,
            border: Border.all(
              width: 1,
              color: primaryContainerBorder,
            ),
            boxShadow: boxShadow,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: width > 1024 ? width * 0.12 : width * 0.28,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1534670007418-fbb7f6cf32c3?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fHVpJTIwdXh8ZW58MHx8MHx8fDA%3D"),
                      fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                projects[index].title,
                style: Theme.of(context).textTheme.titleMedium,
                textScaler: TextScaler.linear(textScaleFactor(context)),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: Text(
                  projects[index].description,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textScaler: TextScaler.linear(textScaleFactor(context)),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
