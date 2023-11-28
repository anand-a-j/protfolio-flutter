import 'package:flutter/material.dart';
import 'package:portfolio/core/providers/scroll_provider.dart';
import 'package:portfolio/app/utils/utils.dart';
import 'package:portfolio/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MainSection extends StatelessWidget {
  const MainSection({super.key});

  @override
  Widget build(BuildContext context) {

    final scrollProvider = Provider.of<ScrollProvider>(context, listen: false);

     TextStyle? navBarTextStyle = const TextStyle(
        fontSize: 18, fontWeight: FontWeight.bold, color: kwhite);
     
    return Scaffold(
     backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text("Home", style: navBarTextStyle),
          ),
          const SizedBox(width: 10),
          TextButton(
            onPressed: () {},
            child: Text("Projects", style: navBarTextStyle),
          ),
          const SizedBox(width: 10),
          TextButton(
            onPressed: () {},
            child: Text("About", style: navBarTextStyle),
          ),
          const SizedBox(width: 100),
        ],
      ),
     body: ScrollablePositionedList.builder(
       shrinkWrap: true,
       padding: EdgeInsets.zero,
       itemCount: body.length, 
       itemScrollController: scrollProvider.scrollController,
       itemBuilder: (context,index) => body[index]
       ),
    );
  }
}