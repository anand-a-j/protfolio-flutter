import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/utils/colors.dart';
import 'package:portfolio/utils/strings.dart';

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              // first screen-----------------------------------------------------------------------------------
              Stack(
                children: [
                  // Container(
                   
                  //   height: height,
                  //   width: width,
                  //   child: LottieBuilder.asset(
                  //     'assets/lottie/bg.json',
                  //     fit: BoxFit.fitWidth,
                  //   ),
                  // ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 50),
                    height: height ,
                    width: width,
                    // color: Colors.green.shade300,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Hi, I am\nAnand A J",
                                style: TextStyle(
                                    fontSize: 56,
                                    fontWeight: FontWeight.bold,
                                    color: kwhite),
                              ),
                              const Text(
                                "Flutter Developer",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: primaryColor),
                                textAlign: TextAlign.justify,
                              ),
                              Container(
                                // color: Colors.amber,
                                height: MediaQuery.sizeOf(context).height * 0.15,
                                width: MediaQuery.sizeOf(context).width * 0.39,
                                
                                child: const Text(
                                  aboutMe,
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                      color: textSecondary),
                                  textAlign: TextAlign.justify,
                                  maxLines: 3,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Container(
                                height: 50,
                                width: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: buttonGradient),
                                child: const Center(
                                  child: Text(
                                    "Download Resume",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 38, 29, 29),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                              ),
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
                              ),
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: CircleAvatar(
                                    radius: 120,
                                    backgroundColor: Colors.blue.shade200,
                                    backgroundImage: const NetworkImage(
                                        "https://images.unsplash.com/photo-1618641986557-1ecd230959aa?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // project Screen screen-----------------------------------------------------------------------------------
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 150, vertical: 50),
                height: height - 200,
                width: width,
                color: Colors.amber.shade200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
