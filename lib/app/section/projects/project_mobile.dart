import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/app/section/projects/model/project_model.dart';
import 'package:portfolio/app/utils/utils.dart';
import 'widgets/project_card_widget.dart';

class ProjectMobile extends StatelessWidget {
  const ProjectMobile({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: width,
      child: ListView(
        shrinkWrap: true,
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Projects",
              style: heading3,
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            width: width,
            child: CarouselSlider(
               options: CarouselOptions(
                autoPlay: true,
               autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 2000),
                  viewportFraction: 0.6,
                  aspectRatio: 4.2/2.8
              ),
              items: projects.asMap().entries.map((e) => ProjectCardWidget(index: e.key)).toList()
            ),
          )
        ],
      ),
    );
  }
}
