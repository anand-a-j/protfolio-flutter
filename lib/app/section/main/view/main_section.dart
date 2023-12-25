import 'package:flutter/material.dart';
import 'package:portfolio/app/section/main/view/widget/custom_appbar_button.dart';
import 'package:portfolio/core/providers/scroll_provider.dart';
import 'package:portfolio/app/utils/utils.dart';
import 'package:portfolio/core/utils/colors.dart';
import 'package:portfolio/core/utils/functions.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MainSection extends StatelessWidget {
  const MainSection({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollProvider = Provider.of<ScrollProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 150),
          child: Text(
            '<Portfolio/>',
            style: const TextStyle(fontFamily: 'Pacifico'),
            textScaler: TextScaler.linear(
              textScaleFactor(context),
            ),
          ),
        ),
        actions: [
          CustomAppBarButton(
            title: 'Home',
            onPressed: ()=> scrollProvider.jumpTo(0),
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
        ],
      ),
      body: ScrollablePositionedList.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: body.length,
        itemScrollController: scrollProvider.scrollController,
        itemBuilder: (context, index) => body[index],
      ),
    );
  }
}
