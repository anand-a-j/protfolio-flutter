import 'package:flutter/material.dart';
import 'package:portfolio/app/section/main/view/widget/custom_appbar_button.dart';

class FooterNavigationButtons extends StatelessWidget {
  const FooterNavigationButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomAppBarButton(
          title: 'Home',
          onPressed: () {},
        ),
        SizedBox(width: width * 0.006),
        CustomAppBarButton(
          title: 'Services',
          onPressed: () {},
        ),
     SizedBox(width: width * 0.006),
        CustomAppBarButton(
          title: 'Projects',
          onPressed: () {},
        ),
       SizedBox(width: width * 0.006),
        CustomAppBarButton(
          title: 'Contacts',
          onPressed: () {},
        ),
      ],
    );
  }
}
