import 'package:flutter/material.dart';
import 'package:portfolio/app/utils/utils.dart';
import 'package:portfolio/core/providers/animated_provider.dart';
import 'package:portfolio/core/utils/colors.dart';
import 'package:provider/provider.dart';

class ProjectCardWidget extends StatelessWidget {
  final int index;
  const ProjectCardWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
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
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: card,
              boxShadow: boxShadow),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.sizeOf(context).width * 0.12,
                width: MediaQuery.sizeOf(context).width * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1534670007418-fbb7f6cf32c3?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fHVpJTIwdXh8ZW58MHx8MHx8fDA%3D"),
                      fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Project Name",
                style: heading3,
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 100,
                width: double.infinity,
                child: Text(
                  "ladksjflk jlaksdj lkasjfl ajslkfd jaslkdfj alsj fla fjals aslkf lkasjlasjfla jklsad lkasl a fjlaksjdf lkaflk ajflksad jlkasj flksaj flkaj laj ljfladsnfaslkfnalkflksadfnadlkcnalkdjf",
                  style: body1,
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
