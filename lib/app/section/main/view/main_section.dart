import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/app/section/main/view/widget/custom_appbar_button.dart';
import 'package:portfolio/app/section/main/view/widget/drawer_mobile.dart';
import 'package:portfolio/core/providers/scroll_provider.dart';
import 'package:portfolio/app/utils/utils.dart';
import 'package:portfolio/core/utils/colors.dart';
import 'package:portfolio/core/utils/functions.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'widget/live_clock.dart';

class MainSection extends StatelessWidget {
  const MainSection({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollProvider = Provider.of<ScrollProvider>(context, listen: false);
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: bgColor,
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(60),
      //   child: ClipRRect(
      //     borderRadius: BorderRadius.circular(50), // ensure clipping
      //     child: BackdropFilter(
      //       filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
      //       child: Container(
      //         width: double.infinity,
      //         margin: const EdgeInsets.symmetric(
      //           horizontal: 150,
      //         ),
      //         padding: const EdgeInsets.symmetric(
      //           horizontal: 26,
      //           vertical: 20,
      //         ),
      //         decoration: BoxDecoration(
      //           color: bgColor.withOpacity(0.18),
      //           borderRadius: BorderRadius.circular(50),
      //           border: Border.all(
      //             width: 1,
      //             color: primaryContainerBorder,
      //           ),
      //           gradient: LinearGradient(
      //             begin: Alignment.topLeft,
      //             end: Alignment.bottomRight,
      //             colors: [
      //               bgColor.withOpacity(0.22),
      //               bgColor.withOpacity(0.12),
      //             ],
      //           ),
      //         ),
      //         child: Text(
      //           "Hello Annad",
      //           style: TextStyle(
      //             color: Colors.white,
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),

      // buildGlassAppBar(width, context, scrollProvider),
      // appBar: AppBar(
      //   backgroundColor: bgColor,
      //   elevation: 0,
      //   title: Padding(
      //     padding: EdgeInsets.only(left: width > 1024 ?  150:10),
      //     child: Text(
      //       '<Anand/>',
      //       style: const TextStyle(fontFamily: 'Pacifico'),
      //       textScaler: TextScaler.linear(
      //         textScaleFactor(context),
      //       ),
      //     ),
      //   ),
      //   actions: width > 1024 ? [
      //     CustomAppBarButton(
      //       title: 'Home',
      //       onPressed: () => scrollProvider.jumpTo(0),
      //     ),
      //     const SizedBox(width: 10),
      //     CustomAppBarButton(
      //       title: 'Services',
      //       onPressed: () => scrollProvider.jumpTo(1),
      //     ),
      //     const SizedBox(width: 10),
      //     CustomAppBarButton(
      //       title: 'Projects',
      //       onPressed: () => scrollProvider.jumpTo(2),
      //     ),
      //     const SizedBox(width: 10),
      //     CustomAppBarButton(
      //       title: 'Contacts',
      //       onPressed: () => scrollProvider.jumpTo(3),
      //     ),
      //     const SizedBox(width: 100),
      //   ] : null
      // ),
      endDrawer: width < 1024 ? const DrawerMobile() : null,
      body: ScrollablePositionedList.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: body.length,
        itemScrollController: scrollProvider.scrollController,
        itemBuilder: (context, index) => body[index],
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          left: 150,
          right: 150,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50), // ensure clipping
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              width: double.infinity,
              // margin: const EdgeInsets.only(
              //   left: 150,
              //   right: 150,
              // ),
              // margin: const EdgeInsets.symmetric(
              //   horizontal: 150,
              // ),
              padding: const EdgeInsets.symmetric(
                horizontal: 26,
                vertical: 0,
              ),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 95, 95, 95).withOpacity(0.18),
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  width: 1,
                  color: primaryContainerBorder,
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color.fromARGB(255, 87, 87, 87).withOpacity(0.22),
                    const Color.fromARGB(255, 117, 117, 117).withOpacity(0.12),
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LiveClock(),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 10,
                    children: [
                      CustomAppBarButton(
                        title: 'Home',
                        onPressed: () => scrollProvider.jumpTo(0),
                      ),
                      CustomAppBarButton(
                        title: 'Services',
                        onPressed: () => scrollProvider.jumpTo(1),
                      ),
                      CustomAppBarButton(
                        title: 'Projects',
                        onPressed: () => scrollProvider.jumpTo(2),
                      ),
                      CustomAppBarButton(
                        title: 'Contacts',
                        onPressed: () => scrollProvider.jumpTo(3),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

AppBar buildGlassAppBar(double width, BuildContext context, scrollProvider) {
  return AppBar(
    backgroundColor: bgColor.withOpacity(0.1), // semi-transparent
    elevation: 0,
    flexibleSpace: ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15), // blur intensity
        child: Container(
          color: bgColor.withOpacity(0.05), // frosted overlay tint
        ),
      ),
    ),
    title: Padding(
      padding: EdgeInsets.only(left: width > 1024 ? 150 : 10),
      child: Text(
        '<Portfolio/>',
        style: const TextStyle(
          fontFamily: 'Pacifico',
          fontSize: 20,
          color: Colors.white, // text visible on glass
        ),
        textScaler: TextScaler.linear(
          textScaleFactor(context),
        ),
      ),
    ),
    actions: width > 1024
        ? [
            CustomAppBarButton(
              title: 'Home',
              onPressed: () => scrollProvider.jumpTo(0),
            ),
            const SizedBox(width: 10),
            CustomAppBarButton(
              title: 'Services',
              onPressed: () => scrollProvider.jumpTo(1),
            ),
            const SizedBox(width: 10),
            CustomAppBarButton(
              title: 'Projects',
              onPressed: () => scrollProvider.jumpTo(2),
            ),
            const SizedBox(width: 10),
            CustomAppBarButton(
              title: 'Contacts',
              onPressed: () => scrollProvider.jumpTo(3),
            ),
            const SizedBox(width: 100),
          ]
        : null,
  );
}
