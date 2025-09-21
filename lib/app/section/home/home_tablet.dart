import 'package:flutter/material.dart';
import 'package:portfolio/app/section/home/widgets/home_button.dart';
import 'package:portfolio/core/utils/functions.dart';
import 'package:portfolio/core/constants/strings.dart';
import 'package:lottie/lottie.dart';

class HomeTablet extends StatelessWidget {
  const HomeTablet({super.key});

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
                    const EdgeInsets.symmetric(horizontal: 150, vertical: 50),
                height: height,
                width: width,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hi, I am Anand A J",
                            style: Theme.of(context).textTheme.displayMedium,
                            textScaler:
                                TextScaler.linear(textScaleFactor(context)),
                          ),
                          SizedBox(height: width * 0.01),
                          Text(
                            "Flutter Developer",
                            style: Theme.of(context).textTheme.headlineMedium,
                            textAlign: TextAlign.justify,
                            textScaler:
                                TextScaler.linear(textScaleFactor(context)),
                          ),
                          SizedBox(height: width * 0.01),
                          Container(
                            height: MediaQuery.sizeOf(context).height * 0.08,
                            width: MediaQuery.sizeOf(context).width * 0.39,
                            child: Text(
                              aboutMe,
                              style: Theme.of(context).textTheme.titleMedium,
                              textScaler:
                                  TextScaler.linear(textScaleFactor(context)),
                              textAlign: TextAlign.justify,
                              maxLines: 3,
                            ),
                          ),
                          const SizedBox(height: 20),
                          
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            height: double.infinity,
                            width: MediaQuery.sizeOf(context).width * 0.30,
                            margin: const EdgeInsets.all(20),
                            padding: const EdgeInsets.all(15),
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
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),

                          // Positioned.fill(
                          //   child: Align(
                          //     alignment: Alignment.center,
                          //     child: CircleAvatar(
                          //       radius: 120,
                          //       backgroundColor: Colors.blue.shade200,
                          //       backgroundImage: const NetworkImage(
                          //           "https://images.unsplash.com/photo-1618641986557-1ecd230959aa?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"),
                          //     ),
                          //   ),
                          // ),
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
