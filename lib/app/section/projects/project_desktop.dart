import 'package:flutter/material.dart';
import 'package:portfolio/app/utils/utils.dart';
import 'package:portfolio/utils/colors.dart';

class ProjectDesktop extends StatelessWidget {
  const ProjectDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 150),
      width: width,
      // color: Colors.amber.shade200,
      child: ListView(
        shrinkWrap: true,
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        
        children: [
          Center(
            child: Text(
              "Projects",
              style: heading2,
            ),
          ),
          SizedBox(height: 40),
          GridView.builder(
            shrinkWrap: true,
            itemCount: 4,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, 
                mainAxisSpacing: 20, 
                crossAxisSpacing: 20,
                childAspectRatio: 1/1.3
                ),
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: card,
                    boxShadow: boxShadow),
                child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.sizeOf(context).height * 0.25,
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://images.unsplash.com/photo-1534670007418-fbb7f6cf32c3?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fHVpJTIwdXh8ZW58MHx8MHx8fDA%3D"),
                          fit: BoxFit.cover
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text("Project Name",style: heading3,),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 100,
                      width: double.infinity,
                      child: Text(
                        "ladksjflk jlaksdj lkasjfl ajslkfd jaslkdfj alsj fla fjals aslkf lkasjlasjfla jklsad lkasl a fjlaksjdf lkaflk ajflksad jlkasj flksaj flkaj laj ljfladsnfaslkfnalkflksadfnadlkcnalkdjf",
                        style: body1,
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis,
                
                        ),
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
