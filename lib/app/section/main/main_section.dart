import 'package:flutter/material.dart';
import 'package:portfolio/core/providers/scroll_provider.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MainSection extends StatelessWidget {
  const MainSection({super.key});

  @override
  Widget build(BuildContext context) {

    final scrollProvider = Provider.of<ScrollProvider>(context, listen: false);
     
    return ScrollablePositionedList.builder(
      padding: EdgeInsets.zero,
      itemCount: body.length, 
      itemScrollController: scrollProvider.scrollController,
      itemBuilder: (context,index) => body[index]
      );
  }
}