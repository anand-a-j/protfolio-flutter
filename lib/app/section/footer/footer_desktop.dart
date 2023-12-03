import 'package:flutter/material.dart';
import 'package:portfolio/utils/colors.dart';

class FooterDesktop extends StatelessWidget {
  const FooterDesktop({super.key});

  @override
  Widget build(BuildContext context) {
     TextStyle? navBarTextStyle = const TextStyle(
        fontSize: 18, fontWeight: FontWeight.bold, color: kwhite);
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        color: primaryColor.withAlpha(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Text("Anand A J",style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: primaryColor
          ),),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
            
            ],
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.facebook,color: kwhite,size: 30),
              const SizedBox(width: 15),
              Icon(Icons.facebook, color: kwhite, size: 30),
              const SizedBox(width: 15),
              Icon(Icons.facebook, color: kwhite, size: 30),
              const SizedBox(width: 15),
              Icon(Icons.facebook, color: kwhite, size: 30),
              const SizedBox(width: 15),
            ],
          ),
          const SizedBox(height: 20),
          Text("Made with ❤️, Created by Anand.",style: TextStyle(fontSize: 24,color: kwhite),)
        ],
      ),
    );
  }
}