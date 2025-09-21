import 'package:flutter/material.dart';
import 'package:portfolio/app/section/home/widgets/home_button.dart';
import 'package:portfolio/core/utils/functions.dart';
import 'package:portfolio/core/constants/strings.dart';
import 'package:lottie/lottie.dart';

class HomeMobile extends StatelessWidget {
  const HomeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              // Container(
              //   height: height - 150,
              //   width: width,
              //   child: LottieBuilder.asset(
              //     'assets/lottie/spacebg.json',
              //     height: height - 300,
              //     width: width,
              //     fit: BoxFit.cover,
              //   ),
              // ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: height,
                width: width,
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        height: width * 0.7,
                        width: width * 0.7,
                        margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                        decoration: BoxDecoration(
                       
                            // image: DecorationImage(
                            //   image: NetworkImage(
                            //       "https://images.unsplash.com/photo-1445233566136-a2a4e2c38bc2?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8YmFja2dyb3VuZCUyMHNwYWNlfGVufDB8fDB8fHww"),
                            //   fit: BoxFit.cover,
                            // ),
                            ),
                        child: Center(
                          child: LottieBuilder.asset(
                            'assets/lottie/coder.json',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Hi, I am Anand A J",
                            style: Theme.of(context).textTheme.displayMedium,
                            textScaler:
                                TextScaler.linear(textScaleFactor(context)),
                          ),
                          SizedBox(height: width * 0.015),
                          Text(
                            "Flutter Developer",
                            style: Theme.of(context).textTheme.headlineMedium,
                            textAlign: TextAlign.justify,
                            textScaler:
                                TextScaler.linear(textScaleFactor(context)),
                          ),
                          SizedBox(height: width * 0.01),
                          Container(                        
                            width: double.infinity,
                             margin: const EdgeInsets.symmetric(horizontal: 50),
                            child: Text(
                              aboutMe,
                              style: Theme.of(context).textTheme.titleMedium,
                              textScaler:
                                  TextScaler.linear(textScaleFactor(context)),
                              textAlign: TextAlign.center,
                              maxLines: 3,
                            ),
                          ),
                           SizedBox(height: height*0.05),
                
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
