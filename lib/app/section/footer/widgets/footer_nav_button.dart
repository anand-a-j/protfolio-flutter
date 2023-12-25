import 'package:flutter/material.dart';
import 'package:portfolio/app/section/main/view/widget/custom_appbar_button.dart';
import 'package:portfolio/core/providers/scroll_provider.dart';
import 'package:provider/provider.dart';

class FooterNavigationButtons extends StatelessWidget {
  const FooterNavigationButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final scrollProvider = Provider.of<ScrollProvider>(context, listen: false);
    var width = MediaQuery.sizeOf(context).width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomAppBarButton(
          title: 'Home',
          onPressed: () => scrollProvider.jumpTo(0),
        ),
        SizedBox(width: width * 0.006),
        CustomAppBarButton(
          title: 'Services',
          onPressed: () => scrollProvider.jumpTo(1),
        ),
     SizedBox(width: width * 0.006),
        CustomAppBarButton(
          title: 'Projects',
          onPressed: () => scrollProvider.jumpTo(2),
        ),
       SizedBox(width: width * 0.006),
        CustomAppBarButton(
          title: 'Contacts',
          onPressed: () => scrollProvider.jumpTo(3),
        ),
      ],
    );
  }
}
