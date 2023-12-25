import 'package:flutter/material.dart';
import 'package:portfolio/app/section/footer/widgets/footer_social_button.dart';
import 'package:portfolio/app/utils/navbar_utils.dart';
import 'package:portfolio/core/providers/scroll_provider.dart';
import 'package:portfolio/core/utils/colors.dart';
import 'package:portfolio/core/utils/functions.dart';
import 'package:provider/provider.dart';

class DrawerMobile extends StatelessWidget {
  const DrawerMobile({super.key});

  @override
  Widget build(BuildContext context) {
    var scrollProvider = context.watch<ScrollProvider>();
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              '<anand/>',
              style: const TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 24,
              ),
              textScaler: TextScaler.linear(
                textScaleFactor(context),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            ListView(
              shrinkWrap: true,
              children: [
                ...NavBarUtils.names.asMap().entries.map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: MaterialButton(
                          hoverColor: primaryColor.withAlpha(55),
                          shape: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide.none
                          ),
                          onPressed: () {
                            scrollProvider.jumpTo(e.key);
                            Navigator.pop(context);
                          },
                          child: ListTile(
                            leading: Icon(NavBarUtils.icons[e.key],color: kwhite,),
                            title: Text(
                              e.value,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ),
                      ),
                    ),
              ],
            ),
            const Spacer(),
            const FooterSocialButtons(),
            const SizedBox(height: 15)
          ],
        ),
      ),
    );
  }
}
